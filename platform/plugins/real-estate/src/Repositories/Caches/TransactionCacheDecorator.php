<?php

namespace Botble\RealEstate\Repositories\Caches;

use Botble\Support\Repositories\Caches\CacheAbstractDecorator;
use Botble\RealEstate\Repositories\Interfaces\TransactionInterface;

class TransactionCacheDecorator extends CacheAbstractDecorator implements TransactionInterface
{

}
