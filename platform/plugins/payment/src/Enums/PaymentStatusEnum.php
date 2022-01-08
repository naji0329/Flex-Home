<?php

namespace Botble\Payment\Enums;

use Botble\Base\Supports\Enum;
use Html;

/**
 * @method static PaymentStatusEnum PENDING()
 * @method static PaymentStatusEnum COMPLETED()
 * @method static PaymentStatusEnum REFUNDING()
 * @method static PaymentStatusEnum REFUNDED()
 * @method static PaymentStatusEnum FRAUD()
 * @method static PaymentStatusEnum FAILED()
 */
class PaymentStatusEnum extends Enum
{
    public const PENDING = 'pending';
    public const COMPLETED = 'completed';
    public const REFUNDING = 'refunding';
    public const REFUNDED = 'refunded';
    public const FRAUD = 'fraud';
    public const FAILED = 'failed';

    /**
     * @var string
     */
    public static $langPath = 'plugins/payment::payment.statuses';

    /**
     * @return string
     */
    public function toHtml()
    {
        switch ($this->value) {
            case self::PENDING:
                return Html::tag('span', self::PENDING()->label(), ['class' => 'label-warning status-label'])
                    ->toHtml();
            case self::COMPLETED:
                return Html::tag('span', self::COMPLETED()->label(), ['class' => 'label-success status-label'])
                    ->toHtml();
            case self::REFUNDING:
                return Html::tag('span', self::REFUNDING()->label(), ['class' => 'label-warning status-label'])
                    ->toHtml();
            case self::REFUNDED:
                return Html::tag('span', self::REFUNDED()->label(), ['class' => 'label-info status-label'])
                    ->toHtml();
            case self::FRAUD:
                return Html::tag('span', self::FRAUD()->label(), ['class' => 'label-danger status-label'])
                    ->toHtml();
            case self::FAILED:
                return Html::tag('span', self::FAILED()->label(), ['class' => 'label-danger status-label'])
                    ->toHtml();
            default:
                return parent::toHtml();
        }
    }
}
