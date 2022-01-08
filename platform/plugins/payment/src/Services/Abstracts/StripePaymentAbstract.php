<?php

namespace Botble\Payment\Services\Abstracts;

use Botble\Payment\Services\Traits\PaymentErrorTrait;
use Botble\Payment\Supports\StripeHelper;
use Botble\Support\Services\ProduceServiceInterface;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Log;
use Stripe\Charge;
use Stripe\Exception\ApiConnectionException;
use Stripe\Exception\ApiErrorException;
use Stripe\Exception\AuthenticationException;
use Stripe\Exception\CardException;
use Stripe\Exception\InvalidRequestException;
use Stripe\Exception\RateLimitException;
use Stripe\Refund;
use Stripe\Stripe;

abstract class StripePaymentAbstract implements ProduceServiceInterface
{
    use PaymentErrorTrait;

    /**
     * Token
     *
     * @var string
     */
    protected $token;

    /**
     * Amount of payment
     *
     * @var double
     */
    protected $amount;

    /**
     * Payment currency
     *
     * @var string
     */
    protected $currency;

    /**
     * For Stripe, after make charge successfully, it will return a charge ID for tracking purpose
     * We will store this Charge ID in our DB for tracking purpose
     *
     * @var string
     */
    protected $chargeId;

    /**
     * @var bool
     */
    protected $supportRefundOnline = true;

    /**
     * @return bool
     */
    public function getSupportRefundOnline()
    {
        return $this->supportRefundOnline;
    }

    /**
     * Execute main service
     *
     * @param Request $request
     *
     * @return mixed
     */
    public function execute(Request $request)
    {
        if (!$request->input('stripeToken')) {
            $this->setErrorMessage(trans('plugins/payment::payment.could_not_get_stripe_token'));

            Log::error(
                trans('plugins/payment::payment.could_not_get_stripe_token'),
                StripeHelper::formatLog(
                    [
                        'error'         => 'missing Stripe token',
                        'last_4_digits' => $request->input('last4Digits'),
                        'name'          => $request->input('name'),
                        'client_IP'     => $request->input('clientIP'),
                        'time_created'  => $request->input('timeCreated'),
                        'live_mode'     => $request->input('liveMode'),
                    ],
                    __LINE__,
                    __FUNCTION__,
                    __CLASS__
                )
            );

            return false;
        }

        $this->token = $request->stripeToken;

        $chargeId = Str::upper(Str::random(10));

        try {
            $chargeId = $this->makePayment($request);
        } catch (CardException $exception) {
            $this->setErrorMessageAndLogging($exception, 1); // Since it's a decline, \Stripe\Error\Card will be caught
        } catch (RateLimitException $exception) {
            $this->setErrorMessageAndLogging($exception, 2); // Too many requests made to the API too quickly
        } catch (InvalidRequestException $exception) {
            $this->setErrorMessageAndLogging($exception, 3); // Invalid parameters were supplied to Stripe's API
        } catch (AuthenticationException $exception) {
            $this->setErrorMessageAndLogging($exception, 4); // Authentication with Stripe's API failed (maybe you changed API keys recently)
        } catch (ApiConnectionException $exception) {
            $this->setErrorMessageAndLogging($exception, 5); // Network communication with Stripe failed
        } catch (ApiErrorException $exception) {
            $this->setErrorMessageAndLogging($exception, 6); // Display a very generic error to the user, and maybe send yourself an email
        } catch (Exception $exception) {
            $this->setErrorMessageAndLogging($exception, 7); // Something else happened, completely unrelated to Stripe
        }

        // Hook after made payment
        $this->afterMakePayment($chargeId, $request);

        return $chargeId;
    }

    /**
     * Make a payment
     *
     * @param Request $request
     *
     * @return mixed
     */
    abstract public function makePayment(Request $request);

    /**
     * Use this function to perform more logic after user has made a payment
     *
     * @param string $chargeId
     * @param Request $request
     *
     * @return mixed
     */
    abstract public function afterMakePayment($chargeId, Request $request);

    /**
     * Get payment details
     *
     * @param string $chargeId Stripe charge ID
     * @return mixed Object payment details
     * @throws Exception
     */
    public function getPaymentDetails($chargeId)
    {
        if (!$this->setClient()) {
            return null;
        }

        try {
            return Charge::retrieve($chargeId);
        } catch (Exception $exception) {
            return null;
        }
    }

    /**
     * @return bool
     */
    public function setClient(): bool
    {
        $secret = setting('payment_stripe_secret');
        $clientId = setting('payment_stripe_client_id');

        if (!$secret || !$clientId) {
            return false;
        }

        Stripe::setApiKey($secret);
        Stripe::setClientId($clientId);

        return true;
    }

    /**
     * @param string $currency
     * @return $this
     */
    public function setCurrency($currency)
    {
        $this->currency = $currency;

        return $this;
    }

    /**
     * This function can be used to preform refund
     * @param string $paymentId
     * @param int $totalAmount
     * @param array $options
     * @return array
     */
    public function refundOrder($paymentId, $totalAmount, array $options = [])
    {
        if (!$this->setClient()) {
            return [
                'error'   => true,
                'message' => trans('plugins/payment::payment.invalid_settings', ['name' => 'Stripe']),
            ];
        }

        $multiplier = StripeHelper::getStripeCurrencyMultiplier($this->currency);

        if ($multiplier > 1) {
            $totalAmount = (int)(round((float)$totalAmount, 2) * $multiplier);
        }

        try {
            $response = Refund::create([
                'charge'   => $paymentId,
                'amount'   => $totalAmount,
                'metadata' => $options,
            ]);

            if ($response->status == 'succeeded') {
                return [
                    'error'   => false,
                    'message' => $response->status,
                    'data'    => (array) $response,
                ];
            }
            return [
                'error'   => true,
                'message' => trans('plugins/payment::payment.status_is_not_completed'),
            ];
        } catch (Exception $exception) {
            return [
                'error'   => true,
                'message' => $exception->getMessage(),
            ];
        }
    }
}
