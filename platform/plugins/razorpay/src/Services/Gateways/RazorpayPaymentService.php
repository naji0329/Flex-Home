<?php

namespace Botble\Razorpay\Services\Gateways;

use Botble\Razorpay\Services\Abstracts\RazorpayPaymentAbstract;
use Exception;
use Illuminate\Http\Request;

class RazorpayPaymentService extends RazorpayPaymentAbstract
{
    /**
     * Make a payment
     *
     * @param Request $request
     *
     * @return mixed
     * @throws Exception
     */
    public function makePayment(Request $request)
    {
    }

    /**
     * Use this function to perform more logic after user has made a payment
     *
     * @param Request $request
     *
     * @return mixed
     */
    public function afterMakePayment(Request $request)
    {
    }
}
