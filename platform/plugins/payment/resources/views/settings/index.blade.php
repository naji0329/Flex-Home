@extends(BaseHelper::getAdminMasterLayoutTemplate())

@section('content')
    <div class="container">
        <div class="row">
            <div class="group flexbox-annotated-section">
                <div class="col-md-3">
                    <h4>{{ trans('plugins/payment::payment.payment_methods') }}</h4>
                    <p>{{ trans('plugins/payment::payment.payment_methods_description') }}</p>
                </div>
                <div class="col-md-9">
                    @php do_action(BASE_ACTION_META_BOXES, 'top', new \Botble\Payment\Models\Payment) @endphp

                    <div class="wrapper-content pd-all-20">
                        {!! Form::open(['route' => 'payments.settings']) !!}
                        <div class="form-group mb-3">
                            <label for="default_payment_method">{{ trans('plugins/payment::payment.default_payment_method') }}</label>
                            {!! Form::customSelect('default_payment_method', \Botble\Payment\Enums\PaymentMethodEnum::labels(), setting('default_payment_method', Botble\Payment\Enums\PaymentMethodEnum::STRIPE)) !!}
                        </div>
                        <button type="button" class="btn btn-info button-save-payment-settings">{{ trans('core/base::forms.save') }}</button>
                        {!! Form::close() !!}
                    </div>

                    <br>

                    @php $stripeStatus = setting('payment_stripe_status'); @endphp
                    <table class="table payment-method-item">
                        <tbody><tr class="border-pay-row">
                            <td class="border-pay-col"><i class="fa fa-theme-payments"></i></td>
                            <td style="width: 20%;">
                                <img class="filter-black" src="{{ url('vendor/core/plugins/payment/images/stripe.svg') }}" alt="stripe">
                            </td>
                            <td class="border-right">
                                <ul>
                                    <li>
                                        <a href="https://stripe.com" target="_blank">Stripe</a>
                                        <p>{{ trans('plugins/payment::payment.stripe_description') }}</p>
                                    </li>
                                </ul>
                            </td>
                        </tr>
                        <tr class="bg-white">
                            <td colspan="3">
                                <div class="float-start" style="margin-top: 5px;">
                                    <div class="payment-name-label-group @if ($stripeStatus == 0) hidden @endif">
                                        <span class="payment-note v-a-t">{{ trans('plugins/payment::payment.use') }}:</span> <label class="ws-nm inline-display method-name-label">{{ setting('payment_stripe_name') }}</label>
                                    </div>
                                </div>
                                <div class="float-end">
                                    <a class="btn btn-secondary toggle-payment-item edit-payment-item-btn-trigger @if ($stripeStatus == 0) hidden @endif">{{ trans('plugins/payment::payment.edit') }}</a>
                                    <a class="btn btn-secondary toggle-payment-item save-payment-item-btn-trigger @if ($stripeStatus == 1) hidden @endif">{{ trans('plugins/payment::payment.settings') }}</a>
                                </div>
                            </td>
                        </tr>
                        <tr class="paypal-online-payment payment-content-item hidden">
                            <td class="border-left" colspan="3">
                                {!! Form::open() !!}
                                {!! Form::hidden('type', \Botble\Payment\Enums\PaymentMethodEnum::STRIPE, ['class' => 'payment_type']) !!}
                                <div class="row">
                                    <div class="col-sm-6">
                                        <ul>
                                            <li>
                                                <label>{{ trans('plugins/payment::payment.configuration_instruction', ['name' => 'Stripe']) }}</label>
                                            </li>
                                            <li class="payment-note">
                                                <p>{{ trans('plugins/payment::payment.configuration_requirement', ['name' => 'Stripe']) }}:</p>
                                                <ul class="m-md-l" style="list-style-type:decimal">
                                                    <li style="list-style-type:decimal">
                                                        <a href="https://dashboard.stripe.com/register" target="_blank">
                                                            {{ trans('plugins/payment::payment.service_registration', ['name' => 'Stripe']) }}
                                                        </a>
                                                    </li>
                                                    <li style="list-style-type:decimal">
                                                        <p>{{ trans('plugins/payment::payment.stripe_after_service_registration_msg', ['name' => 'Stripe']) }}</p>
                                                    </li>
                                                    <li style="list-style-type:decimal">
                                                        <p>{{ trans('plugins/payment::payment.stripe_enter_client_id_and_secret') }}</p>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="well bg-white">
                                            <div class="form-group mb-3">
                                                <label class="text-title-field" for="stripe_name">{{ trans('plugins/payment::payment.method_name') }}</label>
                                                <input type="text" class="next-input input-name" name="payment_stripe_name" id="stripe_name" data-counter="400" value="{{ setting('payment_stripe_name', trans('plugins/payment::payment.pay_online_via', ['name' => 'Stripe'])) }}">
                                            </div>
                                            <div class="form-group mb-3">
                                                <label class="text-title-field" for="payment_stripe_description">{{ trans('core/base::forms.description') }}</label>
                                                <textarea class="next-input" name="payment_stripe_description" id="payment_stripe_description">{{ get_payment_setting('description', 'stripe', __('Payment with Stripe')) }}</textarea>
                                            </div>
                                            <p class="payment-note">
                                                {{ trans('plugins/payment::payment.please_provide_information') }} <a target="_blank" href="//www.stripe.com">Stripe</a>:
                                            </p>
                                            <div class="form-group mb-3">
                                                <label class="text-title-field" for="stripe_client_id">{{ trans('plugins/payment::payment.stripe_key') }}</label>
                                                <input type="text" class="next-input" name="payment_stripe_client_id" id="stripe_client_id" placeholder="pk_*************" value="{{ app()->environment('demo') ? '*******************************' : setting('payment_stripe_client_id') }}">
                                            </div>
                                            <div class="form-group mb-3">
                                                <label class="text-title-field" for="stripe_secret">{{ trans('plugins/payment::payment.stripe_secret') }}</label>
                                                <div class="input-option">
                                                    <input type="password" class="next-input" id="stripe_secret" name="payment_stripe_secret" placeholder="sk_*************" value="{{ app()->environment('demo') ? '*******************************' : setting('payment_stripe_secret') }}">
                                                </div>
                                            </div>
                                            {!! apply_filters(PAYMENT_METHOD_SETTINGS_CONTENT, null, 'stripe') !!}
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 bg-white text-end">
                                    <button class="btn btn-warning disable-payment-item @if ($stripeStatus == 0) hidden @endif" type="button">{{ trans('plugins/payment::payment.deactivate') }}</button>
                                    <button class="btn btn-info save-payment-item btn-text-trigger-save @if ($stripeStatus == 1) hidden @endif" type="button">{{ trans('plugins/payment::payment.activate') }}</button>
                                    <button class="btn btn-info save-payment-item btn-text-trigger-update @if ($stripeStatus == 0) hidden @endif" type="button">{{ trans('plugins/payment::payment.update') }}</button>
                                </div>
                                {!! Form::close() !!}
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    @php $payPalStatus = setting('payment_paypal_status'); @endphp
                    <table class="table payment-method-item">
                        <tbody>
                        <tr class="border-pay-row">
                            <td class="border-pay-col"><i class="fa fa-theme-payments"></i></td>
                            <td style="width: 20%;">
                                <img class="filter-black" src="{{ url('vendor/core/plugins/payment/images/ppcom.svg') }}" alt="PayPal">
                            </td>
                            <td class="border-right">
                                <ul>
                                    <li>
                                        <a href="https://paypal.com" target="_blank">PayPal</a>
                                        <p>{{ trans('plugins/payment::payment.paypal_description') }}</p>
                                    </li>
                                </ul>
                            </td>
                        </tr>
                        <tr class="bg-white">
                            <td colspan="3">
                                <div class="float-start" style="margin-top: 5px;">
                                    <div class="payment-name-label-group  @if ($payPalStatus== 0) hidden @endif">
                                        <span class="payment-note v-a-t">{{ trans('plugins/payment::payment.use') }}:</span> <label class="ws-nm inline-display method-name-label">{{ setting('payment_paypal_name') }}</label>
                                    </div>
                                </div>
                                <div class="float-end">
                                    <a class="btn btn-secondary toggle-payment-item edit-payment-item-btn-trigger @if ($payPalStatus == 0) hidden @endif">{{ trans('plugins/payment::payment.edit') }}</a>
                                    <a class="btn btn-secondary toggle-payment-item save-payment-item-btn-trigger @if ($payPalStatus == 1) hidden @endif">{{ trans('plugins/payment::payment.settings') }}</a>
                                </div>
                            </td>
                        </tr>
                        <tr class="paypal-online-payment payment-content-item hidden">
                            <td class="border-left" colspan="3">
                                {!! Form::open() !!}
                                {!! Form::hidden('type', \Botble\Payment\Enums\PaymentMethodEnum::PAYPAL, ['class' => 'payment_type']) !!}
                                <div class="row">
                                    <div class="col-sm-6">
                                        <ul>
                                            <li>
                                                <label>{{ trans('plugins/payment::payment.configuration_instruction', ['name' => 'PayPal']) }}</label>
                                            </li>
                                            <li class="payment-note">
                                                <p>{{ trans('plugins/payment::payment.configuration_requirement', ['name' => 'PayPal']) }}:</p>
                                                <ul class="m-md-l" style="list-style-type:decimal">
                                                    <li style="list-style-type:decimal">
                                                        <a href="//www.paypal.com/vn/merchantsignup/applicationChecklist?signupType=CREATE_NEW_ACCOUNT&amp;productIntentId=email_payments" target="_blank">
                                                            {{ trans('plugins/payment::payment.service_registration', ['name' => 'PayPal']) }}
                                                        </a>
                                                    </li>
                                                    <li style="list-style-type:decimal">
                                                        <p>{{ trans('plugins/payment::payment.after_service_registration_msg', ['name' => 'PayPal']) }}</p>
                                                    </li>
                                                    <li style="list-style-type:decimal">
                                                        <p>{{ trans('plugins/payment::payment.enter_client_id_and_secret') }}</p>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="well bg-white">
                                            <div class="form-group mb-3">
                                                <label class="text-title-field" for="paypal_name">{{ trans('plugins/payment::payment.method_name') }}</label>
                                                <input type="text" class="next-input input-name" name="payment_paypal_name" id="paypal_name" data-counter="400" value="{{ setting('payment_paypal_name', trans('plugins/payment::payment.pay_online_via', ['name' => 'PayPal'])) }}">
                                            </div>
                                            <div class="form-group mb-3">
                                                <label class="text-title-field" for="payment_paypal_description">{{ trans('core/base::forms.description') }}</label>
                                                <textarea class="next-input" name="payment_paypal_description" id="payment_paypal_description">{{ get_payment_setting('description', 'paypal', __('Payment with PayPal')) }}</textarea>
                                            </div>
                                            <p class="payment-note">
                                                {{ trans('plugins/payment::payment.please_provide_information') }} <a target="_blank" href="//www.paypal.com">PayPal</a>:
                                            </p>
                                            <div class="form-group mb-3">
                                                <label class="text-title-field" for="paypal_client_id">{{ trans('plugins/payment::payment.client_id') }}</label>
                                                <input type="text" class="next-input" name="payment_paypal_client_id" id="paypal_client_id" value="{{ app()->environment('demo') ? '*******************************' :setting('payment_paypal_client_id') }}">
                                            </div>
                                            <div class="form-group mb-3">
                                                <label class="text-title-field" for="paypal_client_secret">{{ trans('plugins/payment::payment.client_secret') }}</label>
                                                <div class="input-option">
                                                    <input type="password" class="next-input" placeholder="••••••••" id="paypal_client_secret" name="payment_paypal_client_secret" value="{{ app()->environment('demo') ? '*******************************' : setting('payment_paypal_client_secret') }}">
                                                </div>
                                            </div>
                                            {!! Form::hidden('payment_paypal_mode', 1) !!}
                                            <div class="form-group mb-3">
                                                <label class="next-label">
                                                    <input type="checkbox"  value="0" name="payment_paypal_mode" @if (setting('payment_paypal_mode') == 0) checked @endif>
                                                    {{ trans('plugins/payment::payment.sandbox_mode') }}
                                                </label>
                                            </div>

                                            {!! apply_filters(PAYMENT_METHOD_SETTINGS_CONTENT, null, 'paypal') !!}
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 bg-white text-end">
                                    <button class="btn btn-warning disable-payment-item @if ($payPalStatus == 0) hidden @endif" type="button">{{ trans('plugins/payment::payment.deactivate') }}</button>
                                    <button class="btn btn-info save-payment-item btn-text-trigger-save @if ($payPalStatus == 1) hidden @endif" type="button">{{ trans('plugins/payment::payment.activate') }}</button>
                                    <button class="btn btn-info save-payment-item btn-text-trigger-update @if ($payPalStatus == 0) hidden @endif" type="button">{{ trans('plugins/payment::payment.update') }}</button>
                                </div>
                                {!! Form::close() !!}
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    {!! apply_filters(PAYMENT_METHODS_SETTINGS_PAGE, null) !!}

                    <div class="table-responsive">
                     <table class="table payment-method-item">

                            <tbody><tr class="border-pay-row">
                                <td class="border-pay-col"><i class="fa fa-theme-payments"></i></td>
                                <td style="width: 20%;">
                                    <span>{{ trans('plugins/payment::payment.payment_methods') }}</span>
                                </td>
                                <td class="border-right">
                                    <ul>
                                        <li>
                                            <p>{{ trans('plugins/payment::payment.payment_methods_instruction') }}</p>
                                        </li>
                                    </ul>
                                </td>
                            </tr>

                            @php $codStatus = setting('payment_cod_status'); @endphp
                            <tr class="bg-white">
                                <td colspan="3">
                                    <div class="float-start" style="margin-top: 5px;">
                                        <div class="payment-name-label-group">
                                            @if ($codStatus != 0)<span class="payment-note v-a-t">{{ trans('plugins/payment::payment.use') }}:</span>@endif <label class="ws-nm inline-display method-name-label">{{ setting('payment_cod_name', \Botble\Payment\Enums\PaymentMethodEnum::COD()->label()) }}</label>
                                        </div>
                                    </div>
                                    <div class="float-end">
                                        <a class="btn btn-secondary toggle-payment-item edit-payment-item-btn-trigger @if ($codStatus == 0) hidden @endif">{{ trans('plugins/payment::payment.edit') }}</a>
                                        <a class="btn btn-secondary toggle-payment-item save-payment-item-btn-trigger @if ($codStatus == 1) hidden @endif">{{ trans('plugins/payment::payment.settings') }}</a>
                                    </div>
                                </td>
                            </tr>
                            <tr class="paypal-online-payment payment-content-item hidden">
                                <td class="border-left" colspan="3">
                                    {!! Form::open() !!}
                                    {!! Form::hidden('type', 'cod', ['class' => 'payment_type']) !!}
                                    <div class="col-sm-12 mt-2">
                                        <div class="well bg-white">
                                            <div class="form-group mb-3">
                                                <label class="text-title-field" for="payment_cod_name">{{ trans('plugins/payment::payment.method_name') }}</label>
                                                <input type="text" class="next-input" name="payment_cod_name" id="payment_cod_name" data-counter="400" value="{{ setting('payment_cod_name', \Botble\Payment\Enums\PaymentMethodEnum::COD()->label()) }}">
                                            </div>
                                            <div class="form-group mb-3">
                                                <label class="text-title-field" for="payment_cod_description">{{ trans('plugins/payment::payment.payment_method_description') }}</label>
                                                {!! Form::editor('payment_cod_description', setting('payment_cod_description')) !!}
                                            </div>
                                            {!! apply_filters(PAYMENT_METHOD_SETTINGS_CONTENT, null, 'cod') !!}
                                        </div>
                                    </div>
                                    <div class="col-12 bg-white text-end">
                                        <button class="btn btn-warning disable-payment-item @if ($codStatus == 0) hidden @endif" type="button">{{ trans('plugins/payment::payment.deactivate')  }}</button>
                                        <button class="btn btn-info save-payment-item btn-text-trigger-save @if ($codStatus == 1) hidden @endif" type="button">{{ trans('plugins/payment::payment.activate') }}</button>
                                        <button class="btn btn-info save-payment-item btn-text-trigger-update @if ($codStatus == 0) hidden @endif" type="button">{{ trans('plugins/payment::payment.update') }}</button>
                                    </div>
                                    {!! Form::close() !!}
                                </td>
                            </tr>
                            </tbody>

                            @php $bankTransferStatus = setting('payment_bank_transfer_status'); @endphp
                            <tbody class="border-none-t">
                            <tr class="bg-white">
                                <td colspan="3">
                                    <div class="float-start" style="margin-top: 5px;">
                                        <div class="payment-name-label-group">
                                            @if ($bankTransferStatus != 0) <span class="payment-note v-a-t">{{ trans('plugins/payment::payment.use') }}:</span>@endif <label class="ws-nm inline-display method-name-label">{{ setting('payment_bank_transfer_name', \Botble\Payment\Enums\PaymentMethodEnum::BANK_TRANSFER()->label()) }}</label>
                                        </div>
                                    </div>
                                    <div class="float-end">
                                        <a class="btn btn-secondary toggle-payment-item edit-payment-item-btn-trigger @if ($bankTransferStatus == 0) hidden @endif">{{ trans('plugins/payment::payment.edit') }}</a>
                                        <a class="btn btn-secondary toggle-payment-item save-payment-item-btn-trigger @if ($bankTransferStatus == 1) hidden @endif">{{ trans('plugins/payment::payment.settings') }}</a>
                                    </div>
                                </td>
                            </tr>
                            <tr class="paypal-online-payment payment-content-item hidden">
                                <td class="border-left" colspan="3">
                                    {!! Form::open() !!}
                                    {!! Form::hidden('type', 'bank_transfer', ['class' => 'payment_type']) !!}
                                    <div class="col-sm-12 mt-2">
                                        <div class="well bg-white">
                                            <div class="form-group mb-3">
                                                <label class="text-title-field" for="payment_bank_transfer_name">{{ trans('plugins/payment::payment.method_name') }}</label>
                                                <input type="text" class="next-input" name="payment_bank_transfer_name" id="payment_bank_transfer_name" data-counter="400" value="{{ setting('payment_bank_transfer_name', \Botble\Payment\Enums\PaymentMethodEnum::BANK_TRANSFER()->label()) }}">
                                            </div>
                                            <div class="form-group mb-3">
                                                <label class="text-title-field" for="payment_bank_transfer_description">{{ trans('plugins/payment::payment.payment_method_description') }}</label>
                                                {!! Form::editor('payment_bank_transfer_description', setting('payment_bank_transfer_description')) !!}
                                            </div>
                                            {!! apply_filters(PAYMENT_METHOD_SETTINGS_CONTENT, null, 'bank_transfer') !!}
                                        </div>
                                    </div>
                                    <div class="col-12 bg-white text-end">
                                        <button class="btn btn-warning disable-payment-item @if ($bankTransferStatus == 0) hidden @endif" type="button">{{ trans('plugins/payment::payment.deactivate') }}</button>
                                        <button class="btn btn-info save-payment-item btn-text-trigger-save @if ($bankTransferStatus == 1) hidden @endif" type="button">{{ trans('plugins/payment::payment.activate') }}</button>
                                        <button class="btn btn-info save-payment-item btn-text-trigger-update @if ($bankTransferStatus == 0) hidden @endif" type="button">{{ trans('plugins/payment::payment.update') }}</button>
                                    </div>
                                    {!! Form::close() !!}
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            @php do_action(BASE_ACTION_META_BOXES, 'main', new \Botble\Payment\Models\Payment) @endphp
            <div class="group">
                <div class="col-md-3">

                </div>
                <div class="col-md-9">
                    @php do_action(BASE_ACTION_META_BOXES, 'advanced', new \Botble\Payment\Models\Payment) @endphp
                </div>
            </div>
        </div>
    </div>
    {!! Form::modalAction('confirm-disable-payment-method-modal', trans('plugins/payment::payment.deactivate_payment_method'), 'info', trans('plugins/payment::payment.deactivate_payment_method_description'), 'confirm-disable-payment-method-button', trans('plugins/payment::payment.agree')) !!}
@stop
