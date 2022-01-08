<?php

namespace Botble\Media\Chunks\Exceptions;

use Exception;
use Throwable;

class MissingChunkFilesException extends Exception
{
    /**
     * MissingChunkFilesException constructor.
     * @param string $message
     * @param int $code
     * @param Throwable|null $previous
     */
    public function __construct(
        $message = 'Logic did not find any chunk file - check the folder configuration',
        $code = 500,
        Throwable $previous = null
    ) {
        parent::__construct($message, $code, $previous);
    }
}
