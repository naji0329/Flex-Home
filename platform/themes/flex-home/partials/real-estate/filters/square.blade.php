@php
    $unit = setting('real_estate_square_unit', 'm²');
    $calc = [
        [
            'number' => 0,
            'label' => "__value__ " . $unit
        ],
    ];
    $labelAll = __('All squares');
    $squares = [
        '0-100'     => "&lt; 100 $unit",
        '100-200'   => "100 $unit - 200 $unit",
        '200-300'   => "200 $unit - 300 $unit",
        '300-400'   => "300 $unit - 400 $unit",
        '400-500'   => "400 $unit - 500 $unit",
        '500-0'     => "&gt; 500 $unit",
    ];
@endphp
<div class="form-group min-max-input" data-calc="{{ json_encode($calc, true) }}" data-all="{{ $labelAll }}">
    <div class="row">
        <div class="col-5 pr-1">
            <label for="min_square" class="control-label">{{ __('Square from') }}</label>
            <input type="number" name="min_square" class="form-control min-input" id="min_square"
                value="{{ request()->input('min_square') }}" placeholder="{{ __('From') }}" step="10" min="0">
            <span class="position-absolute min-label"></span>
        </div>
        <div class="col-5 px-1">
            <label for="max_square" class="control-label">{{ __('Square to') }}</label>
            <input type="number" name="max_square" class="form-control max-input" id="max_square"
                value="{{ request()->input('max_square') }}" placeholder="{{ __('To') }}" step="10" min="0">
                <span class="position-absolute max-label"></span>
        </div>
        <div class="col-2 px-0" style="align-self: flex-end">
            <span class="btn btn-primary">{{ __('OK') }}</span>
        </div>
    </div>
</div>
{!! Theme::partial('real-estate.filters.suggetions', ['collections' => $squares, 'labelAll' => $labelAll]) !!}