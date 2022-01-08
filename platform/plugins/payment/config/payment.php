<?php

return [
    'currency'                 => env('PAYMENT_DEFAULT_CURRENCY', 'USD'),
    'return_url_after_payment' => env('PAYMENT_RETURN_URL_AFTER_PAYMENT', '/'),
];
