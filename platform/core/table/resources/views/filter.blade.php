<div class="wrapper-filter">
    <p>{{ trans('core/table::table.filters') }}</p>

    <input type="hidden" class="filter-data-url" value="{{ route('tables.get-filter-input') }}">

    <div class="sample-filter-item-wrap hidden">
        <div class="filter-item form-filter">
            <div class="ui-select-wrapper">
                <select name="filter_columns[]" class="ui-select filter-column-key">
                    <option value="">{{ trans('core/table::table.select_field') }}</option>
                    @foreach($columns as $columnKey => $column)
                        <option value="{{ $columnKey }}">{{ $column['title'] }}</option>
                    @endforeach
                </select>
                <svg class="svg-next-icon svg-next-icon-size-16">
                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#select-chevron"></use>
                </svg>
            </div>
            <div class="ui-select-wrapper">
                <select name="filter_operators[]" class="ui-select filter-operator filter-column-operator">
                    <option value="like">{{ trans('core/table::table.contains') }}</option>
                    <option value="=">{{ trans('core/table::table.is_equal_to') }}</option>
                    <option value=">">{{ trans('core/table::table.greater_than') }}</option>
                    <option value="<">{{ trans('core/table::table.less_than') }}</option>
                </select>
                <svg class="svg-next-icon svg-next-icon-size-16">
                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#select-chevron"></use>
                </svg>
            </div>
            <span class="filter-column-value-wrap">
                <input class="form-control filter-column-value" type="text" placeholder="{{ trans('core/table::table.value') }}"
                       name="filter_values[]">
            </span>
            <span class="btn-remove-filter-item" title="{{ trans('core/table::table.delete') }}">
                <i class="fa fa-trash text-danger"></i>
            </span>
        </div>
    </div>

    {{ Form::open(['method' => 'GET', 'class' => 'filter-form']) }}
        <input type="hidden" name="filter_table_id" class="filter-data-table-id" value="{{ $tableId }}">
        <input type="hidden" name="class" class="filter-data-class" value="{{ $class }}">
        <div class="filter_list inline-block filter-items-wrap">
            @foreach($requestFilters as $filterItem)
                <div class="filter-item form-filter @if ($loop->first) filter-item-default @endif">
                    <div class="ui-select-wrapper">
                        <select name="filter_columns[]" class="ui-select filter-column-key">
                            <option value="">{{ trans('core/table::table.select_field') }}</option>
                            @foreach($columns as $columnKey => $column)
                                <option value="{{ $columnKey }}" @if ($filterItem['column'] == $columnKey) selected @endif>{{ $column['title'] }}</option>
                            @endforeach
                        </select>
                        <svg class="svg-next-icon svg-next-icon-size-16">
                            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#select-chevron"></use>
                        </svg>
                    </div>
                    <div class="ui-select-wrapper">
                        <select name="filter_operators[]" class="ui-select filter-column-operator">
                            <option value="like"
                                    @if ($filterItem['operator'] == 'like') selected @endif>{{ trans('core/table::table.contains') }}</option>
                            <option value="="
                                    @if ($filterItem['operator'] == '=') selected @endif>{{ trans('core/table::table.is_equal_to') }}</option>
                            <option value=">"
                                    @if ($filterItem['operator'] == '>') selected @endif>{{ trans('core/table::table.greater_than') }}</option>
                            <option value="<"
                                    @if ($filterItem['operator'] == '<') selected @endif>{{ trans('core/table::table.less_than') }}</option>
                        </select>
                        <svg class="svg-next-icon svg-next-icon-size-16">
                            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#select-chevron"></use>
                        </svg>
                    </div>
                    <span class="filter-column-value-wrap">
                        <input class="form-control filter-column-value" type="text" placeholder="{{ trans('core/table::table.value') }}"
                               name="filter_values[]" value="{{ $filterItem['value'] }}">
                    </span>
                    @if ($loop->first)
                        <span class="btn-reset-filter-item" title="{{ trans('core/table::table.reset') }}">
                            <i class="fa fa-eraser text-info" style="font-size: 13px;"></i>
                        </span>
                    @else
                        <span class="btn-remove-filter-item" title="{{ trans('core/table::table.delete') }}">
                            <i class="fa fa-trash text-danger"></i>
                        </span>
                    @endif
                </div>
            @endforeach
        </div>
        <div style="margin-top: 10px;">
            <a href="javascript:;" class="btn btn-secondary add-more-filter">{{ trans('core/table::table.add_additional_filter') }}</a>
            <a href="{{ URL::current() }}" class="btn btn-info @if (!request()->has('filter_table_id')) hidden @endif">{{ trans('core/table::table.reset') }}</a>
            <button type="submit" class="btn btn-primary btn-apply">{{ trans('core/table::table.apply') }}</button>
        </div>

    {{ Form::close() }}
</div>
