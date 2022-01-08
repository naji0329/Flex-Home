<?php

namespace Botble\Location\Facades;

use Botble\Location\Location;
use Illuminate\Support\Facades\Facade;

class LocationFacade extends Facade
{
    /**
     * Get the registered name of the component.
     *
     * @return string
     */
    protected static function getFacadeAccessor()
    {
        return Location::class;
    }
}
