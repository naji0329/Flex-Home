@if ($refund)
    @php
        $refundRefId = Arr::get($refund, 'id');
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
        <p>{{ trans('plugins/payment::payment.amount') }}: {{ (Arr::get($refund, 'amount') / 100) . ' ' . Arr::get($refund, 'currency') }}</p>
        <p>{{ trans('plugins/payment::payment.refunds.status') }}: {{ Arr::get($refund, 'status') }}</p>
        @if (Arr::has($refund, 'created_at'))
            <p>{{ trans('core/base::tables.created_at') }}: {{ now()->parse(Arr::get($refund, 'created_at')) }}</p>
        @endif
        @if ($errorReason = Arr::get($refund, 'errorReason'))
            <p class="text-danger">{{ trans('plugins/payment::payment.refunds.error_message') }}: {{ $errorReason }}</p>
        @endif
    </div>
    <br />
@endif
