<?php

namespace Botble\Table\Abstracts;

use Assets;
use BaseHelper;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Support\Repositories\Interfaces\RepositoryInterface;
use Botble\Table\Supports\TableExportHandler;
use Form;
use Html;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\Routing\UrlGenerator;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Query\Builder;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\HtmlString;
use Illuminate\Support\Str;
use Illuminate\View\View;
use Request;
use RvMedia;
use Throwable;
use Yajra\DataTables\DataTables;
use Yajra\DataTables\QueryDataTable;
use Yajra\DataTables\Services\DataTable;

abstract class TableAbstract extends DataTable
{

    const TABLE_TYPE_ADVANCED = 'advanced';

    const TABLE_TYPE_SIMPLE = 'simple';

    /**
     * @var bool
     */
    protected $bStateSave = true;

    /**
     * @var DataTables
     */
    protected $table;

    /**
     * @var string
     */
    protected $type = self::TABLE_TYPE_ADVANCED;

    /**
     * @var string
     */
    protected $ajaxUrl;

    /**
     * @var int
     */
    protected $pageLength = 10;

    /**
     * @var string
     */
    protected $view = 'core/table::table';

    /**
     * @var string
     */
    protected $filterTemplate = 'core/table::filter';

    /**
     * @var array
     */
    protected $options = [];

    /**
     * @var bool
     */
    protected $hasCheckbox = true;

    /**
     * @var bool
     */
    protected $hasOperations = true;

    /**
     * @var bool
     */
    protected $hasActions = false;

    /**
     * @var string
     */
    protected $bulkChangeUrl = '';

    /**
     * @var bool
     */
    protected $hasFilter = false;

    /**
     * @var RepositoryInterface
     */
    protected $repository;

    /**
     * @var bool
     */
    protected $useDefaultSorting = true;

    /**
     * @var int
     */
    protected $defaultSortColumn = 1;

    /**
     * @var string
     */
    protected $exportClass = TableExportHandler::class;

    /**
     * TableAbstract constructor.
     * @param DataTables $table
     * @param UrlGenerator $urlGenerator
     */
    public function __construct(Datatables $table, UrlGenerator $urlGenerator)
    {
        $this->table = $table;
        $this->ajaxUrl = $urlGenerator->current();

        if ($this->type == self::TABLE_TYPE_SIMPLE) {
            $this->pageLength = -1;
        }

        if (!$this->getOption('id')) {
            $this->setOption('id', strtolower(Str::slug(Str::snake(get_class($this)))));
        }

        if (!$this->getOption('class')) {
            $this->setOption('class', 'table table-striped table-hover vertical-middle');
        }

        $this->bulkChangeUrl = route('tables.bulk-change.save');
    }

    /**
     * @param string $key
     * @return string
     */
    public function getOption(string $key): ?string
    {
        return Arr::get($this->options, $key);
    }

    /**
     * @param string $key
     * @param mixed $value
     * @return $this
     */
    public function setOption(string $key, $value): self
    {
        $this->options[$key] = $value;

        return $this;
    }

    /**
     * @return bool
     */
    public function isHasFilter(): bool
    {
        return $this->hasFilter;
    }

    /**
     * @param bool $hasFilter
     * @return $this
     */
    public function setHasFilter(bool $hasFilter): self
    {
        $this->hasFilter = $hasFilter;

        return $this;
    }

    /**
     * @return RepositoryInterface
     */
    public function getRepository(): RepositoryInterface
    {
        return $this->repository;
    }

    /**
     * @return string
     */
    public function getType(): string
    {
        return $this->type;
    }

    /**
     * @param string $type
     * @return $this
     */
    public function setType(string $type): self
    {
        $this->type = $type;

        return $this;
    }

    /**
     * @return string
     */
    public function getView(): string
    {
        return $this->view;
    }

    /**
     * @param string $view
     * @return $this
     */
    public function setView(string $view): self
    {
        $this->view = $view;

        return $this;
    }

    /**
     * @return array
     */
    public function getOptions(): array
    {
        return $this->options;
    }

    /**
     * @param array $options
     * @return $this
     */
    public function setOptions(array $options): self
    {
        $this->options = array_merge($this->options, $options);

        return $this;
    }

