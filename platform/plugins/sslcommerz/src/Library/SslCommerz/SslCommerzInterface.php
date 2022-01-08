<?php

namespace Botble\SslCommerz\Library\SslCommerz;

interface SslCommerzInterface
{
    /**
     * @param array $data
     * @return mixed
     */
    public function makePayment(array $data);

    /**
     * @param array $requestData
     * @param string $trxID
     * @param float $amount
     * @param string $currency
     * @return mixed
     */
    public function orderValidate($requestData, $trxID, $amount, $currency);

    /**
     * @param array $data
     * @return mixed
     */
    public function setParams($data);

    /**
     * @param array $data
     * @return mixed
     */
    public function setRequiredInfo(array $data);

    /**
     * @param array $data
     * @return mixed
     */
    public function setCustomerInfo(array $data);

    /**
     * @param array $data
     * @return mixed
     */
    public function setShipmentInfo(array $data);

    /**
     * @param array $data
     * @return mixed
     */
    public function setProductInfo(array $data);

    /**
     * @param array $data
     * @return mixed
     */
    public function setAdditionalInfo(array $data);

    /**
     * @param array $data
     * @param array $header
     * @param false $setLocalhost
     * @return mixed
     */
    public function callToApi($data, $header = [], $setLocalhost = false);
}
