<?php

return [

    /*
     * The view id of which you want to display data.
     */
    'view_id'                   => env('ANALYTICS_VIEW_ID'),

    /*
     * The amount of minutes the Google API responses will be cached.
     * If you set this to zero, the responses won't be cached at all.
     */
    'cache_lifetime_in_minutes' => env('ANALYTICS_CACHE_TIME', 60 * 24),

    /*
     * Here you may configure the "store" that the underlying Google_Client will
     * use to store it's data.  You may also add extra parameters that will
     * be passed on setCacheConfig (see docs for google-api-php-client).
     *
     * Optional parameters: "lifetime", "prefix"
     */
    'cache'                     => [
        'store' => 'file',
    ],
    'enabled_dashboard_widgets' => env('ANALYTICS_ENABLE_DASHBOARD_WIDGETS', true),
];