    /**
     * Optional method if you want to use html builder.
     *
     * @return \Yajra\DataTables\Html\Builder
     *
     * @throws Throwable
     * @since 2.1
     */
    public function html()
    {
        if ($this->request->has('filter_table_id')) {
            $this->bStateSave = false;
        }

        return $this->builder()
            ->columns($this->getColumns())
            ->ajax(['url' => $this->getAjaxUrl(), 'method' => 'POST'])
            ->parameters([
                'dom'          => $this->getDom(),
                'buttons'      => $this->getBuilderParameters(),
                'initComplete' => $this->htmlInitComplete(),
                'drawCallback' => $this->htmlDrawCallback(),
                'paging'       => true,
                'searching'    => true,
                'info'         => true,
                'searchDelay'  => 350,
                'bStateSave'   => $this->bStateSave,
                'lengthMenu'   => Arr::sortRecursive([
                    array_values(array_unique(array_merge([10, 30, 50, 100, 500], [$this->pageLength, -1]))),
                    array_values(array_unique(array_merge([10, 30, 50, 100, 500],
                        [$this->pageLength, trans('core/base::tables.all')]))),
                ]),
                'pageLength'   => $this->pageLength,
                'processing'   => true,
                'serverSide'   => true,
                'bServerSide'  => true,
                'bDeferRender' => true,
                'bProcessing'  => true,
                'language'     => [
                    'aria'              => [
                        'sortAscending'  => 'orderby asc',
                        'sortDescending' => 'orderby desc',
                        'paginate'       => [
                            'next'     => trans('pagination.next'),
                            'previous' => trans('pagination.previous'),
                        ],
                    ],
                    'emptyTable'        => trans('core/base::tables.no_data'),
                    'info'              => view('core/table::table-info')->render(),
                    'infoEmpty'         => trans('core/base::tables.no_record'),
                    'lengthMenu'        => Html::tag('span', '_MENU_', ['class' => 'dt-length-style'])->toHtml(),
                    'search'            => '',
                    'searchPlaceholder' => trans('core/table::table.search'),
                    'zeroRecords'       => trans('core/base::tables.no_record'),
                    'processing'        => Html::image(url('vendor/core/core/base/images/loading-spinner-blue.gif')),
                    'paginate'          => [
                        'next'     => trans('pagination.next'),
                        'previous' => trans('pagination.previous'),
                    ],
                    'infoFiltered'      => trans('core/table::table.filtered'),
                ],
                'aaSorting'    => $this->useDefaultSorting ? [
                    [
                        ($this->hasCheckbox ? $this->defaultSortColumn : 0),
                        'desc',
                    ],
                ] : [],
                'responsive'   => true,
                'autoWidth'    => false,
            ]);
    }

    /**
     * @return array
     * @since 2.1
     */
    public function getColumns(): array
    {
        $columns = $this->columns();

        if ($this->type == self::TABLE_TYPE_SIMPLE) {
            return apply_filters(BASE_FILTER_TABLE_HEADINGS, $columns, $this->repository->getModel());
        }

        foreach ($columns as $key => &$column) {
            $column['class'] = Arr::get($column, 'class') . ' column-key-' . $key;
        }

        if ($this->repository) {
            $columns = apply_filters(BASE_FILTER_TABLE_HEADINGS, $columns, $this->repository->getModel());
        }

        if ($this->hasOperations) {
            $columns = array_merge($columns, $this->getOperationsHeading());
        }

        if ($this->hasCheckbox) {
            $columns = array_merge($this->getCheckboxColumnHeading(), $columns);
        }

        return $columns;
    }

    /**
     * @return array
     * @since 2.1
     */
    abstract public function columns();

    /**
     * @return array
     */
    public function getOperationsHeading()
    {
        return [
            'operations' => [
                'title'      => trans('core/base::tables.operations'),
                'width'      => '134px',
                'class'      => 'text-center',
                'orderable'  => false,
                'searchable' => false,
                'exportable' => false,
                'printable'  => false,
            ],
        ];
    }

