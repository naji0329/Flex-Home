<?php

return [
    'type'           => 'v2',

    // Secret key and Site key get on https://www.google.com/recaptcha
    'secret'         => env('CAPTCHA_SECRET', 'no-captcha-secret'),
    'site_key'       => env('CAPTCHA_SITE_KEY', 'no-captcha-site-key'),
    'hide_badge'     => env('CAPTCHA_HIDE_BADGE', false),

    /**
     * @var string|null Default ``null``.
     * Custom with function name (example customRequestCaptcha) or class@method (example \App\CustomRequestCaptcha@custom).
     * Function must be return instance, read more in repo ``https://github.com/thinhbuzz/laravel-google-captcha-examples``
     */
    'request_method' => null,
    'options'        => [
        'multiple' => false,
        'lang'     => app()->getLocale(),
    ],
    'attributes'     => [
        'theme' => 'light',
    ],
];
