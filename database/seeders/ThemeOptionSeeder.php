<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Setting\Models\Setting as SettingModel;
use Theme;

class ThemeOptionSeeder extends BaseSeeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->uploadFiles('general');

        $theme = Theme::getThemeName();

        SettingModel::insertOrIgnore([
            [
                'key'   => 'admin_logo',
                'value' => 'logo/logo-white.png',
            ],
            [
                'key'   => 'admin_favicon',
                'value' => 'logo/favicon.png',
            ],
        ]);

        $data = [
            'en_US' => [
                [
                    'key'   => 'cookie_consent_message',
                    'value' => 'Your experience on this site will be improved by allowing cookies ',
                ],
                [
                    'key'   => 'cookie_consent_learn_more_url',
                    'value' => url('cookie-policy'),
                ],
                [
                    'key'   => 'cookie_consent_learn_more_text',
                    'value' => 'Cookie Policy',
                ],
                [
                    'key'   => 'homepage_id',
                    'value' => '1',
                ],
                [
                    'key'   => 'blog_page_id',
                    'value' => '2',
                ],
                [
                    'key'   => 'home_banner',
                    'value' => 'general/home-banner.jpg',
                ],
                [
                    'key'   => 'breadcrumb_background',
                    'value' => 'general/breadcrumb-background.jpg',
                ],
            ],

            'vi' => [
                [
                    'key'   => 'cookie_consent_message',
                    'value' => 'Trải nghiệm của bạn trên trang web này sẽ được cải thiện bằng cách cho phép cookie ',
                ],
                [
                    'key'   => 'cookie_consent_learn_more_url',
                    'value' => url('cookie-policy'),
                ],
                [
                    'key'   => 'cookie_consent_learn_more_text',
                    'value' => 'Cookie Policy',
                ],
                [
                    'key'   => 'home_banner',
                    'value' => 'general/home-banner.jpg',
                ],
                [
                    'key'   => 'breadcrumb_background',
                    'value' => 'general/breadcrumb-background.jpg',
                ],
            ],
        ];

        foreach ($data as $locale => $options) {
            foreach ($options as $item) {
                $item['key'] = 'theme-' . $theme . '-' . ($locale != 'en_US' ? $locale . '-' : '') . $item['key'];

                SettingModel::where('key', $item['key'])->delete();

                SettingModel::create($item);
            }
        }

        $socialLinks = [
            [
                [
                    'key'   => 'social-name',
                    'value' => 'Facebook',
                ],
                [
                    'key'   => 'social-icon',
                    'value' => 'fab fa-facebook-f',
                ],
                [
                    'key'   => 'social-url',
                    'value' => 'https://www.facebook.com/',
                ],
            ],
            [
                [
                    'key'   => 'social-name',
                    'value' => 'Twitter',
                ],
                [
                    'key'   => 'social-icon',
                    'value' => 'fab fa-twitter',
                ],
                [
                    'key'   => 'social-url',
                    'value' => 'https://www.twitter.com/',
                ],
            ],
            [
                [
                    'key'   => 'social-name',
                    'value' => 'Youtube',
                ],
                [
                    'key'   => 'social-icon',
                    'value' => 'fab fa-youtube',
                ],
                [
                    'key'   => 'social-url',
                    'value' => 'https://www.youtube.com/',
                ],
            ],
        ];

        SettingModel::insertOrIgnore([
            'key'   => 'theme-' . $theme . '-social_links',
            'value' => json_encode($socialLinks),
        ]);
    }
}