    /**
     * @param string|null $edit
     * @param string|null $delete
     * @param mixed $item
     * @param string|null $extra
     * @return string
     * @throws Throwable
     */
    protected function getOperations(?string $edit, ?string $delete, $item, ?string $extra = null): string
    {
        return apply_filters('table_operation_buttons', table_actions($edit, $delete, $item, $extra), $item, $edit, $delete, $extra);
    }

    /**
     * @return array
     */
    public function getCheckboxColumnHeading()
    {
        return [
            'checkbox' => [
                'width'      => '10px',
                'class'      => 'text-start no-sort',
                'title'      => Form::input('checkbox', null, null, [
                    'class'    => 'table-check-all',
                    'data-set' => '.dataTable .checkboxes',
                ])->toHtml(),
                'orderable'  => false,
                'searchable' => false,
                'exportable' => false,
                'printable'  => false,
            ],
        ];
    }

    /**
     * @param int $id
     * @return string
     * @throws Throwable
     */
    protected function getCheckbox($id): string
    {
        return table_checkbox($id);
    }

    /**
     * @return string
     */
    public function getAjaxUrl(): string
    {
        return $this->ajaxUrl;
    }

    /**
     * @param string $ajaxUrl
     * @return $this
     */
    public function setAjaxUrl(string $ajaxUrl): self
    {
        $this->ajaxUrl = $ajaxUrl;

        return $this;
    }

    /**
     * @return null|string
     */
    protected function getDom(): ?string
    {
        $dom = null;

        switch ($this->type) {
            case self::TABLE_TYPE_ADVANCED:
                $dom = "fBrt<'datatables__info_wrap'pli<'clearfix'>>";
                break;
            case self::TABLE_TYPE_SIMPLE:
                $dom = "t<'datatables__info_wrap'<'clearfix'>>";
                break;
        }

        return $dom;
    }

    /**
     * @return array
     * @throws Throwable
     * @since 2.1
     */
    public function getBuilderParameters(): array
    {
        $params = [
            'stateSave' => true,
        ];

        if ($this->type == self::TABLE_TYPE_SIMPLE) {
            return $params;
        }

        $buttons = array_merge($this->getButtons(), $this->getActionsButton());

        $buttons = array_merge($buttons, $this->getDefaultButtons());
        if (!$buttons) {
            return $params;
        }

        return $params + compact('buttons');
    }

    /**
     * @return array
     * @since 2.1
     */
    public function getButtons(): array
    {
        $buttons = apply_filters(BASE_FILTER_TABLE_BUTTONS, $this->buttons(), get_class($this->repository->getModel()));

        if (!$buttons) {
            return [];
        }

        $data = [];

        foreach ($buttons as $key => $button) {
            if (Arr::get($button, 'extend') == 'collection') {
                $data[] = $button;
            } else {
                $data[] = [
                    'className' => 'action-item',
                    'text'      => Html::tag('span', $button['text'], [
                        'data-action' => $key,
                        'data-href'   => Arr::get($button, 'link'),
                    ])->toHtml(),
                ];
            }
        }

        return $data;
    }

    /**
     * @return array
     * @throws Throwable
     * @since 2.1
     */
    public function buttons()
    {
        return [];
    }

    /**
     * @return array
     * @throws Throwable
     */
    public function getActionsButton(): array
    {
        if (!$this->getActions()) {
            return [];
        }

        return [
            [
                'extend'  => 'collection',
                'text'    => '<span>' . trans('core/base::forms.actions') . ' <span class="caret"></span></span>',
                'buttons' => $this->getActions(),
            ],
        ];
    }

    /**
     * @return array
     * @throws Throwable
     * @since 2.1
     */
    public function getActions(): array
    {
        if ($this->type == self::TABLE_TYPE_SIMPLE || !$this->actions()) {
            return [];
        }

        $actions = [];

        foreach ($this->actions() as $key => $action) {
            $actions[] = [
                'className' => 'action-item',
                'text'      => '<span data-action="' . $key . '" data-href="' . $action['link'] . '"> ' . $action['text'] . '</span>',
            ];
        }
        return $actions;
    }

    /**
     * @return array
     * @since 2.1
     */
    public function actions()
    {
        return [];
    }

    /**
     * @return array
     * @throws Throwable
     */
    public function getDefaultButtons(): array
    {
        return [
            'reload',
        ];
    }

