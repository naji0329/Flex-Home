@if ($refund)
    @php
        $refundData = Arr::get($refund, 'data');
        $refundRefId = Arr::get($refundData, 'id');
    @endphp
    <div class="alert alert-warning" role="alert" >
        <div class="d-flex justify-content-between">
            <p>{{ trans('plugins/payment::payment.refunds.id') }}: <strong>{{ $refundRefId }}</strong></p>
            @if ($refundRefId)
                <a class="get-refund-detail d-block"
                    data-element="#{{ $refundRefId }}"
                    data-url="{{ route('payment.refund-detail', [$paymentModel->id, $refundRefId]) }}">
                    <i class="fas fa-sync-alt"></i>
                </a>
            @endif
        </div>
        <p>{{ trans('plugins/payment::payment.amount') }}: {{ (Arr::get($refundData, 'amount') / 100) . ' ' . Arr::get($refundData, 'currency') }}</p>
        <p>{{ trans('plugins/payment::payment.refunds.status') }}: {{ Arr::get($refundData, 'status') }}</p>
        @if (Arr::has($refundData, 'createdAt'))
            <p>{{ trans('core/base::tables.created_at') }}: {{ now()->parse(Arr::get($refundData, 'createdAt')) }}</p>
        @endif
        @if ($customerNote = Arr::get($refundData, 'customer_note'))
            <p>{{ trans('plugins/payment::payment.refunds.description') }}: {{ $customerNote }}</p>
        @endif
    </div>
    <br />
@endif
