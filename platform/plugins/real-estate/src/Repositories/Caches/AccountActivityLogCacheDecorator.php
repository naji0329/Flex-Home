<?php

namespace Botble\RealEstate\Repositories\Caches;

use Botble\RealEstate\Repositories\Interfaces\AccountActivityLogInterface;
use Botble\Support\Repositories\Caches\CacheAbstractDecorator;

class AccountActivityLogCacheDecorator extends CacheAbstractDecorator implements AccountActivityLogInterface
{
    /**
     * {@inheritdoc}
     */
    public function getAllLogs($accountId, $paginate = 10)
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }
}
