<?php

namespace Botble\ACL\Enums;

use Botble\Base\Supports\Enum;
use Html;

/**
 * @method static UserStatusEnum ACTIVATED()
 * @method static UserStatusEnum DEACTIVATED()
 */
class UserStatusEnum extends Enum
{
    public const ACTIVATED = 'activated';
    public const DEACTIVATED = 'deactivated';

    /**
     * @var string
     */
    public static $langPath = 'core/acl::users.statuses';

    /**
     * @return string
     */
    public function toHtml()
    {
        switch ($this->value) {
            case self::ACTIVATED:
                return Html::tag('span', self::ACTIVATED()->label(), ['class' => 'label-info status-label'])
                    ->toHtml();
            case self::DEACTIVATED:
                return Html::tag('span', self::DEACTIVATED()->label(), ['class' => 'label-warning status-label'])
                    ->toHtml();
            default:
                return parent::toHtml();
        }
    }
}
