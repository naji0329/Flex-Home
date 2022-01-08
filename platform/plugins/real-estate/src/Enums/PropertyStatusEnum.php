<?php

namespace Botble\RealEstate\Enums;

use Botble\Base\Supports\Enum;
use Html;

/**
 * @method static PropertyStatusEnum NOT_AVAILABLE()
 * @method static PropertyStatusEnum PRE_SALE()
 * @method static PropertyStatusEnum SELLING()
 * @method static PropertyStatusEnum SOLD()
 * @method static PropertyStatusEnum RENTING()
 * @method static PropertyStatusEnum RENTED()
 * @method static PropertyStatusEnum BUILDING()
 */
class PropertyStatusEnum extends Enum
{
    public const NOT_AVAILABLE = 'not_available';
    public const PRE_SALE = 'pre_sale';
    public const SELLING = 'selling';
    public const SOLD = 'sold';
    public const RENTING = 'renting';
    public const RENTED = 'rented';
    public const BUILDING = 'building';

    /**
     * @var string
     */
    public static $langPath = 'plugins/real-estate::property.statuses';

    /**
     * @return string
     */
    public function toHtml()
    {
        switch ($this->value) {
            case self::NOT_AVAILABLE:
                return Html::tag('span', self::NOT_AVAILABLE()->label(), ['class' => 'label-default status-label'])
                    ->toHtml();
            case self::PRE_SALE:
                return Html::tag('span', self::PRE_SALE()->label(), ['class' => 'label-success status-label'])
                    ->toHtml();
            case self::SELLING:
                return Html::tag('span', self::SELLING()->label(), ['class' => 'label-success status-label'])
                    ->toHtml();
            case self::SOLD:
                return Html::tag('span', self::SOLD()->label(), ['class' => 'label-danger status-label'])
                    ->toHtml();
            case self::RENTING:
                return Html::tag('span', self::RENTING()->label(), ['class' => 'label-success status-label'])
                    ->toHtml();
            case self::RENTED:
                return Html::tag('span', self::RENTED()->label(), ['class' => 'label-danger status-label'])
                    ->toHtml();
            case self::BUILDING:
                return Html::tag('span', self::BUILDING()->label(), ['class' => 'label-info status-label'])
                    ->toHtml();
            default:
                return null;
        }
    }
}
