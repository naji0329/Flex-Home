<?php

namespace Botble\Paystack\Services\Abstracts;

use Botble\Payment\Models\Payment;
use Botble\Payment\Services\Traits\PaymentErrorTrait;
use Botble\Paystack\Services\Paystack;
use Botble\Support\Services\ProduceServiceInterface;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;

abstract class PaystackPaymentAbstract implements ProduceServiceInterface
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
     * PaystackPaymentAbstract constructor.
     */
    public function __construct()
    {
        $this->paymentCurrency = config('plugins.payment.payment.currency');

        $this->totalAmount = 0;

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
     * @param Payment $payment
     * @return mixed Object payment details
     * @throws Exception
     */
    public function getPaymentDetails($payment)
    {
        try {
            $params = [
                'from' => $payment->created_at->subDays(1)->toISOString(),
                'to'   => $payment->created_at->addDays(1)->toISOString(),
            ];

            $response = (new Paystack)->getListTransactions($params);
            if ($response['status']) {
                return collect($response['data'])->firstWhere('reference', $payment->charge_id);
            }
        } catch (Exception $exception) {
            $this->setErrorMessageAndLogging($exception, 1);
            return false;
        }

        return false;
    }

    /**
     * This function can be used to preform refund on the capture.
     */
    public function refundOrder($paymentId, $amount)
    {
        try {
            $response = (new Paystack)->refundOrder($paymentId, $amount);

            if ($response['status']) {
                $response = array_merge($response, ['_refund_id' => Arr::get($response, 'data.id')]);
                return [
                    'error'   => false,
                    'message' => $response['message'],
                    'data'    => (array) $response,
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
            $response = (new Paystack)->getRefundDetails($refundId);
            if ($response['status']) {
                return [
                    'error'   => false,
                    'message' => $response['message'],
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
     * Use this function to perform more logic after user has made a payment
     *
     * @param Request $request
     *
     * @return mixed
     */
    abstract public function afterMakePayment(Request $request);
}
