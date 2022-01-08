<?php

namespace Botble\Translation\Models;

use Botble\Base\Models\BaseModel;
use Illuminate\Database\Query\Builder;
use Illuminate\Support\Facades\DB;

class Translation extends BaseModel
{
    const STATUS_SAVED = 0;
    const STATUS_CHANGED = 1;

    /**
     * @var string
     */
    protected $table = 'translations';

    /**
     * @var array
     */
    protected $guarded = [
        'id',
        'created_at',
        'updated_at',
    ];

    /**
     * @param Builder $query
     * @param $group
     * @return mixed
     */
    public function scopeOfTranslatedGroup($query, $group)
    {
        return $query->where('group', $group)->whereNotNull('value');
    }

    /**
     * @param Builder $query
     * @param $ordered
     * @return mixed
     */
    public function scopeOrderByGroupKeys($query, $ordered)
    {
        if ($ordered) {
            $query->orderBy('group')->orderBy('key');
        }

        return $query;
    }

    /**
     * @param Builder $query
     * @return mixed
     */
    public function scopeSelectDistinctGroup($query)
    {
        switch (config('database.default')) {
            case 'mysql':
                $select = 'DISTINCT `group`';
                break;
            default:
                $select = 'DISTINCT "group"';
                break;
        }

        return $query->select(DB::raw($select));
    }
}
