@if (setting('payment_stripe_status') == 1)
    <li class="list-group-item">
        <input class="magic-radio js_payment_method" type="radio" name="payment_method" id="payment_stripe"
               value="stripe" @if (!setting('default_payment_method') || setting('default_payment_method') == \Botble\Payment\Enums\PaymentMethodEnum::STRIPE) checked @endif data-bs-toggle="collapse" data-bs-target=".payment_stripe_wrap" data-parent=".list_payment_method">
        <label for="payment_stripe" class="text-start">
            {{ setting('payment_stripe_name', trans('plugins/payment::payment.payment_via_card')) }}
        </label>
        <div class="payment_stripe_wrap payment_collapse_wrap collapse @if (!setting('default_payment_method') || setting('default_payment_method') == \Botble\Payment\Enums\PaymentMethodEnum::STRIPE) show @endif">
            <div class="card-checkout" style="max-width: 350px">
                <div class="form-group mt-3 mb-3">
                    <div class="stripe-card-wrapper"></div>
                </div>
                <div class="form-group mb-3 @if ($errors->has('number') || $errors->has('expiry')) has-error @endif">
                    <div class="row">
                        <div class="col-sm-8">
                            <input placeholder="{{ trans('plugins/payment::payment.card_number') }}"
                                   class="form-control" type="text" id="stripe-number" data-stripe="number" autocomplete="off">
                        </div>
                        <div class="col-sm-4">
                            <input placeholder="{{ trans('plugins/payment::payment.mm_yy') }}" class="form-control"
                                   type="text" id="stripe-exp" data-stripe="exp" autocomplete="off">
                        </div>
                    </div>
                </div>
                <div class="form-group mb-3 @if ($errors->has('name') || $errors->has('cvc')) has-error @endif">
                    <div class="row">
                        <div class="col-sm-8">
                            <input placeholder="{{ trans('plugins/payment::payment.full_name') }}"
                                   class="form-control" id="stripe-name" type="text" data-stripe="name" autocomplete="off">
                        </div>
                        <div class="col-sm-4">
                            <input placeholder="{{ trans('plugins/payment::payment.cvc') }}" class="form-control"
                                   type="text" id="stripe-cvc" data-stripe="cvc" autocomplete="off">
                        </div>
                    </div>
                </div>
            </div>
            <div id="payment-stripe-key" data-value="{{ setting('payment_stripe_client_id') }}"></div>
        </div>
    </li>
@endif
