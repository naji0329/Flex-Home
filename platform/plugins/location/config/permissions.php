<?php

return [
    [
        'name' => 'Location',
        'flag' => 'plugin.location',
    ],
    [
        'name'        => 'Countries',
        'flag'        => 'country.index',
        'parent_flag' => 'plugin.location',
    ],
    [
        'name'        => 'Create',
        'flag'        => 'country.create',
        'parent_flag' => 'country.index',
    ],
    [
        'name'        => 'Edit',
        'flag'        => 'country.edit',
        'parent_flag' => 'country.index',
    ],
    [
        'name'        => 'Delete',
        'flag'        => 'country.destroy',
        'parent_flag' => 'country.index',
    ],

    [
        'name'        => 'States',
        'flag'        => 'state.index',
        'parent_flag' => 'plugin.location',
    ],
    [
        'name'        => 'Create',
        'flag'        => 'state.create',
        'parent_flag' => 'state.index',
    ],
    [
        'name'        => 'Edit',
        'flag'        => 'state.edit',
        'parent_flag' => 'state.index',
    ],
    [
        'name'        => 'Delete',
        'flag'        => 'state.destroy',
        'parent_flag' => 'state.index',
    ],

    [
        'name'        => 'Cities',
        'flag'        => 'city.index',
        'parent_flag' => 'plugin.location',
    ],
    [
        'name'        => 'Create',
        'flag'        => 'city.create',
        'parent_flag' => 'city.index',
    ],
    [
        'name'        => 'Edit',
        'flag'        => 'city.edit',
        'parent_flag' => 'city.index',
    ],
    [
        'name'        => 'Delete',
        'flag'        => 'city.destroy',
        'parent_flag' => 'city.index',
    ],
];
