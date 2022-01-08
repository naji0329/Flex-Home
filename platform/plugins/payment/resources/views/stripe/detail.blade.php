@if ($payment)
    <div class="alert alert-success" role="alert">
        <p class="mb-2">{{ trans('plugins/payment::payment.payment_id') }}: <strong>{{ $payment->id }}</strong></p>
        <p class="mb-2">{{ trans('plugins/payment::payment.payer_name') }}: {{ $payment->source->name }}</p>
        <p class="mb-2">{{ trans('plugins/payment::payment.card') }}: {{ $payment->source->brand }} - **** **** **** {{ $payment->source->last4 }}
            - {{ $payment->source->exp_month }}/{{ $payment->source->exp_year }}</p>
        <p class="@if (!empty($payment->source->address_line1)) mb-2 @else mb-0 @endif">{{ trans('plugins/payment::payment.country') }}: {{ $payment->source->country }}</p>
        @if (!empty($payment->source->address_line1))
            <p class="mb-0">{{ trans('plugins/payment::payment.address') }}: {{ $payment->source->address_line1 }}</p>
        @endif
    </div>

    @if ($payment->refunds && $payment->refunds->total_count)
        <br />
        <h6 class="alert-heading">{{ trans('plugins/payment::payment.refunds.title') . ' (' . $payment->refunds->total_count . ')'}}</h6>
        <hr class="m-0 mb-4">
        @foreach ($payment->refunds->data as $item)
            <div class="alert alert-warning" role="alert">
                <p>{{ trans('plugins/payment::payment.refunds.id') }}: {{ $item->id }}</p>
                @php
                    $multiplier = \Botble\Payment\Supports\StripeHelper::getStripeCurrencyMultiplier($item->currency);

                    if ($multiplier > 1) {
                        $item->amount = round($item->amount / $multiplier, 2);
                    }
                @endphp
                <p>{{ trans('plugins/payment::payment.amount') }}: {{ $item->amount }} {{ strtoupper($item->currency) }}</p>
                <p>{{ trans('plugins/payment::payment.refunds.status') }}: {{ strtoupper($item->status) }}</p>
                <p>{{ trans('plugins/payment::payment.refunds.create_time') }}: {{ now()->parse($item->created) }}</p>
            </div>
            <br />
        @endforeach
    @endif

    @include('plugins/payment::partials.view-payment-source')
@endif
