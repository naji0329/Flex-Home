<strong>{{ trans('plugins/payment::payment.payment_details') }}: </strong>
@include('plugins/payment::stripe.detail', compact('payment'))
