<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Language\Models\LanguageMeta;
use Botble\RealEstate\Models\Feature;
use Botble\RealEstate\Models\FeatureTranslation;
use Botble\RealEstate\Models\Property;

class FeatureSeeder extends BaseSeeder
{
    public function run()
    {
        Feature::truncate();
        FeatureTranslation::truncate();
        LanguageMeta::where('reference_type', Feature::class)->delete();

        $features = [
            [
                'name' => 'Wifi',
            ],
            [
                'name' => 'Parking',
            ],
            [
                'name' => 'Swimming pool',
            ],
            [
                'name' => 'Balcony',
            ],
            [
                'name' => 'Garden',
            ],
            [
                'name' => 'Security',
            ],
            [
                'name' => 'Fitness center',
            ],
            [
                'name' => 'Air Conditioning',
            ],
            [
                'name' => 'Central Heating  ',
            ],
            [
                'name' => 'Laundry Room',
            ],
            [
                'name' => 'Pets Allow',
            ],
            [
                'name' => 'Spa & Massage',
            ],
        ];

        foreach ($features as $facility) {
            Feature::create($facility);
        }

        foreach (Property::get() as $property) {
            $property->features()->detach();
            $property->features()->attach([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]);
        }

        $translations = [
            [
                'name' => 'Wifi',
            ],
            [
                'name' => 'Bãi đậu xe',
            ],
            [
                'name' => 'Hồ bơi',
            ],
            [
                'name' => 'Ban công',
            ],
            [
                'name' => 'Sân vườn',
            ],
            [
                'name' => 'An ninh',
            ],
            [
                'name' => 'Trung tâm thể dục',
            ],
            [
                'name' => 'Điều hoà nhiệt độ',
            ],
            [
                'name' => 'Hệ thống sưởi trung tâm',
            ],
            [
                'name' => 'Phòng giặt ủi',
            ],
            [
                'name' => 'Cho phép nuôi thú',
            ],
            [
                'name' => 'Spa & Massage',
            ],
        ];

        foreach ($translations as $index => $item) {
            $item['lang_code'] = 'vi';
            $item['re_features_id'] = $index + 9;

            FeatureTranslation::insert($item);
        }
    }
}
