<?php

namespace Botble\RealEstate\Enums;

use Botble\Base\Supports\Enum;
use Html;

/**
 * @method static TransactionTypeEnum REMOVE()
 * @method static TransactionTypeEnum ADD()
 */
class TransactionTypeEnum extends Enum
{
    public const ADD = 'add';
    public const REMOVE = 'remove';

    /**
     * @var string
     */
    public static $langPath = 'plugins/real-estate::transaction.types';

    /**
     * @return string
     */
    public function toHtml()
    {
        switch ($this->value) {
            case self::REMOVE:
                return Html::tag('span', self::REMOVE()->label(), ['class' => 'label-warning status-label'])
                    ->toHtml();
            case self::ADD:
                return Html::tag('span', self::ADD()->label(), ['class' => 'label-success status-label'])
                    ->toHtml();
            default:
                return null;
        }
    }
}
