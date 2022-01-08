<?php

namespace Botble\ACL\Tables;

use BaseHelper;
use Html;
use Illuminate\Support\Facades\Auth;
use Botble\ACL\Repositories\Interfaces\RoleInterface;
use Botble\ACL\Repositories\Interfaces\UserInterface;
use Botble\Table\Abstracts\TableAbstract;
use Illuminate\Contracts\Routing\UrlGenerator;
use Yajra\DataTables\DataTables;

class RoleTable extends TableAbstract
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
     * @var UserInterface
     */
    protected $userRepository;

    /**
     * RoleTable constructor.
     * @param DataTables $table
     * @param UrlGenerator $urlGenerator
     * @param RoleInterface $roleRepository
     * @param UserInterface $userRepository
     */
    public function __construct(
        DataTables $table,
        UrlGenerator $urlGenerator,
        RoleInterface $roleRepository,
        UserInterface $userRepository
    ) {
        parent::__construct($table, $urlGenerator);

        $this->repository = $roleRepository;
        $this->userRepository = $userRepository;

        if (!Auth::user()->hasAnyPermission(['roles.edit', 'roles.destroy'])) {
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
            ->editColumn('name', function ($item) {
                if (!Auth::user()->hasPermission('roles.edit')) {
                    return $item->name;
                }

                return Html::link(route('roles.edit', $item->id), $item->name);
            })
            ->editColumn('checkbox', function ($item) {
                return $this->getCheckbox($item->id);
            })
            ->editColumn('created_at', function ($item) {
                return BaseHelper::formatDate($item->created_at);
            })
            ->editColumn('created_by', function ($item) {
                return $item->author->name;
            })
            ->addColumn('operations', function ($item) {
                return $this->getOperations('roles.edit', 'roles.destroy', $item);
            });

        return $this->toJson($data);
    }

    /**
     * {@inheritDoc}
     */
    public function query()
    {
        $query = $this->repository->getModel()
            ->with('author')
            ->select([
                'id',
                'name',
                'description',
                'created_at',
                'created_by',
            ]);

        return $this->applyScopes($query);
    }

    /**
     * {@inheritDoc}
     */
    public function columns()
    {
        return [
            'id'          => [
                'title' => trans('core/base::tables.id'),
                'width' => '20px',
            ],
            'name'        => [
                'title' => trans('core/base::tables.name'),
            ],
            'description' => [
                'title' => trans('core/base::tables.description'),
                'class' => 'text-start',
            ],
            'created_at'  => [
                'title' => trans('core/base::tables.created_at'),
                'width' => '100px',
            ],
            'created_by'  => [
                'title' => trans('core/acl::permissions.created_by'),
                'width' => '100px',
            ],
        ];
    }

    /**
     * {@inheritDoc}
     */
    public function buttons()
    {
        return $this->addCreateButton(route('roles.create'), 'roles.create');
    }

    /**
     * {@inheritDoc}
     */
    public function bulkActions(): array
    {
        return $this->addDeleteAction(route('roles.deletes'), 'roles.destroy', parent::bulkActions());
    }

    /**
     * {@inheritDoc}
     */
    public function getBulkChanges(): array
    {
        return [
            'name' => [
                'title'    => trans('core/base::tables.name'),
                'type'     => 'text',
                'validate' => 'required|max:120',
            ],
        ];
    }
}
