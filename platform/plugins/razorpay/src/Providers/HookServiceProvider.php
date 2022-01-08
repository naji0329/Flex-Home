<?php

namespace Botble\Razorpay\Providers;

use Botble\Payment\Enums\PaymentMethodEnum;
use Botble\Payment\Enums\PaymentStatusEnum;
use Botble\Razorpay\Services\Gateways\RazorpayPaymentService;
use Exception;
use Html;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Str;
use Razorpay\Api\Api;
use Razorpay\Api\Errors\SignatureVerificationError;
use Throwable;

class HookServiceProvider extends ServiceProvider
{
    public function boot()
    {
        add_filter(PAYMENT_FILTER_ADDITIONAL_PAYMENT_METHODS, [$this, 'registerRazorpayMethod'], 11, 2);
        add_filter(PAYMENT_FILTER_AFTER_POST_CHECKOUT, [$this, 'checkoutWithRazorpay'], 11, 2);

        add_filter(PAYMENT_METHODS_SETTINGS_PAGE, [$this, 'addPaymentSettings'], 93);

        add_filter(BASE_FILTER_ENUM_ARRAY, function ($values, $class) {
            if ($class == PaymentMethodEnum::class) {
                $values['RAZORPAY'] = RAZORPAY_PAYMENT_METHOD_NAME;
            }

            return $values;
        }, 20, 2);

        add_filter(BASE_FILTER_ENUM_LABEL, function ($value, $class) {
            if ($class == PaymentMethodEnum::class && $value == RAZORPAY_PAYMENT_METHOD_NAME) {
                $value = 'Razorpay';
            }

            return $value;
        }, 20, 2);

        add_filter(BASE_FILTER_ENUM_HTML, function ($value, $class) {
            if ($class == PaymentMethodEnum::class && $value == RAZORPAY_PAYMENT_METHOD_NAME) {
                $value = Html::tag('span', PaymentMethodEnum::getLabel($value),
                    ['class' => 'label-success status-label'])
                    ->toHtml();
            }

            return $value;
        }, 20, 2);

        add_filter(PAYMENT_FILTER_GET_SERVICE_CLASS, function ($data, $value) {
            if ($value == RAZORPAY_PAYMENT_METHOD_NAME) {
                $data = RazorpayPaymentService::class;
            }

            return $data;
        }, 20, 2);

        add_filter(PAYMENT_FILTER_PAYMENT_INFO_DETAIL, function ($data, $payment) {
            if ($payment->payment_channel == RAZORPAY_PAYMENT_METHOD_NAME) {
                $paymentService = new RazorpayPaymentService;
                $paymentDetail = $paymentService->getPaymentDetails($payment->charge_id);

                if ($paymentDetail) {
                    $data = view('plugins/razorpay::detail', ['payment' => $paymentDetail, 'paymentModel' => $payment])->render();
                }
            }

            return $data;
        }, 20, 2);

        add_filter(PAYMENT_FILTER_GET_REFUND_DETAIL, function ($data, $payment, $refundId) {
            if ($payment->payment_channel == RAZORPAY_PAYMENT_METHOD_NAME) {
                $refundDetail = (new RazorpayPaymentService)->getRefundDetails($refundId);
                if (!Arr::get($refundDetail, 'error')) {
                    $refunds = Arr::get($payment->metadata, 'refunds', []);
                    $refund = collect($refunds)->firstWhere('id', $refundId);
                    $refund = array_merge((array) $refund, Arr::get($refundDetail, 'data', []));
                    return array_merge($refundDetail, [
                        'view' => view('plugins/razorpay::refund-detail', ['refund' => $refund, 'paymentModel' => $payment])->render(),
                    ]);
                }
                return $refundDetail;
            }

            return $data;
        }, 20, 3);
    }

    /**
     * @param string $settings
     * @return string
     * @throws Throwable
     */
    public function addPaymentSettings($settings)
    {
        return $settings . view('plugins/razorpay::settings')->render();
    }

    /**
     * @param string $html
     * @param array $data
     * @return string
     */
    public function registerRazorpayMethod($html, $data)
    {
        $apiKey = get_payment_setting('key', RAZORPAY_PAYMENT_METHOD_NAME);
        $apiSecret = get_payment_setting('secret', RAZORPAY_PAYMENT_METHOD_NAME);

        if (!$apiKey || !$apiSecret) {
            return $html;
        }

        try {
            $api = new Api($apiKey, $apiSecret);

            $receiptId = Str::random(20);

            $amount = $data['amount'] * 100;

            $order = $api->order->create([
                'receipt'  => $receiptId,
                'amount'   => (int) $amount,
                'currency' => $data['currency'],
            ]);

            $data['orderId'] = $order['id'];

            return $html . view('plugins/razorpay::methods', $data)->render();
        } catch (Exception $exception) {
            info($exception->getMessage());
            return $html;
        }
    }

    /**
     * @param Request $request
     * @param array $data
     * @return array
     */
    public function checkoutWithRazorpay(array $data, Request $request)
    {
        if ($request->input('payment_method') == RAZORPAY_PAYMENT_METHOD_NAME) {
            try {
                $api = new Api(get_payment_setting('key', RAZORPAY_PAYMENT_METHOD_NAME),
                    get_payment_setting('secret', RAZORPAY_PAYMENT_METHOD_NAME));

                $api->utility->verifyPaymentSignature([
                    'razorpay_signature'  => $request->input('razorpay_signature'),
                    'razorpay_payment_id' => $request->input('razorpay_payment_id'),
                    'razorpay_order_id'   => $request->input('razorpay_order_id'),
                ]);

                $order = $api->order->fetch($request->input('razorpay_order_id'));

                $order = $order->toArray();

                if ($order['status'] == 'paid') {
                    $amount = $order['amount_paid'] / 100;

                    $status = PaymentStatusEnum::COMPLETED;

                    $data['charge_id'] = $request->input('razorpay_payment_id');

                    if ($data['charge_id']) {
                        do_action(PAYMENT_ACTION_PAYMENT_PROCESSED, [
                            'account_id'      => Arr::get($data, 'account_id'),
                            'amount'          => $amount,
                            'currency'        => $data['currency'],
                            'charge_id'       => $data['charge_id'],
                            'payment_channel' => RAZORPAY_PAYMENT_METHOD_NAME,
                            'status'          => $status,
                            'order_id'        => (array) $request->input('order_id', []),
                        ]);
                    } else {
                        $data['error'] = true;
                        $data['message'] = __('Payment failed!');
                    }
                } else {
                    $data['error'] = true;
                    $data['message'] = __('Payment failed!');
                }

            } catch (SignatureVerificationError $exception) {
                $data['message'] = $exception->getMessage();
                $data['error'] = true;
            }
        }

        return $data;
    }
}
