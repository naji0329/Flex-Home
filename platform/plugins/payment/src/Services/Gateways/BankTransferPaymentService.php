<?php

namespace Botble\Payment\Services\Gateways;

use Botble\Payment\Enums\PaymentMethodEnum;
use Botble\Payment\Enums\PaymentStatusEnum;
use Botble\Support\Services\ProduceServiceInterface;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class BankTransferPaymentService implements ProduceServiceInterface
{
    /**
     * @param Request $request
     * @return mixed|void
     */
    public function execute(Request $request)
    {
        $chargeId = Str::upper(Str::random(10));

        $orderIds = (array)$request->input('order_id', []);

        do_action(PAYMENT_ACTION_PAYMENT_PROCESSED, [
            'amount'          => $request->input('amount'),
            'currency'        => $request->input('currency'),
            'charge_id'       => $chargeId,
            'order_id'        => $orderIds,
            'customer_id'     => $request->input('customer_id'),
            'customer_type'   => $request->input('customer_type'),
            'payment_channel' => PaymentMethodEnum::BANK_TRANSFER,
            'status'          => PaymentStatusEnum::PENDING,
        ]);

        return $chargeId;
    }
}