    /**
     * @return string
     */
    public function htmlInitComplete(): ?string
    {
        return 'function () {' . $this->htmlInitCompleteFunction() . '}';
    }

    /**
     * @return string
     */
    public function htmlInitCompleteFunction(): ?string
    {
        return '
            if (jQuery().select2) {
                $(document).find(".select-multiple").select2({
                    width: "100%",
                    allowClear: true,
                    placeholder: $(this).data("placeholder")
                });
                $(document).find(".select-search-full").select2({
                    width: "100%"
                });
                $(document).find(".select-full").select2({
                    width: "100%",
                    minimumResultsForSearch: -1
                });
            }
        ';
    }

    /**
     * @return string
     */
    public function htmlDrawCallback(): ?string
    {
        if ($this->type == self::TABLE_TYPE_SIMPLE) {
            return null;
        }

        return 'function () {' . $this->htmlDrawCallbackFunction() . '}';
    }

    /**
     * @return string
     */
    public function htmlDrawCallbackFunction(): ?string
    {
        return '
            var pagination = $(this).closest(".dataTables_wrapper").find(".dataTables_paginate");
            pagination.toggle(this.api().page.info().pages > 1);

            var data_count = this.api().data().count();

            var length_select = $(this).closest(".dataTables_wrapper").find(".dataTables_length");
            var length_info = $(this).closest(".dataTables_wrapper").find(".dataTables_info");
            length_select.toggle(data_count >= 10);
            length_info.toggle(data_count > 0);

            if (jQuery().select2) {
                $(document).find(".select-multiple").select2({
                    width: "100%",
                    allowClear: true,
                    placeholder: $(this).data("placeholder")
                });
                $(document).find(".select-search-full").select2({
                    width: "100%"
                });
                $(document).find(".select-full").select2({
                    width: "100%",
                    minimumResultsForSearch: -1
                });
            }

            $("[data-bs-toggle=tooltip]").tooltip({
                placement: "top"
            });
        ';
    }

    /**
     * @param array $data
     * @param array $mergeData
     * @return JsonResponse|View
     * @throws Throwable
     * @since 2.4
     */
    public function renderTable($data = [], $mergeData = [])
    {
        return $this->render($this->view, $data, $mergeData);
    }

    /**
     * @param string $view
     * @param array $data
     * @param array $mergeData
     * @return mixed
     * @throws Throwable
     */
    public function render($view, $data = [], $mergeData = [])
    {
        Assets::addScripts(['datatables', 'moment', 'datepicker'])
            ->addStyles(['datatables', 'datepicker'])
            ->addStylesDirectly('vendor/core/core/table/css/table.css')
            ->addScriptsDirectly([
                'vendor/core/core/base/libraries/bootstrap3-typeahead.min.js',
                'vendor/core/core/table/js/table.js',
                'vendor/core/core/table/js/filter.js',
            ]);

        $data['id'] = Arr::get($data, 'id', $this->getOption('id'));
        $data['class'] = Arr::get($data, 'class', $this->getOption('class'));

        $this->setAjaxUrl($this->ajaxUrl . '?' . http_build_query(request()->input()));

        $this->setOptions($data);

        $data['actions'] = $this->hasActions ? $this->bulkActions() : [];

        $data['table'] = $this;

        return parent::render($view, $data, $mergeData);
    }

    /**
     * @return array
     * @throws Throwable
     */
    public function bulkActions(): array
    {
        $actions = [];

        if ($this->getBulkChanges()) {
            $actions['bulk-change'] = view('core/table::bulk-changes', [
                'bulk_changes' => $this->getBulkChanges(),
                'class'        => get_class($this),
                'url'          => $this->bulkChangeUrl,
            ])->render();
        }

        return $actions;
    }

    /**
     * @return array
     */
    public function getBulkChanges(): array
    {
        return [];
    }

