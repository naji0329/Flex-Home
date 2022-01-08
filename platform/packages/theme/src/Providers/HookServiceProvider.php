<?php

namespace Botble\Theme\Providers;

use Botble\Dashboard\Supports\DashboardWidgetInstance;
use Botble\Theme\Supports\Vimeo;
use Botble\Theme\Supports\Youtube;
use Html;
use Illuminate\Support\Collection;
use Illuminate\Support\ServiceProvider;
use Throwable;

class HookServiceProvider extends ServiceProvider
{
    public function boot()
    {
        add_filter(DASHBOARD_FILTER_ADMIN_LIST, [$this, 'addStatsWidgets'], 4, 2);

        add_filter(BASE_FILTER_AFTER_SETTING_CONTENT, [$this, 'addSetting'], 39);

        theme_option()
            ->setArgs(['debug' => config('app.debug')])
            ->setSection([
                'title'      => trans('packages/theme::theme.theme_option_general'),
                'desc'       => trans('packages/theme::theme.theme_option_general_description'),
                'priority'   => 0,
                'id'         => 'opt-text-subsection-general',
                'subsection' => true,
                'icon'       => 'fa fa-home',
                'fields'     => [
                    [
                        'id'         => 'site_title',
                        'type'       => 'text',
                        'label'      => trans('core/setting::setting.general.site_title'),
                        'attributes' => [
                            'name'    => 'site_title',
                            'value'   => null,
                            'options' => [
                                'class'        => 'form-control',
                                'placeholder'  => trans('core/setting::setting.general.site_title'),
                                'data-counter' => 255,
                            ],
                        ],
                    ],
                    [
                        'id'         => 'show_site_name',
                        'section_id' => 'opt-text-subsection-general',
                        'type'       => 'customSelect',
                        'label'      => trans('core/setting::setting.general.show_site_name'),
                        'attributes' => [
                            'name'    => 'show_site_name',
                            'list'    => [
                                '0' => 'No',
                                '1' => 'Yes',
                            ],
                            'value'   => '0',
                            'options' => [
                                'class' => 'form-control',
                            ],
                        ],
                    ],
                    [
                        'id'         => 'seo_title',
                        'type'       => 'text',
                        'label'      => trans('core/setting::setting.general.seo_title'),
                        'attributes' => [
                            'name'    => 'seo_title',
                            'value'   => null,
                            'options' => [
                                'class'        => 'form-control',
                                'placeholder'  => trans('core/setting::setting.general.seo_title'),
                                'data-counter' => 120,
                            ],
                        ],
                    ],
                    [
                        'id'         => 'seo_description',
                        'type'       => 'textarea',
                        'label'      => trans('core/setting::setting.general.seo_description'),
                        'attributes' => [
                            'name'    => 'seo_description',
                            'value'   => null,
                            'options' => [
                                'class' => 'form-control',
                                'rows'  => 4,
                            ],
                        ],
                    ],
                    [
                        'id'         => 'seo_og_image',
                        'type'       => 'mediaImage',
                        'label'      => trans('packages/theme::theme.theme_option_seo_open_graph_image'),
                        'attributes' => [
                            'name'  => 'seo_og_image',
                            'value' => null,
                        ],
                    ],
                ],
            ])
            ->setSection([
                'title'      => trans('packages/theme::theme.theme_option_logo'),
                'desc'       => trans('packages/theme::theme.theme_option_logo'),
                'priority'   => 0,
                'id'         => 'opt-text-subsection-logo',
                'subsection' => true,
                'icon'       => 'fa fa-image',
                'fields'     => [
                    [
                        'id'         => 'favicon',
                        'type'       => 'mediaImage',
                        'label'      => trans('packages/theme::theme.theme_option_favicon'),
                        'attributes' => [
                            'name'  => 'favicon',
                            'value' => null,
                        ],
                    ],
                    [
                        'id'         => 'logo',
                        'type'       => 'mediaImage',
                        'label'      => trans('packages/theme::theme.theme_option_logo'),
                        'attributes' => [
                            'name'  => 'logo',
                            'value' => null,
                        ],
                    ],
                ],
            ]);

        add_shortcode('media', null, null, function ($shortcode) {
            $url = rtrim($shortcode->url, '/');

            if (!$url) {
                return null;
            }

            $iframe = null;

            if (Youtube::isYoutubeURL($url)) {
                $iframe = Html::tag('iframe', '', [
                    'class'           => 'embed-responsive-item',
                    'allowfullscreen' => true,
                    'frameborder'     => 0,
                    'height'          => 315,
                    'width'           => 420,
                    'src'             => Youtube::getYoutubeVideoEmbedURL($url),
                ])->toHtml();
            }

            if (Vimeo::isVimeoURL($url)) {
                $videoId = Vimeo::getVimeoID($url);
                if ($videoId) {
                    $iframe = Html::tag('iframe', '', [
                        'class'           => 'embed-responsive-item',
                        'height'          => 315,
                        'width'           => 420,
                        'allow'           => 'autoplay; fullscreen; picture-in-picture',
                        'src'             => 'https://player.vimeo.com/video/' . $videoId,
                    ])->toHtml();
                }
            }

            if ($iframe) {
                return Html::tag('div', $iframe, ['class' => 'embed-responsive embed-responsive-16by9 mb30'])
                    ->toHtml();
            }

            return null;
        });
    }

    /**
     * @param array $widgets
     * @param Collection $widgetSettings
     * @return array
     * @throws Throwable
     */
    public function addStatsWidgets($widgets, $widgetSettings)
    {
        $themes = count(scan_folder(theme_path()));

        return (new DashboardWidgetInstance)
            ->setType('stats')
            ->setPermission('theme.index')
            ->setTitle(trans('packages/theme::theme.theme'))
            ->setKey('widget_total_themes')
            ->setIcon('fa fa-paint-brush')
            ->setColor('#e7505a')
            ->setStatsTotal($themes)
            ->setRoute(route('theme.index'))
            ->init($widgets, $widgetSettings);
    }

    /**
     * @param null $data
     * @return string
     * @throws Throwable
     */
    public function addSetting($data = null)
    {
        return $data . view('packages/theme::setting')->render();
    }
}
