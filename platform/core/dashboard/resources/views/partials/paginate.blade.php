@if ($data instanceof  Illuminate\Pagination\LengthAwarePaginator)
    <div class="row">
        <div class="col-4 number_record">
            <div class="f_com">
                <input type="text" class="numb" value="{{ $limit }}"/>
                <div class="btn_grey btn_change_paginate btn_up"></div>
                <div class="btn_grey btn_change_paginate btn_down"></div>
            </div>
        </div>
        <div class="col-8 widget_pagination">
            <span>@if ($data->total() > 0 ){{ ($data->currentPage() - 1) * $limit + 1 }} @else 0 @endif
                - {{ $limit < $data->total() ? $data->currentPage() * $limit : $data->total() }} {{ trans('core/base::tables.in') }} {{ $data->total() }} {{ trans('core/base::tables.records') }}</span>
            <a class="btn_grey page_previous" href="{{ $data->previousPageUrl() }}"></a>
            <a class="btn_grey page_next" href="{{ $data->nextPageUrl() }}"></a>
        </div>
    </div>
@endif
