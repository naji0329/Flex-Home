<?php

namespace Botble\Language\Models;

use Botble\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Language as LanguageFacade;

class LanguageMeta extends BaseModel
{

    /**
     * @var string
     */
    protected $primaryKey = 'lang_meta_id';

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'language_meta';

    /**
     * @var bool
     */
    public $timestamps = false;

    /**
     * @var array
     */
    protected $fillable = [
        'lang_meta_code',
        'lang_meta_origin',
        'reference_id',
        'reference_type',
    ];

    /**
     * @return BelongsTo
     */
    public function reference()
    {
        return $this->morphTo();
    }

    /**
     * @param BaseModel $model
     * @param string|null $locale
     * @param string|null $originValue
     */
    public static function saveMetaData(BaseModel $model, ?string $locale = null, ?string $originValue = null)
    {
        if (!$locale) {
            $locale = LanguageFacade::getDefaultLocaleCode();
        }

        if (!$originValue) {
            $originValue = md5($model->id . get_class($model) . time());
        }

        LanguageMeta::insert([
            'reference_id'     => $model->id,
            'reference_type'   => get_class($model),
            'lang_meta_code'   => $locale,
            'lang_meta_origin' => $originValue,
        ]);
    }
}
