@php
    $calc = [
        [
            'number' => 1000000000,
            'label' => '__value__ ' . __('billion')
        ],
        [
            'number' => 1000000,
            'label' => '__value__ ' . __('million')
        ],
        [
            'number' => 1000,
            'label' => '__value__ ' . __('thousand')
        ],
        [
            'number' => 0,
            'label' => '__value__'
        ],
    ];
    $symbol = '';
    $currency = get_application_currency();
    if ($currency) {
        $symbol = ' (' . $currency->symbol . ')';
    }
@endphp
<div class="form-group min-max-input" data-calc="{{ json_encode($calc, true) }}" data-all="{{ __('All prices') }}">
    <div class="row">
        <div class="col-5 pr-1">
            <label for="min_price" class="control-label">{{ __('Price from') . $symbol }}</label>
            <input type="number" name="min_price" class="form-control min-input" id="min_price"
                value="{{ request()->input('min_price') }}" placeholder="{{ __('From') }}" min="0" step="1" >
            <span class="position-absolute min-label"></span>
        </div>
        <div class="col-5 px-1">
            <label for="max_price" class="control-label">{{ __('Price to') . $symbol }}</label>
            <input type="number" name="max_price" class="form-control max-input" id="max_price"
                value="{{ request()->input('max_price') }}" placeholder="{{ __('To') }}" min="0" step="1">
            <span class="position-absolute max-label"></span>
        </div>
        <div class="col-2 px-0 btn-min-max" style="align-self: flex-end">
            <button class="btn btn-primary">{{ __('OK') }}</button>
        </div>
    </div>
</div>
