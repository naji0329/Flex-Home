<?php

return [
    [
        'name' => 'Careers',
        'flag' => 'career.index',
    ],
    [
        'name'        => 'Create',
        'flag'        => 'career.create',
        'parent_flag' => 'career.index',
    ],
    [
        'name'        => 'Edit',
        'flag'        => 'career.edit',
        'parent_flag' => 'career.index',
    ],
    [
        'name'        => 'Delete',
        'flag'        => 'career.destroy',
        'parent_flag' => 'career.index',
    ],
];
