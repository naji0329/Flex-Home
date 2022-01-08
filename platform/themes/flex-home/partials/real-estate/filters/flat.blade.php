@php
    $calc = [
        [
            'number'    => 0,
            'label'     => "__value__ "
        ],
    ];
    $labelAll = __('All flats');
    $flats = [
        '0-20'      => '&lt; 30',
        '20-50'     => '20 - 50',
        '50-100'    => '50 - 100',
        '100-150'   => '100 - 150',
        '150-200'   => '150 -  200',
        '200-300'   => '200 - 300',
        '300-0'     => '&gt; 300',
    ];
@endphp
<div class="form-group min-max-input" data-calc="{{ json_encode($calc, true) }}" data-all="{{ $labelAll }}">
    <div class="row">
        <div class="col-5 pr-1">
            <label for="min_flat" class="control-label">{{ __('Flat from') }}</label>
            <input type="number" name="min_flat" class="form-control min-input" id="min_flat"
                value="{{ request()->input('min_flat')}}" placeholder="{{ __('From') }}" min="0" step="1">
            <span class="position-absolute min-label"></span>
        </div>
        <div class="col-5 px-1">
            <label for="max_flat" class="control-label">{{ __('Flat to') }}</label>
            <input type="number" name="max_flat" class="form-control max-input" id="max_flat"
                value="{{ request()->input('max_flat') }}" placeholder="{{ __('To') }}" min="0" step="1">
            <span class="position-absolute max-label"></span>
        </div>
        <div class="col-2 px-0" style="align-self: flex-end">
            <button class="btn btn-primary">{{ __('OK') }}</button>
        </div>
    </div>
</div>
{!! Theme::partial('real-estate.filters.suggetions', ['collections' => $flats, 'labelAll' => $labelAll]) !!}