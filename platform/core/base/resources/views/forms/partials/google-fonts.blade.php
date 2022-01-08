<div class="ui-select-wrapper">
    @php
        Arr::set($selectAttributes, 'class', Arr::get($selectAttributes, 'class') . ' ui-select');
    @endphp
    <select name="{{ $name }}" class='form-control select2_google_fonts_picker'>
        @php
            $field['options'] = ['' => __('-- Select --')] + config('core.base.general.google_fonts', []);
        @endphp
        @foreach (array_combine($field['options'], $field['options']) as $key => $value)
            <option value='{{ $key }}' @if ($key == $selected) selected @endif>{{ $value }}</option>
        @endforeach
    </select>
    <svg class="svg-next-icon svg-next-icon-size-16">
        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#select-chevron"></use>
    </svg>
</div>

@once
    @push('footer')
        <link href="https://fonts.googleapis.com/css?family={{ implode('|', array_map('urlencode', array_filter($field['options']))) }}" rel="stylesheet" type="text/css">
    @endpush
@endonce

