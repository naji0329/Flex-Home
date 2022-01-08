<?php

namespace Database\Seeders;

use Botble\Language\Models\LanguageMeta;
use Botble\RealEstate\Models\Property;
use Botble\RealEstate\Models\PropertyTranslation;
use Illuminate\Database\Seeder;
use Language;

class PropertySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $items = LanguageMeta::where('reference_type', Property::class)
            ->where('lang_meta_code', '!=', Language::getDefaultLocaleCode())
            ->get();

        foreach ($items as $item) {

            $originalItem = Property::find($item->reference_id);

            if (!$originalItem) {
                continue;
            }

            $originalId = LanguageMeta::where('lang_meta_origin', $item->lang_meta_origin)
                ->where('lang_meta_code', Language::getDefaultLocaleCode())
                ->value('reference_id');

            if (!$originalId) {
                continue;
            }

            PropertyTranslation::insert([
                're_properties_id' => $originalId,
                'lang_code'        => $item->lang_meta_code,
                'name'             => $originalItem->name,
                'description'      => $originalItem->description,
                'content'          => $originalItem->content,
                'location'         => $originalItem->location,
            ]);

            $originalItem->delete();

            $item->delete();
        }
    }
}
