<?php

namespace Botble\Media\Chunks\Exceptions;

use Exception;

class UploadMissingFileException extends Exception
{
    /**
     * UploadMissingFileException constructor.
     * @param string $message
     * @param int $code
     * @param Exception|null $previous
     */
    public function __construct($message = 'The request is missing a file', $code = 400, Exception $previous = null)
    {
        parent::__construct($message, $code, $previous);
    }
}
