<?php

namespace Botble\Media\Chunks\Exceptions;

use Exception;
use Throwable;

class UploadFailedException extends Exception
{
    /**
     * UploadFailedException constructor.
     * @param string $message
     * @param int $code
     * @param Throwable|null $previous
     */
    public function __construct($message, $code = 500, Throwable $previous = null)
    {
        parent::__construct($message, $code, $previous);
    }
}
