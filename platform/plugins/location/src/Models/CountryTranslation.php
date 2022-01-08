<?php

namespace Botble\Location\Models;

use Botble\Base\Models\BaseModel;

class CountryTranslation extends BaseModel
{

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'countries_translations';

    /**
     * @var array
     */
    protected $fillable = [
        'lang_code',
        'countries_id',
        'name',
        'nationality',
    ];

    /**
     * @var bool
     */
    public $timestamps = false;
}