    /**
     * @param \Illuminate\Database\Eloquent\Builder|Builder $query
     * @return mixed
     */
    public function applyScopes($query)
    {
        $request = request();

        $requestFilters = [];

        if ($request->has('filter_columns') && ($request->input('filter_table_id') == $this->getOption('id'))) {
            $requestFilters = [];
            foreach ($request->input('filter_columns') as $key => $item) {
                $operator = $request->input('filter_operators.' . $key);

                $value = $request->input('filter_values.' . $key);

                if (is_array($operator) || is_array($value) || is_array($item)) {
                    continue;
                }

                $requestFilters[] = [
                    'column'   => $item,
                    'operator' => $operator,
                    'value'    => $value,
                ];
            }
        }

        foreach ($requestFilters as $requestFilter) {
            if (isset($requestFilter['column']) && !empty($requestFilter['column'])) {
                $query = $this->applyFilterCondition(
                    $query,
                    $requestFilter['column'],
                    $requestFilter['operator'],
                    $requestFilter['value']
                );
            }
        }

        return parent::applyScopes(apply_filters(BASE_FILTER_TABLE_QUERY, $query));
    }

    /**
     * @param Builder $query
     * @param string $key
     * @param string $operator
     * @param string $value
     * @return Builder
     */
    public function applyFilterCondition($query, string $key, string $operator, ?string $value)
    {
        if (strpos($key, '.') !== -1) {
            $key = Arr::last(explode('.', $key));
        }

        switch ($key) {
            case 'created_at':
            case 'updated_at':
                if (!$value) {
                    break;
                }

                $value = BaseHelper::formatDate($value);
                $query = $query->whereDate($this->repository->getTable() . '.' . $key, $operator, $value);
                break;
            default:
                if (!$value) {
                    break;
                }

                if ($operator === 'like') {
                    $query = $query->where($this->repository->getTable() . '.' . $key, $operator, '%' . $value . '%');
                    break;
                }

                if ($operator !== '=') {
                    $value = (float)$value;
                }
                $query = $query->where($this->repository->getTable() . '.' . $key, $operator, $value);
        }

        return $query;
    }

    /**
     * @param string|null $title
     * @param string|null $value
     * @param string| null $type
     * @param null $data
     * @return array
     * @throws Throwable
     */
    public function getValueInput(?string $title, ?string $value, ?string $type, $data = null): array
    {
        $inputName = 'value';

        if (empty($title)) {
            $inputName = 'filter_values[]';
        }
        $attributes = [
            'class'        => 'form-control input-value filter-column-value',
            'placeholder'  => trans('core/table::table.value'),
            'autocomplete' => 'off',
        ];

        switch ($type) {
            case 'select':
            case 'customSelect':
                $attributes['class'] = $attributes['class'] . ' select';
                $attributes['placeholder'] = trans('core/table::table.select_option');
                $html = Form::customSelect($inputName, $data, $value, $attributes)->toHtml();
                break;

            case 'select-search':
                $attributes['class'] = $attributes['class'] . ' select-search-full';
                $attributes['placeholder'] = trans('core/table::table.select_option');
                $html = Form::customSelect($inputName, $data, $value, $attributes)->toHtml();
                break;

            case 'select-ajax':
                $attributes = [
                    'class'              => $attributes['class'] . ' select-search-ajax',
                    'data-url'           => Arr::get($data, 'url'),
                    'data-minimum-input' => Arr::get($data, 'minimum-input', 2),
                    'multiple'           => Arr::get($data, 'multiple', false),
                    'data-placeholder'   => Arr::get($data, 'placeholder', $attributes['placeholder']),
                ];
                $html = Form::customSelect($inputName, Arr::get($data, 'selected', []), $value, $attributes)->toHtml();
                break;

            case 'number':
                $html = Form::number($inputName, $value, $attributes)->toHtml();
                break;

            case 'date':
                $attributes['class'] = $attributes['class'] . ' datepicker';
                $attributes['data-date-format'] = config('core.base.general.date_format.js.date');
                $content = Form::text($inputName, $value, $attributes)->toHtml();
                $html = view('core/table::partials.date-field', compact('content'))->render();
                break;

            default:
                $html = Form::text($inputName, $value, $attributes)->toHtml();
                break;
        }

        return compact('html', 'data');
    }

    /**
     * @param array $ids
     * @param string $inputKey
     * @param string $inputValue
     * @return boolean
     */
    public function saveBulkChanges(array $ids, string $inputKey, ?string $inputValue): bool
    {
        foreach ($ids as $id) {
            $item = $this->repository->findOrFail($id);
            if ($item) {
                $this->saveBulkChangeItem($item, $inputKey, $inputValue);
                event(new UpdatedContentEvent($this->repository->getModel(), request(), $item));
            }
        }

        return true;
    }

