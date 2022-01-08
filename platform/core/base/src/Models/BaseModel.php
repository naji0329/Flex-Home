<?php

namespace Botble\Base\Models;

use Eloquent;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Illuminate\Support\Str;
use MacroableModels;
use MetaBox as MetaBoxSupport;

class BaseModel extends Eloquent
{
    /**
     * @param string $key
     * @return mixed
     */
    public function __get($key)
    {
        if (class_exists('MacroableModels')) {
            $method = 'get' . Str::studly($key) . 'Attribute';
            if (MacroableModels::modelHasMacro(get_class($this), $method)) {
                return call_user_func([$this, $method]);
            }
        }

        return parent::__get($key);
    }

    /**
     * @return MorphMany
     */
    public function metadata()
    {
        return $this->morphMany(MetaBox::class, 'reference')
            ->select([
                'reference_id',
                'reference_type',
                'meta_key',
                'meta_value',
            ]);
    }

    /**
     * @param string $key
     * @param bool $single
     * @return string|array
     */
    public function getMetaData(string $key, bool $single = false)
    {
        $field = $this->metadata
            ->where('meta_key', apply_filters('stored_meta_box_key', $key, $this))
            ->first();

        if (!$field) {
            $field = $this->metadata->where('meta_key', $key)->first();
        }

        if (!$field) {
            return $single ? '' : [];
        }

        return MetaBoxSupport::getMetaData($field, $key, $single);
    }

    /**
     * Create a new Eloquent query builder for the model.
     *
     * @param \Illuminate\Database\Query\Builder $query
     * @return \Illuminate\Database\Eloquent\Builder|static
     */
    public function newEloquentBuilder($query)
    {
        return new BaseQueryBuilder($query);
    }
}
