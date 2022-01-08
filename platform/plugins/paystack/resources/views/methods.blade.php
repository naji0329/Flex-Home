@if (get_payment_setting('status', PAYSTACK_PAYMENT_METHOD_NAME) == 1)
    <li class="list-group-item">
        <input class="magic-radio js_payment_method" type="radio" name="payment_method" id="payment_{{ PAYSTACK_PAYMENT_METHOD_NAME }}"
               value="{{ PAYSTACK_PAYMENT_METHOD_NAME }}" data-bs-toggle="collapse" data-bs-target=".payment_{{ PAYSTACK_PAYMENT_METHOD_NAME }}_wrap"
               data-parent=".list_payment_method"
               @if (setting('default_payment_method') == PAYSTACK_PAYMENT_METHOD_NAME) checked @endif
        >
        <label for="payment_{{ PAYSTACK_PAYMENT_METHOD_NAME }}">{{ get_payment_setting('name', PAYSTACK_PAYMENT_METHOD_NAME) }}</label>
        <div class="payment_{{ PAYSTACK_PAYMENT_METHOD_NAME }}_wrap payment_collapse_wrap collapse @if (setting('default_payment_method') == PAYSTACK_PAYMENT_METHOD_NAME) show @endif">
            <p>{!! clean(get_payment_setting('description', PAYSTACK_PAYMENT_METHOD_NAME, __('Payment with Paystack'))) !!}</p>

            @php $supportedCurrencies = (new \Botble\Paystack\Services\Gateways\PaystackPaymentService)->supportedCurrencyCodes(); @endphp
            @if (!in_array(get_application_currency()->title, $supportedCurrencies))
                <div class="alert alert-warning" style="margin-top: 15px;">
                    {{ __(":name doesn't support :currency. List of currencies supported by :name: :currencies.", ['name' => 'Paystack', 'currency' => get_application_currency()->title, 'currencies' => implode(', ', $supportedCurrencies)]) }}
                    <div style="margin-top: 10px;">
                        {{ __('Learn more') }}: <a href="https://support.paystack.com/hc/en-us/articles/360009973779" target="_blank" rel="nofollow">https://support.paystack.com/hc/en-us/articles/360009973779</a>
                    </div>
                    @php
                        $currencies = get_all_currencies();

                        $currencies = $currencies->filter(function ($item) use ($supportedCurrencies) { return in_array($item->title, $supportedCurrencies); });
                    @endphp
                    @if (count($currencies))
                        <div style="margin-top: 10px;">{{ __('Please switch currency to any supported currency') }}:&nbsp;&nbsp;
                            @foreach ($currencies as $currency)
                                <a href="{{ route('public.change-currency', $currency->title) }}" @if (get_application_currency_id() == $currency->id) class="active" @endif><span>{{ $currency->title }}</span></a>
                                @if (!$loop->last)
                                    &nbsp; | &nbsp;
                                @endif
                            @endforeach
                        </div>
                    @endif
                </div>
            @endif
        </div>
    </li>
@endif
