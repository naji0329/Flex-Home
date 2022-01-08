<?php

namespace Botble\Blog\Models;

use Botble\Base\Models\BaseModel;

class TagTranslation extends BaseModel
{

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'tags_translations';

    /**
     * @var array
     */
    protected $fillable = [
        'lang_code',
        'tags_id',
        'name',
        'description',
    ];

    /**
     * @var bool
     */
    public $timestamps = false;
}
