<?php

namespace Botble\Contact\Enums;

use Botble\Base\Supports\Enum;
use Html;

/**
 * @method static ContactStatusEnum UNREAD()
 * @method static ContactStatusEnum READ()
 */
class ContactStatusEnum extends Enum
{
    public const READ = 'read';
    public const UNREAD = 'unread';

    /**
     * @var string
     */
    public static $langPath = 'plugins/contact::contact.statuses';

    /**
     * @return string
     */
    public function toHtml()
    {
        switch ($this->value) {
            case self::UNREAD:
                return Html::tag('span', self::UNREAD()->label(), ['class' => 'label-warning status-label'])
                    ->toHtml();
            case self::READ:
                return Html::tag('span', self::READ()->label(), ['class' => 'label-success status-label'])
                    ->toHtml();
            default:
                return parent::toHtml();
        }
    }
}
