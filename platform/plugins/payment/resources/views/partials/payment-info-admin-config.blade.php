<div class="form-group mb-3">
    <label class="control-label">{{ trans('plugins/payment::payment.charge_id') }}</label>
    {!! Form::input('text', 'charge_id', Arr::get($attributes, 'charge_id'), ['class' => 'form-control', 'placeholder' => trans('plugins/payment::payment.charge_id')]) !!}
</div>
