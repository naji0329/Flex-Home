<?php

return [
    [
        'name' => 'Payments',
        'flag' => 'payment.index',
    ],
    [
        'name'        => 'Settings',
        'flag'        => 'payments.settings',
        'parent_flag' => 'payment.index',
    ],
    [
        'name'        => 'Delete',
        'flag'        => 'payment.destroy',
        'parent_flag' => 'payment.index',
    ],

];
