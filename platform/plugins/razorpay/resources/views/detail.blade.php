@if ($payment)
    <p>{{ trans('plugins/payment::payment.payment_id') }}: {{ $payment->id }}</p>
    <p>{{ trans('plugins/payment::payment.amount') }}: {{ $payment->amount / 100 . ' ' . $payment->currency }}</p>
    <p>{{ trans('plugins/payment::payment.email') }}: {{ $payment->email }}</p>
    <p>{{ trans('plugins/payment::payment.phone') }}: {{ $payment->contact }}</p>
    <p>{{ trans('core/base::tables.created_at') }}: {{ now()->parse($payment->created_at) }}</p>
    <hr>

    @if ($payment->amount_refunded)
        <h6 class="alert-heading">{{ trans('plugins/payment::payment.amount_refunded') . ':' }}
                {{ ($payment->amount_refunded / 100) }} {{ $payment->currency }}</h6>
    @endif

    @if ($refunds = Arr::get($paymentModel->metadata, 'refunds', []))
        @foreach ($refunds as $refund)
            <div id="{{ Arr::get($refund, 'data.id') }}">
                @include('plugins/razorpay::refund-detail')
            </div>
        @endforeach
    @endif

    @include('plugins/payment::partials.view-payment-source')
@endif
