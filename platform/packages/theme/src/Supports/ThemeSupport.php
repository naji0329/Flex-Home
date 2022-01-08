<?php

namespace Botble\Theme\Supports;

use Html;
use Illuminate\Support\Str;

class ThemeSupport
{
    /**
     * @param null|string $viewPath
     * @return void
     */
    public static function registerYoutubeShortcode($viewPath = null)
    {
        add_shortcode('youtube-video', __('Youtube video'), __('Add youtube video'),
            function ($shortcode) use ($viewPath) {
                $url = Youtube::getYoutubeVideoEmbedURL($shortcode->content);

                return view(($viewPath ?: 'packages/theme::shortcodes') . '.youtube', compact('url'))->render();
            });

        shortcode()->setAdminConfig('youtube-video', function ($attributes, $content) use ($viewPath) {
            return view(($viewPath ?: 'packages/theme::shortcodes') . '.youtube-admin-config', compact('attributes', 'content'))->render();
        });
    }

    /**
     * @param null|string $viewPath
     * @return void
     */
    public static function registerGoogleMapsShortcode($viewPath = null)
    {
        add_shortcode('google-map', __('Google map'), __('Add Google map iframe'), function ($shortcode) use ($viewPath) {
            return view(($viewPath ?: 'packages/theme::shortcodes') . '.google-map', ['address' => $shortcode->content])
                ->render();
        });

        shortcode()->setAdminConfig('google-map', function ($attributes, $content) use ($viewPath) {
            return view(($viewPath ?: 'packages/theme::shortcodes') . '.google-map-admin-config', compact('attributes', 'content'))->render();
        });
    }

    /**
     * @param string $location
     * @return string
     */
    public static function getCustomJS(string $location)
    {
        $js = setting('custom_' . $location . '_js');

        if (empty($js)) {
            return '';
        }

        if (!Str::contains($js, '<script') || !Str::contains($js, '</script>')) {
            $js = Html::tag('script', $js);
        }

        return $js;
    }
}
