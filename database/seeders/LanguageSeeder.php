<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Language\Models\Language as LanguageModel;
use Botble\Setting\Models\Setting as SettingModel;

class LanguageSeeder extends BaseSeeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        LanguageModel::truncate();

        $languages = [
            [
                'lang_name'       => 'English',
                'lang_locale'     => 'en',
                'lang_is_default' => true,
                'lang_code'       => 'en_US',
                'lang_is_rtl'     => false,
                'lang_flag'       => 'us',
                'lang_order'      => 0,
            ],
            [
                'lang_name'       => 'Tiếng Việt',
                'lang_locale'     => 'vi',
                'lang_is_default' => false,
                'lang_code'       => 'vi',
                'lang_is_rtl'     => false,
                'lang_flag'       => 'vn',
                'lang_order'      => 0,
            ],
        ];

        foreach ($languages as $item) {
            LanguageModel::create($item);
        }

        SettingModel::whereIn('key', [
            'language_hide_default',
            'language_switcher_display',
            'language_display',
            'language_hide_languages',
        ])
            ->delete();

        SettingModel::insertOrIgnore([
            [
                'key'   => 'language_hide_default',
                'value' => '1',
            ],
            [
                'key'   => 'language_switcher_display',
                'value' => 'dropdown',
            ],
            [
                'key'   => 'language_display',
                'value' => 'all',
            ],
            [
                'key'   => 'language_hide_languages',
                'value' => '[]',
            ],
        ]);
    }
}
