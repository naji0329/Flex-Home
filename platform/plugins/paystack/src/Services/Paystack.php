<?php

namespace Botble\Paystack\Services;

use Exception;
use Unicodeveloper\Paystack\Paystack as PaystackUnico;

class Paystack extends PaystackUnico
{
    /**
     * Refund order
     * @return array
     * @throws Exception
     */
    public function refundOrder($paymentId, $amount)
    {
        $relativeUrl = '/refund';

        $data = [
            'body' => json_encode([
                'transaction' => $paymentId,
                'amount'      => $amount * 100,
            ]),
        ];

        $this->response = $this->client->post($this->baseUrl . $relativeUrl, $data);

        if ($this->isValid()) {
            return $this->getResponse();
        }

        throw new Exception('Invalid Refund Order Paystack');
    }

    /**
     * Get the whole response from a get operation
     * @return array
     */
    protected function getResponse()
    {
        return json_decode($this->response->getBody(), true);
    }

    /**
     * True or false condition whether the transaction is verified
     * @return boolean
     */
    public function isValid()
    {
        return $this->getResponse()['status'];
    }

    /**
     * Get transaction details
     * @param int $transactionId
     * @return array
     * @throws Exception
     */
    public function getPaymentDetails($transactionId)
    {
        $relativeUrl = '/transaction/' . $transactionId;

        $this->response = $this->client->get($this->baseUrl . $relativeUrl);

        if ($this->isValid()) {
            return $this->getResponse();
        }

        throw new Exception('Invalid Get Payment Details Paystack');
    }

    /**
     * Get list transactions
     * @param array $params
     * @return array
     * @throws Exception
     */
    public function getListTransactions($params = [])
    {
        $relativeUrl = '/transaction' . ($params ? ('?' . http_build_query($params)) : '');

        $this->response = $this->client->get($this->baseUrl . $relativeUrl);

        if ($this->isValid()) {
            return $this->getResponse();
        }

        throw new Exception('Invalid Get List Transactions Paystack');
    }

    /**
     * Refund order
     * @return array
     * @throws Exception
     */
    public function getRefundDetails($refundId)
    {
        $relativeUrl = '/refund/' . $refundId;

        $this->response = $this->client->get($this->baseUrl . $relativeUrl);

        if ($this->isValid()) {
            return $this->getResponse();
        }

        throw new Exception('Invalid Refund Order Paystack');
    }
}
