@if ($histories->count() > 0)
    <div class="scroller">
        <ul class="item-list padding">
            @foreach ($histories as $history)
                <li>
                    @include('plugins/audit-log::activity-line', compact('history'))
                </li>
            @endforeach
        </ul>
    </div>
    @if ($histories instanceof Illuminate\Pagination\LengthAwarePaginator && $histories->total() > $limit)
        <div class="widget_footer">
            @include('core/dashboard::partials.paginate', ['data' => $histories, 'limit' => $limit])
        </div>
    @endif
@else
    @include('core/dashboard::partials.no-data')
@endif
