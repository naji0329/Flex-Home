<?php

namespace Botble\ACL\Tables;

use BaseHelper;
use Illuminate\Support\Facades\Auth;
use Botble\ACL\Enums\UserStatusEnum;
use Botble\ACL\Repositories\Interfaces\ActivationInterface;
use Botble\ACL\Repositories\Interfaces\UserInterface;
use Botble\ACL\Services\ActivateUserService;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Table\Abstracts\TableAbstract;
use Exception;
use Html;
use Illuminate\Contracts\Routing\UrlGenerator;
use Illuminate\Support\Arr;
use Yajra\DataTables\DataTables;

class UserTable extends TableAbstract
{

    /**
     * @var bool
     */
    protected $hasActions = true;

    /**
     * @var bool
     */
    protected $hasFilter = true;

    /**
     * @var ActivateUserService
     */
    protected $service;

    /**
     * UserTable constructor.
     * @param DataTables $table
     * @param UrlGenerator $urlGenerator
     * @param UserInterface $userRepository
     * @param ActivateUserService $service
     */
    public function __construct(
        DataTables $table,
        UrlGenerator $urlGenerator,
        UserInterface $userRepository,
        ActivateUserService $service
    ) {
        parent::__construct($table, $urlGenerator);

        $this->repository = $userRepository;
        $this->service = $service;

        if (!Auth::user()->hasAnyPermission(['users.edit', 'users.destroy'])) {
            $this->hasOperations = false;
            $this->hasActions = false;
        }
    }

    /**
     * {@inheritDoc}
     */
    public function ajax()
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('checkbox', function ($item) {
                return $this->getCheckbox($item->id);
            })
            ->editColumn('username', function ($item) {
                if (!Auth::user()->hasPermission('users.edit')) {
                    return $item->username;
                }

                return Html::link(route('users.profile.view', $item->id), $item->username);
            })
            ->editColumn('created_at', function ($item) {
                return BaseHelper::formatDate($item->created_at);
            })
            ->editColumn('role_name', function ($item) {
                if (!Auth::user()->hasPermission('users.edit')) {
                    return $item->role_name;
                }

                return view('core/acl::users.partials.role', ['item' => $item])->render();
            })
            ->editColumn('super_user', function ($item) {
                return $item->super_user ? trans('core/base::base.yes') : trans('core/base::base.no');
            })
            ->editColumn('status', function ($item) {
                if (app(ActivationInterface::class)->completed($item)) {
                    return UserStatusEnum::ACTIVATED()->toHtml();
                }

                return UserStatusEnum::DEACTIVATED()->toHtml();
            })
            ->removeColumn('role_id')
            ->addColumn('operations', function ($item) {

                $action = null;
                if (Auth::user()->isSuperUser()) {
                    $action = Html::link(route('users.make-super', $item->id), trans('core/acl::users.make_super'),
                        ['class' => 'btn btn-info'])->toHtml();

                    if ($item->super_user) {
                        $action = Html::link(route('users.remove-super', $item->id), trans('core/acl::users.remove_super'),
                            ['class' => 'btn btn-danger'])->toHtml();
                    }
                }

                return apply_filters(ACL_FILTER_USER_TABLE_ACTIONS,
                    $action . view('core/acl::users.partials.actions', ['item' => $item])->render(), $item);
            });

        return $this->toJson($data);
    }

    /**
     * {@inheritDoc}
     */
    public function query()
    {
        $query = $this->repository->getModel()
            ->leftJoin('role_users', 'users.id', '=', 'role_users.user_id')
            ->leftJoin('roles', 'roles.id', '=', 'role_users.role_id')
            ->select([
                'users.id as id',
                'username',
                'email',
                'roles.name as role_name',
                'roles.id as role_id',
                'users.updated_at as updated_at',
                'users.created_at as created_at',
                'super_user',
            ]);

        return $this->applyScopes($query);
    }

    /**
     * {@inheritDoc}
     */
    public function columns()
    {
        return [
            'username'   => [
                'title' => trans('core/acl::users.username'),
                'class' => 'text-start',
            ],
            'email'      => [
                'title' => trans('core/acl::users.email'),
                'class' => 'text-start',
            ],
            'role_name'  => [
                'title'      => trans('core/acl::users.role'),
                'searchable' => false,
            ],
            'created_at' => [
                'title' => trans('core/base::tables.created_at'),
                'width' => '100px',
            ],
            'status'     => [
                'name'  => 'users.updated_at',
                'title' => trans('core/base::tables.status'),
                'width' => '100px',
            ],
            'super_user' => [
                'title' => trans('core/acl::users.is_super'),
                'width' => '100px',
            ],
        ];
    }

    /**
     * {@inheritDoc}
     */
    public function buttons()
    {
        return $this->addCreateButton(route('users.create'), 'users.create');
    }

    /**
     * {@inheritDoc}
     */
    public function htmlDrawCallbackFunction(): ?string
    {
        return parent::htmlDrawCallbackFunction() . '$(".editable").editable({mode: "inline"});';
    }

    /**
     * {@inheritDoc}
     */
    public function bulkActions(): array
    {
        return $this->addDeleteAction(route('users.deletes'), 'users.destroy', parent::bulkActions());
    }

    /**
     * {@inheritDoc}
     */
    public function getFilters(): array
    {
        $filters = $this->getBulkChanges();
        Arr::forget($filters, 'status');

        return $filters;
    }

    /**
     * {@inheritDoc}
     */
    public function getBulkChanges(): array
    {
        return [
            'username'   => [
                'title'    => trans('core/acl::users.username'),
                'type'     => 'text',
                'validate' => 'required|max:120',
            ],
            'email'      => [
                'title'    => trans('core/base::tables.email'),
                'type'     => 'text',
                'validate' => 'required|max:120|email',
            ],
            'status'     => [
                'title'    => trans('core/base::tables.status'),
                'type'     => 'customSelect',
                'choices'  => UserStatusEnum::labels(),
                'validate' => 'required|in:' . implode(',', UserStatusEnum::values()),
            ],
            'created_at' => [
                'title' => trans('core/base::tables.created_at'),
                'type'  => 'date',
            ],
        ];
    }

    /**
     * {@inheritDoc}
     */
    public function getOperationsHeading()
    {
        return [
            'operations' => [
                'title'      => trans('core/base::tables.operations'),
                'width'      => '350px',
                'class'      => 'text-end',
                'orderable'  => false,
                'searchable' => false,
                'exportable' => false,
                'printable'  => false,
            ],
        ];
    }

    /**
     * {@inheritDoc}
     */
    public function saveBulkChanges(array $ids, string $inputKey, ?string $inputValue): bool
    {
        if (app()->environment('demo')) {
            throw new Exception(trans('core/base::system.disabled_in_demo_mode'));
        }

        if ($inputKey === 'status') {

            $hasWarning = false;

            foreach ($ids as $id) {
                if ($inputValue == UserStatusEnum::DEACTIVATED && Auth::id() == $id) {
                    $hasWarning = true;
                }

                $user = $this->repository->findOrFail($id);

                if ($inputValue == UserStatusEnum::ACTIVATED) {
                    $this->service->activate($user);
                } else {
                    app(ActivationInterface::class)->remove($user);
                }

                event(new UpdatedContentEvent(USER_MODULE_SCREEN_NAME, request(), $user));
            }

            if ($hasWarning) {
                throw new Exception(trans('core/acl::users.lock_user_logged_in'));
            }

            return true;
        }

        return parent::saveBulkChanges($ids, $inputKey, $inputValue);
    }
}
