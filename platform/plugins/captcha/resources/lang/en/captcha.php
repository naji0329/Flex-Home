<?php

return [
    'settings'        => [
        'title'            => 'Captcha',
        'description'      => 'Settings for Google Captcha',
        'captcha_site_key' => 'Captcha Site Key',
        'captcha_secret'   => 'Captcha Secret',
        'enable_captcha'   => 'Enable Captcha?',
        'helper'           => 'Go here to get credentials https://www.google.com/recaptcha/admin#list.',
        'hide_badge'       => 'Hide recaptcha badge (for v3)',
        'type'             => 'Type',
        'v2_description'   => 'V2 (Verify requests with a challenge)',
        'v3_description'   => 'V3 (Verify requests with a score)',
    ],
    'failed_validate' => 'Failed to validate the captcha.',
];
