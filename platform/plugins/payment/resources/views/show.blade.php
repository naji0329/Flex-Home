@extends(BaseHelper::getAdminMasterLayoutTemplate())
@section('content')
    @php do_action(BASE_ACTION_TOP_FORM_CONTENT_NOTIFICATION, request(), $payment) @endphp
    {!! Form::open(['route' => ['payment.update', $payment->id]]) !!}
        @method('PUT')
        <div class="row">
            <div class="col-md-9">
                <div class="widget meta-boxes">
                    <div class="widget-title">
                        <h4>
                            <span>{{ trans('plugins/payment::payment.information') }}</span>
                        </h4>
                    </div>
                    <div class="widget-body">
                        <p>{{ trans('plugins/payment::payment.created_at') }}: <strong>{{ $payment->created_at }}</strong></p>
                        <p>{{ trans('plugins/payment::payment.payment_channel') }}: <strong>{{ $payment->payment_channel->label() }}</strong></p>
                        <p>{{ trans('plugins/payment::payment.total') }}: <strong>{{ $payment->amount }} {{ $payment->currency }}</strong></p>
                        <p>{{ trans('plugins/payment::payment.status') }}: <strong>{!! $payment->status->label() !!}</strong></p>
                        @if ($payment->customer_id && $payment->customer && $payment->customer_type && class_exists($payment->customer_type))
                            <p>{{ trans('plugins/payment::payment.payer_name') }}: <strong>{{ $payment->customer->name }}</strong></p>
                            <p>{{ trans('plugins/payment::payment.email') }}: <strong>{{ $payment->customer->email }}</strong></p>
                            <p>{{ trans('plugins/payment::payment.phone')  }}: <strong>{{ $payment->customer->phone ?: 'N/A' }}</strong></p>
                        @endif

                        {!! $detail !!}
                    </div>
                </div>
                @php do_action(BASE_ACTION_META_BOXES, 'advanced', $payment) @endphp
            </div>
            <div class="col-md-3 right-sidebar">
                @include('core/base::forms.partials.form-actions', ['title' => trans('plugins/payment::payment.action')])
                <div class="widget meta-boxes">
                    <div class="widget-title">
                        <h4><label for="status" class="control-label required" aria-required="true">{{ trans('core/base::tables.status') }}</label></h4>
                    </div>
                    <div class="widget-body">
                        {!! Form::customSelect('status', $paymentStatuses, $payment->status) !!}
                    </div>
                </div>
                @php do_action(BASE_ACTION_META_BOXES, 'side', $payment) @endphp
            </div>
        </div>
    {!! Form::close() !!}
@stop
