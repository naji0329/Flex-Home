<?php

namespace Botble\Language\Interfaces;

interface LocalizedUrlRoutable
{
    /**
     * Get the value of the model's localized route key.
     *
     * @return mixed
     */
    public function getLocalizedRouteKey($locale);
}
