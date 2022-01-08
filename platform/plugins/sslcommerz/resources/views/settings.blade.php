@php $sslcommerzStatus = get_payment_setting('status', SSLCOMMERZ_PAYMENT_METHOD_NAME); @endphp
<table class="table payment-method-item">
    <tbody>
    <tr class="border-pay-row">
        <td class="border-pay-col"><i class="fa fa-theme-payments"></i></td>
        <td style="width: 20%;">
            <img class="filter-black" src="{{ url('vendor/core/plugins/sslcommerz/images/sslcommerz.png') }}"
                 alt="SslCommerz">
        </td>
        <td class="border-right">
            <ul>
                <li>
                    <a href="https://sslcommerz.com" target="_blank">{{ __('SslCommerz') }}</a>
                    <p>{{ __('Customer can buy product and pay directly using Visa, Credit card via :name', ['name' => 'SslCommerz']) }}</p>
                </li>
            </ul>
        </td>
    </tr>
    <tr class="bg-white">
        <td colspan="3">
            <div class="float-start" style="margin-top: 5px;">
                <div
                    class="payment-name-label-group @if (get_payment_setting('status', SSLCOMMERZ_PAYMENT_METHOD_NAME) == 0) hidden @endif">
                    <span class="payment-note v-a-t">{{ trans('plugins/payment::payment.use') }}:</span> <label
                        class="ws-nm inline-display method-name-label">{{ get_payment_setting('name', SSLCOMMERZ_PAYMENT_METHOD_NAME, __('Online payment via SslCommerz')) }}</label>
                </div>
            </div>
            <div class="float-end">
                <a class="btn btn-secondary toggle-payment-item edit-payment-item-btn-trigger @if ($sslcommerzStatus == 0) hidden @endif">{{ trans('plugins/payment::payment.edit') }}</a>
                <a class="btn btn-secondary toggle-payment-item save-payment-item-btn-trigger @if ($sslcommerzStatus == 1) hidden @endif">{{ trans('plugins/payment::payment.settings') }}</a>
            </div>
        </td>
    </tr>
    <tr class="paypal-online-payment payment-content-item hidden">
        <td class="border-left" colspan="3">
            {!! Form::open() !!}
            {!! Form::hidden('type', SSLCOMMERZ_PAYMENT_METHOD_NAME, ['class' => 'payment_type']) !!}
            <div class="row">
                <div class="col-sm-6">
                    <ul>
                        <li>
                            <label>{{ trans('plugins/payment::payment.configuration_instruction', ['name' => 'SslCommerz']) }}</label>
                        </li>
                        <li class="payment-note">
                            <p>{{ trans('plugins/payment::payment.configuration_requirement', ['name' => 'SslCommerz']) }}
                                :</p>
                            <ul class="m-md-l" style="list-style-type:decimal">
                                <li style="list-style-type:decimal">
                                    <p>For registration in Sandbox, click the link <a
                                            href="https://developer.sslcommerz.com/registration/" target="_blank">https://developer.sslcommerz.com/registration/</a></p>
                                    <p>For registration in Production, click the link <a
                                            href="https://signup.sslcommerz.com/register" target="_blank">https://signup.sslcommerz.com/register</a></p>
                                </li>
                                <li style="list-style-type:decimal">
                                    <p>{{ __('After registration at :name, you will have Store ID and Store Password (API/Secret key)', ['name' => 'SslCommerz']) }}</p>
                                </li>
                                <li style="list-style-type:decimal">
                                    <p>{{ __('Enter Store ID and Store Password (API/Secret key) into the box in right hand') }}</p>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="col-sm-6">
                    <div class="well bg-white">
                        <div class="form-group mb-3">
                            <label class="text-title-field"
                                   for="sslcommerz_name">{{ trans('plugins/payment::payment.method_name') }}</label>
                            <input type="text" class="next-input" name="payment_{{ SSLCOMMERZ_PAYMENT_METHOD_NAME }}_name"
                                   id="sslcommerz_name" data-counter="400"
                                   value="{{ get_payment_setting('name', SSLCOMMERZ_PAYMENT_METHOD_NAME, __('Online payment via SslCommerz')) }}">
                        </div>
                        <div class="form-group mb-3">
                            <label class="text-title-field" for="payment_{{ SSLCOMMERZ_PAYMENT_METHOD_NAME }}_description">{{ __('Description') }}</label>
                            <textarea class="next-input" name="payment_{{ SSLCOMMERZ_PAYMENT_METHOD_NAME }}_description" id="payment_{{ SSLCOMMERZ_PAYMENT_METHOD_NAME }}_description">{{ get_payment_setting('description', SSLCOMMERZ_PAYMENT_METHOD_NAME, __('The largest payment gateway aggregator in Bangladesh and a pioneer in the FinTech industry since 2010')) }}</textarea>
                        </div>
                        <p class="payment-note">
                            {{ trans('plugins/payment::payment.please_provide_information') }} <a target="_blank" href="https://sslcommerz.com">SslCommerz</a>:
                        </p>
                        <div class="form-group mb-3">
                            <label class="text-title-field" for="{{ SSLCOMMERZ_PAYMENT_METHOD_NAME }}_store_id">{{ __('Store ID') }}</label>
                            <input type="text" class="next-input"
                                   name="payment_{{ SSLCOMMERZ_PAYMENT_METHOD_NAME }}_store_id" id="{{ SSLCOMMERZ_PAYMENT_METHOD_NAME }}_store_id"
                                   value="{{ get_payment_setting('store_id', SSLCOMMERZ_PAYMENT_METHOD_NAME) }}">
                        </div>
                        <div class="form-group mb-3">
                            <label class="text-title-field" for="{{ SSLCOMMERZ_PAYMENT_METHOD_NAME }}_store_password">{{ __('Store Password (API/Secret key)') }}</label>
                            <input type="password" class="next-input"
                                   name="payment_{{ SSLCOMMERZ_PAYMENT_METHOD_NAME }}_store_password" id="{{ SSLCOMMERZ_PAYMENT_METHOD_NAME }}_store_password"
                                   value="{{ get_payment_setting('store_password', SSLCOMMERZ_PAYMENT_METHOD_NAME) }}">
                        </div>
                        <div class="form-group mb-3">
                            {!! Form::hidden('payment_' . SSLCOMMERZ_PAYMENT_METHOD_NAME . '_mode', 1) !!}
                            <label class="next-label">
                                <input type="checkbox" class="hrv-checkbox" value="0" name="payment_{{ SSLCOMMERZ_PAYMENT_METHOD_NAME }}_mode" @if (setting('payment_' . SSLCOMMERZ_PAYMENT_METHOD_NAME . '_mode') == 0) checked @endif>
                                {{ trans('plugins/payment::payment.sandbox_mode') }}
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 bg-white text-end">
                <button class="btn btn-warning disable-payment-item @if ($sslcommerzStatus == 0) hidden @endif"
                        type="button">{{ trans('plugins/payment::payment.deactivate') }}</button>
                <button
                    class="btn btn-info save-payment-item btn-text-trigger-save @if ($sslcommerzStatus == 1) hidden @endif"
                    type="button">{{ trans('plugins/payment::payment.activate') }}</button>
                <button
                    class="btn btn-info save-payment-item btn-text-trigger-update @if ($sslcommerzStatus == 0) hidden @endif"
                    type="button">{{ trans('plugins/payment::payment.update') }}</button>
            </div>
            {!! Form::close() !!}
        </td>
    </tr>
    </tbody>
</table>
