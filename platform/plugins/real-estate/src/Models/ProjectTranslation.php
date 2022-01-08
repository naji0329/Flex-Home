<?php

namespace Botble\RealEstate\Models;

use Botble\Base\Models\BaseModel;

class ProjectTranslation extends BaseModel
{

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 're_projects_translations';

    /**
     * @var array
     */
    protected $fillable = [
        'lang_code',
        're_projects_id',
        'name',
        'description',
        'content',
        'location',
    ];

    /**
     * @var bool
     */
    public $timestamps = false;
}
