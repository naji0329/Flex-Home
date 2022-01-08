<?php

namespace Database\Seeders;

use Botble\Career\Models\Career;
use Botble\Career\Models\CareerTranslation;
use Botble\Language\Models\LanguageMeta;
use Illuminate\Database\Seeder;
use Language;

class CareerSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $items = LanguageMeta::where('reference_type', Career::class)
            ->where('lang_meta_code', '!=', Language::getDefaultLocaleCode())
            ->get();

        foreach ($items as $item) {

            $originalItem = Career::find($item->reference_id);

            if (!$originalItem) {
                continue;
            }

            $originalId = LanguageMeta::where('lang_meta_origin', $item->lang_meta_origin)
                ->where('lang_meta_code', Language::getDefaultLocaleCode())
                ->value('reference_id');

            if (!$originalId) {
                continue;
            }

            CareerTranslation::insert([
                'careers_id'  => $originalId,
                'lang_code'   => $item->lang_meta_code,
                'name'        => $originalItem->name,
                'location'    => $originalItem->location,
                'salary'      => $originalItem->salary,
                'description' => $originalItem->description,
            ]);

            $originalItem->delete();

            $item->delete();
        }
    }
}
