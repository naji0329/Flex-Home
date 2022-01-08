<?php

return [
    [
        'name'        => 'Plugins',
        'flag'        => 'plugins.index',
        'parent_flag' => 'core.system',
    ],
    [
        'name'        => 'Activate/Deactivate',
        'flag'        => 'plugins.edit',
        'parent_flag' => 'plugins.index',
    ],
    [
        'name'        => 'Remove',
        'flag'        => 'plugins.remove',
        'parent_flag' => 'plugins.index',
    ],
];
