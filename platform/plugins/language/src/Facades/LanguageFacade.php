<?php

namespace Botble\Language\Facades;

use Botble\Language\LanguageManager;
use Illuminate\Support\Facades\Facade;

class LanguageFacade extends Facade
{

    /**
     * @return string
     */
    protected static function getFacadeAccessor()
    {
        return LanguageManager::class;
    }
}
