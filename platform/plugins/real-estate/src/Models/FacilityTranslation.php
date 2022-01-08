<?php

namespace Botble\RealEstate\Models;

use Botble\Base\Models\BaseModel;

class FacilityTranslation extends BaseModel
{

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 're_facilities_translations';

    /**
     * @var array
     */
    protected $fillable = [
        'lang_code',
        're_facilities_id',
        'name',
    ];

    /**
     * @var bool
     */
    public $timestamps = false;
}
