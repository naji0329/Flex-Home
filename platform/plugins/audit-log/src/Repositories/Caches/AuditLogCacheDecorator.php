<?php

namespace Botble\AuditLog\Repositories\Caches;

use Botble\AuditLog\Repositories\Interfaces\AuditLogInterface;
use Botble\Support\Repositories\Caches\CacheAbstractDecorator;

/**
 * @since 16/09/2016 10:55 AM
 */
class AuditLogCacheDecorator extends CacheAbstractDecorator implements AuditLogInterface
{
}
