<?php

namespace Botble\Payment\Services\Gateways;

use Botble\Payment\Enums\PaymentMethodEnum;
use Botble\Payment\Enums\PaymentStatusEnum;
use Botble\Payment\Services\Abstracts\StripePaymentAbstract;
use Botble\Payment\Supports\StripeHelper;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Stripe\Charge;
use Stripe\Exception\ApiErrorException;

class StripePaymentService extends StripePaymentAbstract
{
    /**
     * Make a payment
     *
     * @param Request $request
     *
     * @return mixed
     * @throws ApiErrorException
     */
    public function makePayment(Request $request)
    {
        $this->amount = $request->input('amount');
        $this->currency = $request->input('currency', config('plugins.payment.payment.currency'));
        $this->currency = strtoupper($this->currency);

        $this->setClient();

        $amount = $this->amount;

        $multiplier = StripeHelper::getStripeCurrencyMultiplier($this->currency);

        if ($multiplier > 1) {
            $amount = (int)(round((float)$amount, 2) * $multiplier);
        } else {
            $amount = (int) $amount;
        }

        $charge = Charge::create([
            'amount'      => $amount,
            'currency'    => $this->currency,
            'source'      => $this->token,
            'description' => trans('plugins/payment::payment.payment_description', [
                'order_id' => Arr::first((array) $request->input('order_id')),
                'site_url' => $request->getHost(),
            ]),
        ]);

        $this->chargeId = $charge['id'];

        return $this->chargeId;
    }

    /**
     * Use this function to perform more logic after user has made a payment
     *
     * @param string $chargeId
     * @param Request $request
     *
     * @return mixed
     */
    public function afterMakePayment($chargeId, Request $request)
    {
        try {
            $payment = $this->getPaymentDetails($chargeId);
            if ($payment && ($payment->paid || $payment->status == 'succeeded')) {
                $paymentStatus = PaymentStatusEnum::COMPLETED;
            } else {
                $paymentStatus = PaymentStatusEnum::FAILED;
            }
        } catch (Exception $exception) {
            $paymentStatus = PaymentStatusEnum::FAILED;
        }

        $orderIds = (array)$request->input('order_id', []);

        do_action(PAYMENT_ACTION_PAYMENT_PROCESSED, [
            'amount'          => $request->input('amount'),
            'currency'        => $request->input('currency'),
            'charge_id'       => $chargeId,
            'order_id'        => $orderIds,
            'customer_id'     => $request->input('customer_id'),
            'customer_type'   => $request->input('customer_type'),
            'payment_channel' => PaymentMethodEnum::STRIPE,
            'status'          => $paymentStatus,
        ]);

        return $chargeId;
    }
}
