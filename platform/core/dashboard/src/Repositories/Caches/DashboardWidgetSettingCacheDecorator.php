<?php

namespace Botble\Dashboard\Repositories\Caches;

use Botble\Dashboard\Repositories\Interfaces\DashboardWidgetSettingInterface;
use Botble\Support\Repositories\Caches\CacheAbstractDecorator;

class DashboardWidgetSettingCacheDecorator extends CacheAbstractDecorator implements DashboardWidgetSettingInterface
{
    /**
     * {@inheritDoc}
     */
    public function getListWidget()
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }
}
