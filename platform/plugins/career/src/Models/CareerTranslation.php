<?php

namespace Botble\Career\Models;

use Botble\Base\Models\BaseModel;

class CareerTranslation extends BaseModel
{

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'careers_translations';

    /**
     * @var array
     */
    protected $fillable = [
        'lang_code',
        'careers_id',
        'name',
        'location',
        'salary',
        'description',
    ];

    /**
     * @var bool
     */
    public $timestamps = false;
}
