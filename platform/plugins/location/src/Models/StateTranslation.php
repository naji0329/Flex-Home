<?php

namespace Botble\Location\Models;

use Botble\Base\Models\BaseModel;

class StateTranslation extends BaseModel
{

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'states_translations';

    /**
     * @var array
     */
    protected $fillable = [
        'lang_code',
        'states_id',
        'name',
        'abbreviation',
    ];

    /**
     * @var bool
     */
    public $timestamps = false;
}
