<?php

namespace Botble\LanguageAdvanced\Models;

use Botble\Base\Models\BaseModel;

class PageTranslation extends BaseModel
{

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'pages_translations';

    /**
     * @var array
     */
    protected $fillable = [
        'lang_code',
        'pages_id',
        'name',
        'description',
        'content',
    ];

    /**
     * @var bool
     */
    public $timestamps = false;
}
