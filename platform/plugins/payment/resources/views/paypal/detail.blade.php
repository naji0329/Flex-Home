@if ($payment)
    @php
        $result = $payment->result;
        $purchaseUnits = $result->purchase_units;
        $purchaseUnit = Arr::get($purchaseUnits, 0);
        $payer = $result->payer;
        $shipping = $purchaseUnit->shipping;
    @endphp
    <div class="alert alert-success" role="alert">
        <p class="mb-2">{{ trans('plugins/payment::payment.payment_id') }}: <strong>{{ $result->id }}</strong></p>

        <p class="mb-2">
            {{ trans('plugins/payment::payment.details') }}:
            <strong>
                @foreach($purchaseUnits as $purchase)
                    {{ $purchase->amount->value }} {{ $purchase->amount->currency_code }} @if (!empty($purchase->description)) ({{ $purchase->description }}) @endif
                @endforeach
            </strong>
        </p>

        <p class="mb-2">{{ trans('plugins/payment::payment.payer_name') }}
            : {{ $payer->name->given_name }} {{ $payer->name->surname }}</p>
        <p class="mb-2">{{ trans('plugins/payment::payment.email') }}: {{ $payer->email_address }}</p>
        @if (!empty($payer->phone) && $payer->phone->phone_number && $payer->phone->phone_number->national_number)
            <p class="mb-2">{{ trans('plugins/payment::payment.phone')  }}: {{ $payer->phone->phone_number->national_number }}</p>
        @endif
	    <p class="mb-2">{{ trans('plugins/payment::payment.country') }}: {{ $payer->address->country_code }}</p>
        <p class="mb-0">
            {{ trans('plugins/payment::payment.shipping_address') }}:
            {{ $shipping->name->full_name }}, {{ $shipping->address->address_line_1 }}, {{ $shipping->address->admin_area_2 }}, {{ $shipping->address->admin_area_1 }} {{ $shipping->address->postal_code }}, {{ $shipping->address->country_code }}
        </p>
    </div>

    @php
        $refunds = null;
        $payments = $purchaseUnit->payments;
        if ($payments && !empty($payments->refunds) && $payments->refunds) {
            $refunds = $payments->refunds;
        }
    @endphp
    @if ($refunds)
        <br />
        <h6 class="alert-heading">{{ trans('plugins/payment::payment.refunds.title') . ' (' . count((array)$refunds) . ')' }}</h6>
        <hr class="m-0 mb-4">
        @foreach ($refunds as $item)
            <div class="alert alert-warning" role="alert">
                <p>{{ trans('plugins/payment::payment.refunds.id') }}: {{ $item->id }}</p>
                <p>{{ trans('plugins/payment::payment.amount') }}: {{ $item->amount->value }} {{ $item->amount->currency_code }}</p>
                <p>{{ trans('plugins/payment::payment.refunds.status') }}: {{ $item->status }}</p>
                <p>{{ trans('plugins/payment::payment.refunds.breakdowns') }}: </p>
                <div class="ml-4">
                    @foreach ($item->seller_payable_breakdown as $k => $breakdown)
                        <p>{{ trans('plugins/payment::payment.refunds.' . $k) }}: {{ $breakdown->value }} {{ $breakdown->currency_code }}</p>
                    @endforeach
                </div>
                <p>{{ trans('plugins/payment::payment.refunds.create_time') }}: {{ now()->parse($item->create_time) }}</p>
                <p>{{ trans('plugins/payment::payment.refunds.update_time') }}: {{ now()->parse($item->update_time) }}</p>
            </div>
            <br />
        @endforeach
    @endif

    @include('plugins/payment::partials.view-payment-source')
@endif
