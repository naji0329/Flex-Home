<?php

namespace Botble\Location\Repositories\Caches;

use Botble\Support\Repositories\Caches\CacheAbstractDecorator;
use Botble\Location\Repositories\Interfaces\CityInterface;

class CityCacheDecorator extends CacheAbstractDecorator implements CityInterface
{
    /**
     * {@inheritDoc}
     */
    public function filters($keyword, $limit = 10, array $with = [], array $select = ['cities.*'])
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }
}
