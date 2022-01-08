<?php

namespace Botble\Contact\Repositories\Caches;

use Botble\Contact\Repositories\Interfaces\ContactReplyInterface;
use Botble\Support\Repositories\Caches\CacheAbstractDecorator;

class ContactReplyCacheDecorator extends CacheAbstractDecorator implements ContactReplyInterface
{
}
