@php $paystackStatus = get_payment_setting('status', PAYSTACK_PAYMENT_METHOD_NAME); @endphp
<table class="table payment-method-item">
    <tbody>
    <tr class="border-pay-row">
        <td class="border-pay-col"><i class="fa fa-theme-payments"></i></td>
        <td style="width: 20%;">
            <img class="filter-black" src="{{ url('vendor/core/plugins/paystack/images/paystack.png') }}"
                 alt="Paystack">
        </td>
        <td class="border-right">
            <ul>
                <li>
                    <a href="https://paystack.com" target="_blank">{{ __('Paystack') }}</a>
                    <p>{{ __('Customer can buy product and pay directly using Visa, Credit card via :name', ['name' => 'Paystack']) }}</p>
                </li>
            </ul>
        </td>
    </tr>
    <tr class="bg-white">
        <td colspan="3">
            <div class="float-start" style="margin-top: 5px;">
                <div
                    class="payment-name-label-group @if (get_payment_setting('status', PAYSTACK_PAYMENT_METHOD_NAME) == 0) hidden @endif">
                    <span class="payment-note v-a-t">{{ trans('plugins/payment::payment.use') }}:</span> <label
                        class="ws-nm inline-display method-name-label">{{ get_payment_setting('name', PAYSTACK_PAYMENT_METHOD_NAME) }}</label>
                </div>
            </div>
            <div class="float-end">
                <a class="btn btn-secondary toggle-payment-item edit-payment-item-btn-trigger @if ($paystackStatus == 0) hidden @endif">{{ trans('plugins/payment::payment.edit') }}</a>
                <a class="btn btn-secondary toggle-payment-item save-payment-item-btn-trigger @if ($paystackStatus == 1) hidden @endif">{{ trans('plugins/payment::payment.settings') }}</a>
            </div>
        </td>
    </tr>
    <tr class="paypal-online-payment payment-content-item hidden">
        <td class="border-left" colspan="3">
            {!! Form::open() !!}
            {!! Form::hidden('type', PAYSTACK_PAYMENT_METHOD_NAME, ['class' => 'payment_type']) !!}
            <div class="row">
                <div class="col-sm-6">
                    <ul>
                        <li>
                            <label>{{ trans('plugins/payment::payment.configuration_instruction', ['name' => 'Paystack']) }}</label>
                        </li>
                        <li class="payment-note">
                            <p>{{ trans('plugins/payment::payment.configuration_requirement', ['name' => 'Paystack']) }}
                                :</p>
                            <ul class="m-md-l" style="list-style-type:decimal">
                                <li style="list-style-type:decimal">
                                    <a href="https://paystack.com" target="_blank">
                                        {{ __('Register an account on :name', ['name' => 'Paystack']) }}
                                    </a>
                                </li>
                                <li style="list-style-type:decimal">
                                    <p>{{ __('After registration at :name, you will have Public & Secret keys', ['name' => 'Paystack']) }}</p>
                                </li>
                                <li style="list-style-type:decimal">
                                    <p>{{ __('Enter Public, Secret into the box in right hand') }}</p>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="col-sm-6">
                    <div class="well bg-white">
                        <div class="form-group mb-3">
                            <label class="text-title-field"
                                   for="paystack_name">{{ trans('plugins/payment::payment.method_name') }}</label>
                            <input type="text" class="next-input" name="payment_{{ PAYSTACK_PAYMENT_METHOD_NAME }}_name"
                                   id="paystack_name" data-counter="400"
                                   value="{{ get_payment_setting('name', PAYSTACK_PAYMENT_METHOD_NAME, __('Online payment via :name', ['name' => 'Paystack'])) }}">
                        </div>

                        <div class="form-group mb-3">
                            <label class="text-title-field" for="payment_{{ PAYSTACK_PAYMENT_METHOD_NAME }}_description">{{ trans('core/base::forms.description') }}</label>
                            <textarea class="next-input" name="payment_{{ PAYSTACK_PAYMENT_METHOD_NAME }}_description" id="payment_{{ PAYSTACK_PAYMENT_METHOD_NAME }}_description">{{ get_payment_setting('description', PAYSTACK_PAYMENT_METHOD_NAME, __('Payment with Paystack')) }}</textarea>
                        </div>

                        <p class="payment-note">
                            {{ trans('plugins/payment::payment.please_provide_information') }} <a target="_blank" href="https://paystack.com/">Paystack</a>:
                        </p>
                        <div class="form-group mb-3">
                            <label class="text-title-field" for="{{ PAYSTACK_PAYMENT_METHOD_NAME }}_public">{{ __('Public Key') }}</label>
                            <input type="text" class="next-input"
                                   name="payment_{{ PAYSTACK_PAYMENT_METHOD_NAME }}_public" id="{{ PAYSTACK_PAYMENT_METHOD_NAME }}_public"
                                   value="{{ get_payment_setting('public', PAYSTACK_PAYMENT_METHOD_NAME) }}" placeholder="pk_****">
                        </div>
                        <div class="form-group mb-3">
                            <label class="text-title-field" for="{{ PAYSTACK_PAYMENT_METHOD_NAME }}_secret">{{ __('Secret Key') }}</label>
                            <input type="password" class="next-input" id="{{ PAYSTACK_PAYMENT_METHOD_NAME }}_secret"
                                   name="payment_{{ PAYSTACK_PAYMENT_METHOD_NAME }}_secret"
                                   value="{{ get_payment_setting('secret', PAYSTACK_PAYMENT_METHOD_NAME) }}" placeholder="sk_****">
                        </div>
                        <div class="form-group mb-3">
                            <label class="text-title-field" for="{{ PAYSTACK_PAYMENT_METHOD_NAME }}_merchant_email">{{ __('Merchant Email') }}</label>
                            <input type="email" class="next-input" placeholder="{{ __('Email') }}" id="{{ PAYSTACK_PAYMENT_METHOD_NAME }}_merchant_email"
                                   name="payment_{{ PAYSTACK_PAYMENT_METHOD_NAME }}_merchant_email"
                                   value="{{ get_payment_setting('merchant_email', PAYSTACK_PAYMENT_METHOD_NAME) }}">
                        </div>

                        <p class="payment-note">
                            {{ __('You will need to set Callback URL on') }} <a href="https://dashboard.paystack.com/#/settings/developer">https://dashboard.paystack.com/#/settings/developer</a> {{ __('to') }} <strong><code>{{ route('paystack.payment.callback') }}</code></strong>
                        </p>

                        {!! apply_filters(PAYMENT_METHOD_SETTINGS_CONTENT, null, PAYSTACK_PAYMENT_METHOD_NAME) !!}
                    </div>
                </div>
            </div>
            <div class="col-12 bg-white text-end">
                <button class="btn btn-warning disable-payment-item @if ($paystackStatus == 0) hidden @endif"
                        type="button">{{ trans('plugins/payment::payment.deactivate') }}</button>
                <button
                    class="btn btn-info save-payment-item btn-text-trigger-save @if ($paystackStatus == 1) hidden @endif"
                    type="button">{{ trans('plugins/payment::payment.activate') }}</button>
                <button
                    class="btn btn-info save-payment-item btn-text-trigger-update @if ($paystackStatus == 0) hidden @endif"
                    type="button">{{ trans('plugins/payment::payment.update') }}</button>
            </div>
            {!! Form::close() !!}
        </td>
    </tr>
    </tbody>
</table>
