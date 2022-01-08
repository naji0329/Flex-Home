<?php

namespace Botble\RealEstate\Facades;

use Botble\RealEstate\Supports\RealEstateHelper;
use Illuminate\Support\Facades\Facade;

class RealEstateHelperFacade extends Facade
{
    /**
     * Get the registered name of the component.
     *
     * @return string
     */
    protected static function getFacadeAccessor()
    {
        return RealEstateHelper::class;
    }
}
