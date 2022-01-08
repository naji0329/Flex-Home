<div class="form-group mb-3">
    <label class="control-label">{{ trans('plugins/payment::payment.payment_name') }}</label>
    {!! Form::input('text', 'name', Arr::get($attributes, 'name'), ['class' => 'form-control', 'placeholder' => trans('plugins/payment::payment.payment_name')]) !!}
</div>

<div class="form-group mb-3">
    <label class="control-label">{{ trans('plugins/payment::payment.amount') }}</label>
    {!! Form::number('amount', Arr::get($attributes, 'amount', 1), ['class' => 'form-control', 'placeholder' => trans('plugins/payment::payment.amount')]) !!}
</div>

<div class="form-group mb-3">
    <label class="control-label">{{ trans('plugins/payment::payment.currency') }}</label>
    {!! Form::input('text', 'currency', Arr::get($attributes, 'currency', 'USD'), ['class' => 'form-control', 'placeholder' => trans('plugins/payment::payment.currency')]) !!}
</div>

<div class="form-group mb-3">
    <label class="control-label">{{ trans('plugins/payment::payment.callback_url') }}</label>
    {!! Form::input('text', 'callback_url', Arr::get($attributes, 'callback_url', '/'), ['class' => 'form-control', 'placeholder' => trans('plugins/payment::payment.callback_url')]) !!}
</div>

<div class="form-group mb-3">
    <label class="control-label">{{ trans('plugins/payment::payment.return_url') }}</label>
    {!! Form::input('text', 'return_url', Arr::get($attributes, 'return_url', '/'), ['class' => 'form-control', 'placeholder' => trans('plugins/payment::payment.return_url')]) !!}
</div>
