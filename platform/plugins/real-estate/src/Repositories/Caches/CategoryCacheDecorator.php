<?php

namespace Botble\RealEstate\Repositories\Caches;

use Botble\Support\Repositories\Caches\CacheAbstractDecorator;
use Botble\RealEstate\Repositories\Interfaces\CategoryInterface;

class CategoryCacheDecorator extends CacheAbstractDecorator implements CategoryInterface
{
    /**
     * {@inheritDoc}
     */
    public function getCategories(array $select, array $orderBy)
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }
}
