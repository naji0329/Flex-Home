<?php

namespace Botble\RealEstate\Tables;

use BaseHelper;
use Botble\RealEstate\Repositories\Interfaces\AccountInterface;
use Botble\Table\Abstracts\TableAbstract;
use Html;
use Illuminate\Contracts\Routing\UrlGenerator;
use Illuminate\Support\Facades\Auth;
use RvMedia;
use Yajra\DataTables\DataTables;

class AccountTable extends TableAbstract
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
     * AccountTable constructor.
     * @param DataTables $table
     * @param UrlGenerator $urlGenerator
     * @param AccountInterface $accountRepository
     */
    public function __construct(DataTables $table, UrlGenerator $urlGenerator, AccountInterface $accountRepository)
    {
        parent::__construct($table, $urlGenerator);

        $this->repository = $accountRepository;

        if (!Auth::user()->hasAnyPermission(['account.edit', 'account.destroy'])) {
            $this->hasOperations = false;
            $this->hasActions = false;
        }
    }

    /**
     * Display ajax response.
     *
     * @return \Illuminate\Http\JsonResponse
     *
     * @since 2.1
     */
    public function ajax()
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('first_name', function ($item) {
                if (!Auth::user()->hasPermission('account.edit')) {
                    return clean($item->name);
                }

                return Html::link(route('account.edit', $item->id), clean($item->name));
            })
            ->editColumn('avatar_id', function ($item) {
                return Html::image(RvMedia::getImageUrl($item->avatar->url, 'thumb', false, RvMedia::getDefaultImage()),
                    clean($item->name), ['width' => 50]);
            })
            ->editColumn('checkbox', function ($item) {
                return $this->getCheckbox($item->id);
            })
            ->editColumn('created_at', function ($item) {
                return BaseHelper::formatDate($item->created_at);
            })
            ->editColumn('phone', function ($item) {
                return clean($item->phone ?: '&mdash;');
            })
            ->editColumn('updated_at', function ($item) {
                return $item->properties_count;
            })
            ->addColumn('operations', function ($item) {
                return $this->getOperations('account.edit', 'account.destroy', $item);
            });

        return $this->toJson($data);
    }

    /**
     * Get the query object to be processed by the table.
     *
     * @return \Illuminate\Database\Query\Builder|\Illuminate\Database\Eloquent\Builder
     *
     * @since 2.1
     */
    public function query()
    {
        $query = $this->repository
            ->getModel()
            ->select([
                'id',
                'first_name',
                'last_name',
                'email',
                'phone',
                'created_at',
                'credits',
                'avatar_id',
            ])
            ->with(['avatar'])
            ->withCount(['properties']);

        return $this->applyScopes($query);
    }

    /**
     * @return array
     *
     * @since 2.1
     */
    public function columns()
    {
        return [
            'id'         => [
                'title' => trans('core/base::tables.id'),
                'width' => '20px',
            ],
            'avatar_id'  => [
                'title' => trans('core/base::tables.image'),
                'width' => '70px',
            ],
            'first_name' => [
                'title' => trans('core/base::tables.name'),
                'class' => 'text-start',
            ],
            'email'      => [
                'title' => trans('core/base::tables.email'),
                'class' => 'text-start',
            ],
            'phone'    => [
                'title' => trans('plugins/real-estate::account.phone'),
                'class' => 'text-start',
            ],
            'credits'    => [
                'title' => trans('plugins/real-estate::account.credits'),
                'class' => 'text-start',
            ],
            'updated_at' => [
                'title'      => trans('plugins/real-estate::account.number_of_properties'),
                'width'      => '100px',
                'class'      => 'no-sort',
                'orderable'  => false,
                'searchable' => false,
            ],
            'created_at' => [
                'title' => trans('core/base::tables.created_at'),
                'width' => '100px',
            ],
        ];
    }

    /**
     * @return array
     *
     * @throws \Throwable
     * @since 2.1
     */
    public function buttons()
    {
        return $this->addCreateButton(route('account.create'), 'account.create');
    }

    /**
     * @return array
     * @throws \Throwable
     */
    public function bulkActions(): array
    {
        return $this->addDeleteAction(route('account.deletes'), 'account.destroy', parent::bulkActions());
    }

    /**
     * @return array
     */
    public function getBulkChanges(): array
    {
        return [
            'first_name' => [
                'title'    => trans('plugins/real-estate::account.first_name'),
                'type'     => 'text',
                'validate' => 'required|max:120',
            ],
            'last_name'  => [
                'title'    => trans('plugins/real-estate::account.last_name'),
                'type'     => 'text',
                'validate' => 'required|max:120',
            ],
            'email'      => [
                'title'    => trans('core/base::tables.email'),
                'type'     => 'text',
                'validate' => 'required|max:120|email',
            ],
            'created_at' => [
                'title' => trans('core/base::tables.created_at'),
                'type'  => 'date',
            ],
        ];
    }
}
