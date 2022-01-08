<div class="tools">
    @php
        $hiddenIcons = '';
        if (Arr::get($settings, 'show_state', true) && Arr::get($settings, 'state', 'expand') == 'collapse') {
            $hiddenIcons = 'd-none';
        }
    @endphp
    @if (Arr::get($settings, 'show_predefined_ranges', false) && count($predefinedRanges))
        <div class="predefined-ranges ui-select-wrapper d-inline-block {{ $hiddenIcons }}">
            <select name="predefined_range" class="ui-select py-0">
                @foreach ($predefinedRanges as $key => $item)
                    <option value="{{ $item['key'] }}">{{ $item['label'] }}</option>
                @endforeach
            </select>
            <svg class="svg-next-icon svg-next-icon-size-16">
                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#select-chevron"></use>
            </svg>
        </div>
    @endif

    @if (Arr::get($settings, 'show_state', true))
        <a href="#"
            class="{{ Arr::get($settings, 'state', 'expand') }} collapse-expand"
            data-bs-toggle="tooltip"
            title="{{ trans('core/dashboard::dashboard.collapse_expand') }}"
            data-state="{{ Arr::get($settings, 'state', 'expand') == 'collapse' ? 'expand' : 'collapse' }}"></a>
    @endif

    @if (Arr::get($settings, 'show_reload', true))
        <a href="#"
            class="reload {{ $hiddenIcons }}"
            data-bs-toggle="tooltip"
            title="{{ trans('core/dashboard::dashboard.reload') }}"></a>
    @endif

    @if (Arr::get($settings, 'show_fullscreen', true))
        <a href="#"
            class="fullscreen {{ $hiddenIcons }}"
            data-bs-toggle="tooltip"
            data-bs-original-title="{{ trans('core/dashboard::dashboard.fullscreen') }}"
            title="{{ trans('core/dashboard::dashboard.fullscreen') }}"> </a>
    @endif

    @if (Arr::get($settings, 'show_remove', true))
        <a href="#" class="remove" data-bs-toggle="tooltip" title="{{ trans('core/dashboard::dashboard.hide') }}"></a>
    @endif
</div>