    /**
     * @param Model $item
     * @param string $inputKey
     * @param string $inputValue
     * @return false|Model
     */
    public function saveBulkChangeItem($item, string $inputKey, ?string $inputValue)
    {
        $item->{$inputKey} = $this->prepareBulkChangeValue($inputKey, $inputValue);

        return $this->repository->createOrUpdate($item);
    }

    /**
     * @param string $key
     * @param string $value
     * @return string
     */
    public function prepareBulkChangeValue(string $key, ?string $value): string
    {
        if (strpos($key, '.') !== -1) {
            $key = Arr::last(explode('.', $key));
        }

        switch ($key) {
            case 'created_at':
            case 'updated_at':
                $value = BaseHelper::formatDateTime($value);
                break;
        }

        return (string)$value;
    }

    /**
     * @return string
     * @throws Throwable
     */
    public function renderFilter(): string
    {
        $tableId = $this->getOption('id');
        $class = get_class($this);
        $columns = $this->getFilters();

        $request = request();
        $requestFilters = [
            '-1' => [
                'column'   => '',
                'operator' => '=',
                'value'    => '',
            ],
        ];

        if ($request->input('filter_columns')) {
            $requestFilters = [];
            foreach ($request->input('filter_columns', []) as $key => $item) {

                $operator = $request->input('filter_operators.' . $key);

                $value = $request->input('filter_values.' . $key);

                if (is_array($operator) || is_array($value) || is_array($item)) {
                    continue;
                }

                $requestFilters[] = [
                    'column'   => $item,
                    'operator' => $operator,
                    'value'    => $value,
                ];
            }
        }

        return view($this->filterTemplate, compact('columns', 'class', 'tableId', 'requestFilters'))->render();
    }

    /**
     * @return array
     */
    public function getFilters(): array
    {
        return $this->getBulkChanges();
    }

    /**
     * @param array $buttons
     * @param string $url
     * @param null|string $permission
     * @return array
     * @throws Throwable
     */
    protected function addCreateButton(string $url, $permission = null, array $buttons = []): array
    {
        if (!$permission || Auth::user()->hasPermission($permission)) {
            $queryString = http_build_query(Request::query());

            if ($queryString) {
                $url .= '?' . $queryString;
            }

            $buttons['create'] = [
                'link' => $url,
                'text' => view('core/table::partials.create')->render(),
            ];
        }

        return $buttons;
    }

    /**
     * @param string $url
     * @param null|string $permission
     * @param array $actions
     * @return array
     */
    protected function addDeleteAction(string $url, $permission = null, $actions = []): array
    {
        if (!$permission || Auth::user()->hasPermission($permission)) {
            $actions['delete-many'] = view('core/table::partials.delete', [
                'href'       => $url,
                'data_class' => get_called_class(),
            ]);
        }

        return $actions;
    }

    /**
     * @param QueryDataTable $data
     * @param array $escapeColumn
     * @param bool $mDataSupport
     * @return mixed
     */
    public function toJson($data, $escapeColumn = [], $mDataSupport = true)
    {
        if ($this->repository && $this->repository->getModel()) {
            $data = apply_filters(BASE_FILTER_GET_LIST_DATA, $data, $this->repository->getModel());
        }

        return $data
            ->escapeColumns($escapeColumn)
            ->make($mDataSupport);
    }

    /**
     * @param string $image
     * @param array $attributes
     * @return Application|UrlGenerator|HtmlString|string|string[]|null
     */
    protected function displayThumbnail($image, array $attributes = ['width' => 50])
    {
        if ($this->request()->input('action') == 'csv') {
            return RvMedia::getImageUrl($image, null, false, RvMedia::getDefaultImage());
        }

        if ($this->request()->input('action') == 'excel') {
            return RvMedia::getImageUrl($image, 'thumb', false, RvMedia::getDefaultImage());
        }

        return Html::image(
            RvMedia::getImageUrl($image, 'thumb', false, RvMedia::getDefaultImage()),
            trans('core/base::tables.image'),
            $attributes
        );
    }
}
