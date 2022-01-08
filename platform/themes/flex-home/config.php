<?php

use Botble\Theme\Theme;

return [

    /*
    |--------------------------------------------------------------------------
    | Inherit from another theme
    |--------------------------------------------------------------------------
    |
    | Set up inherit from another if the file is not exists,
    | this is work with "layouts", "partials" and "views"
    |
    | [Notice] assets cannot inherit.
    |
    */

    'inherit' => null, //default

    /*
    |--------------------------------------------------------------------------
    | Listener from events
    |--------------------------------------------------------------------------
    |
    | You can hook a theme when event fired on activities
    | this is cool feature to set up a title, meta, default styles and scripts.
    |
    | [Notice] these events can be overridden by package config.
    |
    */

    'events' => [

        // Before event inherit from package config and the theme that call before,
        // you can use this event to set meta, breadcrumb template or anything
        // you want inheriting.
        'before' => function($theme)
        {
            // You can remove this line anytime.
        },

        // Listen on event before render a theme,
        // this event should call to assign some assets,
        // breadcrumb template.
        'beforeRenderTheme' => function(Theme $theme)
        {
            $version = '2.31.4';

            // You may use this event to set up your assets.
            $theme->asset()->usePath()->add('bootstrap-css', 'libraries/bootstrap/bootstrap.min.v4.css');
            $theme->asset()->usePath()->add('fontawesome-css', 'libraries/fontawesome/css/fontawesome.min.css');
            $theme->asset()->usePath()->add('owl-carousel-css', 'libraries/owl-carousel/owl.carousel.min.css');
            $theme->asset()->usePath()->add('owl-carousel-theme-css', 'libraries/owl-carousel/owl.theme.default.css');
            $theme->asset()->usePath()->add('style-css', 'css/style.css', [], [], $version);

            if (BaseHelper::siteLanguageDirection() == 'rtl') {
                $theme->asset()->usePath()->add('rtl-style', 'css/rtl-style.css', [], [], $version);
            }

            $theme->asset()->container('header')->usePath()->add('jquery', 'libraries/jquery.min.js');
            $theme->asset()->container('header')->usePath()->add('popper-js', 'libraries/bootstrap/popper.min.js');
            $theme->asset()->container('header')->usePath()->add('bootstrap-js', 'libraries/bootstrap/bootstrap.min.js');
            $theme->asset()->container('header')->usePath()->add('owl-carousel-js', 'libraries/owl-carousel/owl.carousel.min.js');
            $theme->asset()->container('header')->usePath()->add('equal-height-js', 'libraries/jquery.matchHeight-min.js');
            $theme->asset()->container('footer')->usePath()->add('waypoints-js', 'libraries/jquery.waypoints.min.js');

            $theme->asset()->container('footer')->usePath()->add('app-js', 'js/app.js', [], [], $version);
            $theme->asset()->container('footer')->usePath()->add('components-js', 'js/components.js', [], [], $version);
            $theme->asset()->container('footer')->usePath()->add('wishlist', 'js/wishlist.js', [], [], $version);

            if (function_exists('shortcode')) {
                $theme->composer([
                    'page',
                    'post',
                    'career.career',
                    'real-estate.project',
                    'real-estate.property',
                ], function(\Botble\Shortcode\View\View $view) {
                    $view->withShortcodes();
                });
            }
        },

        // Listen on event before render a layout,
        // this should call to assign style, script for a layout.
        'beforeRenderLayout' => [

            'default' => function($theme)
            {
                // $theme->asset()->usePath()->add('ipad', 'css/layouts/ipad.css');
            }
        ]
    ]
];
