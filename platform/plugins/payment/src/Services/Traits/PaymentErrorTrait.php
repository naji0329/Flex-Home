<?php

namespace Botble\Payment\Services\Traits;

use Botble\Payment\Supports\StripeHelper;
use Exception;
use Illuminate\Support\Arr;
use Log;
use Stripe\Exception\ApiErrorException;

trait PaymentErrorTrait
{
    /**
     * @var string
     */
    protected $errorMessage = null;

    /**
     * @return string
     */
    public function getErrorMessage()
    {
        return $this->errorMessage;
    }

    /**
     * @param null $message
     */
    public function setErrorMessage($message = null)
    {
        $this->errorMessage = $message;
    }

    /**
     * Set error message and logging that error
     *
     * @param Exception $exception
     * @param integer $case
     */
    protected function setErrorMessageAndLogging($exception, $case)
    {
        try {
            $error = [];

            if (!$exception instanceof ApiErrorException) {
                $this->errorMessage = $exception->getMessage();
            } else {
                $body = $exception->getJsonBody();
                $error = $body['error'];
                if (!empty($err['message'])) {
                    $this->errorMessage = $error['message'];
                } else {
                    $this->errorMessage = $exception->getMessage();
                }
            }

            Log::error(
                'Failed to make a payment charge.',
                StripeHelper::formatLog([
                    'catch_case'    => $case,
                    'http_status'   => ($exception instanceof ApiErrorException) ? $exception->getHttpStatus() : 'not-have-http-status',
                    'error_type'    => Arr::get($error, 'type', 'not-have-error-type'),
                    'error_code'    => Arr::get($error, 'code', $exception->getCode()),
                    'error_param'   => Arr::get($error, 'param', 'not-have-error-param'),
                    'error_message' => $this->errorMessage,
                ], __LINE__, __FUNCTION__, __CLASS__)
            );
        } catch (Exception $exception) {
            Log::error(
                'Failed to make a payment charge.',
                StripeHelper::formatLog([
                    'catch_case'    => $case,
                    'error_message' => $exception->getMessage(),
                ], __LINE__, __FUNCTION__, __CLASS__)
            );
        }
    }
}
