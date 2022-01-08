<?php

return [
    [
        'name' => 'Languages',
        'flag' => 'languages.index',
    ],
    [
        'name'        => 'Create',
        'flag'        => 'languages.create',
        'parent_flag' => 'languages.index',
    ],
    [
        'name'        => 'Edit',
        'flag'        => 'languages.edit',
        'parent_flag' => 'languages.index',
    ],
    [
        'name'        => 'Delete',
        'flag'        => 'languages.destroy',
        'parent_flag' => 'languages.index',
    ],
    [
        'name'        => 'Theme translations',
        'flag'        => 'languages.theme-translations',
        'parent_flag' => 'languages.index',
    ],
];
