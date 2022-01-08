<?php

namespace Botble\RealEstate\Enums;

use Botble\Base\Supports\Enum;
use Html;

/**
 * @method static ProjectStatusEnum NOT_AVAILABLE()
 * @method static ProjectStatusEnum PRE_SALE()
 * @method static ProjectStatusEnum SELLING()
 * @method static ProjectStatusEnum SOLD()
 * @method static ProjectStatusEnum BUILDING()
 */
class ProjectStatusEnum extends Enum
{
    public const NOT_AVAILABLE = 'not_available';
    public const PRE_SALE = 'pre_sale';
    public const SELLING = 'selling';
    public const SOLD = 'sold';
    public const BUILDING = 'building';

    /**
     * @var string
     */
    public static $langPath = 'plugins/real-estate::project.statuses';

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
                return Html::tag('span', self::PRE_SALE()->label(), ['class' => 'label-warning status-label'])
                    ->toHtml();
            case self::SELLING:
                return Html::tag('span', self::SELLING()->label(), ['class' => 'label-success status-label'])
                    ->toHtml();
            case self::SOLD:
                return Html::tag('span', self::SOLD()->label(), ['class' => 'label-danger status-label'])
                    ->toHtml();
            case self::BUILDING:
                return Html::tag('span', self::BUILDING()->label(), ['class' => 'label-info status-label'])
                    ->toHtml();
            default:
                return null;
        }
    }
}
