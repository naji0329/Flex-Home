<?php

namespace Botble\Analytics\Exceptions;

use Exception;
use Illuminate\Contracts\Filesystem\FileNotFoundException;

class InvalidConfiguration extends Exception
{
    /**
     * @return static
     * @throws FileNotFoundException
     */
    public static function viewIdNotSpecified()
    {
        return new static(trans('plugins/analytics::analytics.view_id_not_specified'));
    }

    /**
     * @return static
     * @throws FileNotFoundException
     */
    public static function credentialsIsNotValid()
    {
        return new static(trans('plugins/analytics::analytics.credential_is_not_valid'));
    }
}
