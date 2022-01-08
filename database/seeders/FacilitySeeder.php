<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Language\Models\LanguageMeta;
use Botble\RealEstate\Models\Facility;
use Botble\RealEstate\Models\FacilityTranslation;
use Botble\RealEstate\Models\Property;

class FacilitySeeder extends BaseSeeder
{
    public function run()
    {
        Facility::truncate();
        FacilityTranslation::truncate();
        LanguageMeta::where('reference_type', Facility::class)->delete();

        $facilities = [
            [
                'name' => 'Hospital',
                'icon' => 'far fa-hospital',
            ],
            [
                'name' => 'Super Market',
                'icon' => 'fas fa-cart-plus',
            ],
            [
                'name' => 'School',
                'icon' => 'fas fa-school',
            ],
            [
                'name' => 'Entertainment',
                'icon' => 'fas fa-hotel',
            ],
            [
                'name' => 'Pharmacy',
                'icon' => 'fas fa-prescription-bottle-alt',
            ],
            [
                'name' => 'Airport',
                'icon' => 'fas fa-plane-departure',
            ],
            [
                'name' => 'Railways',
                'icon' => 'fas fa-subway',
            ],
            [
                'name' => 'Bus Stop',
                'icon' => 'fas fa-bus',
            ],
            [
                'name' => 'Beach',
                'icon' => 'fas fa-umbrella-beach',
            ],
            [
                'name' => 'Mall',
                'icon' => 'fas fa-cart-plus',
            ],
            [
                'name' => 'Bank',
                'icon' => 'fas fa-university',
            ],
        ];

        foreach ($facilities as $facility) {
            Facility::create($facility);
        }

        foreach (Property::get() as $property) {
            $property->facilities()->detach();
            for ($i = 1; $i < 12; $i++) {
                $property->facilities()->attach($i, ['distance' => rand(1, 20) . 'km']);
            }
        }

        $translations = [
            [
                'name' => 'Bệnh viện',
            ],
            [
                'name' => 'Siêu thị',
            ],
            [
                'name' => 'Trường học',
            ],
            [
                'name' => 'Trung tâm giải trí',
            ],
            [
                'name' => 'Hiệu thuốc',
            ],
            [
                'name' => 'Sân bay',
            ],
            [
                'name' => 'Tàu điện ngầm',
            ],
            [
                'name' => 'Trạm xe buýt',
            ],
            [
                'name' => 'Bãi biển',
            ],
            [
                'name' => 'Trung tâm mua sắm',
            ],
            [
                'name' => 'Ngân hàng',
            ],
        ];

        foreach ($translations as $index => $item) {
            $item['lang_code'] = 'vi';
            $item['re_facilities_id'] = $index + 9;

            FacilityTranslation::insert($item);
        }
    }
}
