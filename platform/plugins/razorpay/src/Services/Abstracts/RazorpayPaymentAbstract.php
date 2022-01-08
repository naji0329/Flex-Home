<?php

namespace Botble\Razorpay\Services\Abstracts;

use Botble\Payment\Services\Traits\PaymentErrorTrait;
use Botble\Support\Services\ProduceServiceInterface;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Razorpay\Api\Api;

abstract class RazorpayPaymentAbstract implements ProduceServiceInterface
{
    use PaymentErrorTrait;

    /**
     * @var string
     */
    protected $paymentCurrency;

    /**
     * @var object
     */
    protected $client;

    /**
     * @var bool
     */
    protected $supportRefundOnline;

    /**
     * RazorpayPaymentAbstract constructor.
     */
    public function __construct()
    {
        $this->paymentCurrency = config('plugins.payment.payment.currency');

        $this->totalAmount = 0;

        $this->setClient();

        $this->supportRefundOnline = true;
    }

    /**
     * @return bool
     */
    public function getSupportRefundOnline()
    {
        return $this->supportRefundOnline;
    }

    /**
     * @return object|Api
     */
    public function getClient()
    {
        return $this->client;
    }

    /**
     * Set client
     * @return self
     */
    public function setClient()
    {
        $key = get_payment_setting('key', RAZORPAY_PAYMENT_METHOD_NAME);
        $secret = get_payment_setting('secret', RAZORPAY_PAYMENT_METHOD_NAME);
        $this->client = new Api($key, $secret);

        return $this;
    }

    /**
     * Set payment currency
     *
     * @param string $currency String name of currency
     * @return self
     */
    public function setCurrency($currency)
    {
        $this->paymentCurrency = $currency;

        return $this;
    }

    /**
     * Get current payment currency
     *
     * @return string Current payment currency
     */
    public function getCurrency()
    {
        return $this->paymentCurrency;
    }

    /**
     * Get payment details
     *
     * @param string $paymentId
     * @return mixed Object payment details
     * @throws Exception
     */
    public function getPaymentDetails($paymentId)
    {
        try {
            $response = $this->client->payment->fetch($paymentId); // Returns a particular payment
        } catch (Exception $exception) {
            $this->setErrorMessageAndLogging($exception, 1);
            return false;
        }

        return $response;
    }

    /**
     * This function can be used to preform refund on the capture.
     */
    public function refundOrder($paymentId, $amount, array $options = [])
    {
        try {
            $response = $this->client->refund->create([
                'payment_id' => $paymentId,
                'amount'     => $amount * 100,
                'notes'      => $options,
            ]);

            $status = $response->status;

            if ($response->status == 'processed') {
                $response = $response->toArray();
                $response = array_merge($response, ['_refund_id' => Arr::get($response, 'id')]);

                return [
                    'error'   => false,
                    'message' => $status,
                    'data'    => $response,
                ];
            }

            return [
                'error'   => true,
                'message' => trans('plugins/payment::payment.status_is_not_completed'),
            ];
        } catch (Exception $exception) {
            $this->setErrorMessageAndLogging($exception, 1);
            return [
                'error'   => true,
                'message' => $exception->getMessage(),
            ];
        }
    }

    /**
     * Get refund details
     *
     * @param string $refundId
     * @return mixed Object refund details
     * @throws Exception
     */
    public function getRefundDetails($refundId)
    {
        try {
            $response = $this->client->refund->fetch($refundId);

            return [
                'error'   => false,
                'message' => $response->status,
                'data'    => (array)$response->toArray(),
                'status'  => $response->status,
            ];
        } catch (Exception $exception) {
            $this->setErrorMessageAndLogging($exception, 1);
            return [
                'error'   => true,
                'message' => $exception->getMessage(),
            ];
        }
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
        try {
            return $this->makePayment($request);
        } catch (Exception $exception) {
            $this->setErrorMessageAndLogging($exception, 1);
            return false;
        }
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
     * List currencies supported https://razorpay.com/docs/payments/payments/international-payments/#supported-currencies
     * @return string[]
     */
    public function supportedCurrencyCodes(): array
    {
        return [
            'INR',
            'USD',
            'EUR',
            'SGD',
        ];
    }

    /**
     * Use this function to perform more logic after user has made a payment
     *
     * @param Request $request
     *
     * @return mixed
     */
    abstract public function afterMakePayment(Request $request);
}
