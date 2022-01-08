<?php

return [
    'driver'                     => env('CMS_SETTING_STORE_DRIVER', 'database'),
    'cache'                      => [
        'enabled' => env('CMS_SETTING_STORE_CACHE', false),
    ],
    'enable_email_smtp_settings' => env('CMS_ENABLE_EMAIL_SMTP_SETTINGS', true),
];
