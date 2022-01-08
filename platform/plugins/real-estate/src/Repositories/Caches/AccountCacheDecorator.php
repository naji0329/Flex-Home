<?php

namespace Botble\RealEstate\Repositories\Caches;

use Botble\RealEstate\Repositories\Interfaces\AccountInterface;
use Botble\Support\Repositories\Caches\CacheAbstractDecorator;

class AccountCacheDecorator extends CacheAbstractDecorator implements AccountInterface
{
    /**
     * {@inheritDoc}
     */
    public function createUsername($name, $id = null)
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }
}
