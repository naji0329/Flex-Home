<p>{{ trans('plugins/payment::payment.created_at') }}: <strong>{{ $payment->created_at }}</strong></p>
<p>{{ trans('plugins/payment::payment.payment_channel') }}: <strong>{{ $payment->payment_channel->label() }}</strong></p>
<p>{{ trans('plugins/payment::payment.total') }}: <strong>{{ $payment->amount }} {{ $payment->currency }}</strong></p>
{!! $detail !!}
