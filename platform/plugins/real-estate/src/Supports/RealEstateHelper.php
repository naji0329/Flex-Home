<?php

namespace Botble\RealEstate\Supports;

use Botble\Base\Enums\BaseStatusEnum;

class RealEstateHelper
{
    /**
     * @return bool
     */
    public function isRegisterEnabled(): bool
    {
        return setting('real_estate_enabled_register', '1') == '1';
    }

    /**
     * @return int
     */
    public function propertyExpiredDays()
    {
        $days = (int)setting('property_expired_after_days');

        if ($days > 0) {
            return $days;
        }

        return config('plugins.real-estate.real-estate.property_expired_after_x_days');
    }

    /**
     * @return array
     */
    public function getPropertyRelationsQuery(): array
    {
        return [
            'slugable:id,key,prefix,reference_id',
            'city:id,name,state_id',
            'city.state:id,name,country_id',
            'currency:id,is_default,exchange_rate,symbol,title,is_prefix_symbol',
            'categories' => function ($query) {
                return $query->where('status', BaseStatusEnum::PUBLISHED)
                    ->orderBy('created_at', 'DESC')
                    ->orderBy('is_default', 'DESC')
                    ->orderBy('order', 'ASC')
                    ->select('re_categories.id', 're_categories.name');
            },
        ];
    }

    /**
     * @return array
     */
    public function getProjectRelationsQuery(): array
    {
        return [
            'slugable:id,key,prefix,reference_id',
            'categories' => function ($query) {
                return $query->where('status', BaseStatusEnum::PUBLISHED)
                    ->orderBy('created_at', 'DESC')
                    ->orderBy('is_default', 'DESC')
                    ->orderBy('order', 'ASC')
                    ->select('re_categories.id', 're_categories.name');
            },
            'city:id,name,state_id',
            'city.state:id,name',
        ];
    }

    /**
     * @return bool
     */
    public function isEnabledCreditsSystem(): bool
    {
        return setting('real_estate_enable_credits_system', 1) == 1;
    }

    /**
     * @return string
     */
    public function getThousandSeparatorForInputMask(): string
    {
        $thousandSeparator = setting('real_estate_thousands_separator', ',');

        if ($thousandSeparator == 'space') {
            $thousandSeparator = ',';
        }

        return $thousandSeparator;
    }

    /**
     * @return string
     */
    public function getDecimalSeparatorForInputMask(): string
    {
        $decimalSeparator = setting('real_estate_decimal_separator', '.');

        if ($decimalSeparator == 'space') {
            $decimalSeparator = '.';
        }

        return $decimalSeparator;
    }
}
