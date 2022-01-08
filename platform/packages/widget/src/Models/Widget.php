<?php

namespace Botble\Widget\Models;

use Botble\Base\Models\BaseModel;

class Widget extends BaseModel
{

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'widgets';

    /**
     * @var array
     */
    protected $fillable = [
        'widget_id',
        'sidebar_id',
        'theme',
        'position',
        'data',
    ];

    /**
     * @var array
     */
    protected $casts = [
        'data' => 'json',
    ];

    /**
     * Set mutator for the "position" attribute.
     *
     * @param int $position
     * @return void
     */
    public function setPositionAttribute($position)
    {
        $this->attributes['position'] = $position >= 0 && $position < 127 ? $position : (int)substr($position, -1);
    }
}
