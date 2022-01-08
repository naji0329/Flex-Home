<?php

namespace Botble\Menu\Models;

use Botble\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Request;

class MenuNode extends BaseModel
{

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'menu_nodes';

    /**
     * @var array
     */
    protected $fillable = [
        'menu_id',
        'parent_id',
        'reference_id',
        'reference_type',
        'url',
        'icon_font',
        'title',
        'css_class',
        'target',
        'has_child',
    ];

    /**
     * @return BelongsTo
     */
    public function parent()
    {
        return $this->belongsTo(MenuNode::class, 'parent_id');
    }

    /**
     * @return HasMany
     */
    public function child()
    {
        return $this->hasMany(MenuNode::class, 'parent_id')->orderBy('position');
    }

    /**
     * @return BelongsTo
     */
    public function reference()
    {
        return $this->morphTo()->with(['slugable']);
    }

    /**
     * @param string $value
     * @return string
     */
    public function getUrlAttribute($value)
    {
        if ($value) {
            return apply_filters(MENU_FILTER_NODE_URL, $value);
        }

        if (!$this->reference_type) {
            return $value ? (string)$value : '/';
        }

        if (!$this->reference) {
            return '/';
        }

        return (string)$this->reference->url;
    }

    /**
     * @param string $value
     */
    public function setUrlAttribute($value)
    {
        $this->attributes['url'] = $value;
    }

    /**
     * @param string $value
     * @return string
     */
    public function getTitleAttribute($value)
    {
        if ($value) {
            return $value;
        }

        if (!$this->reference_type || !$this->reference) {
            return $value;
        }

        return $this->reference->name;
    }

    /**
     * @return bool
     */
    public function getActiveAttribute()
    {
        return rtrim(url($this->url), '/') == rtrim(Request::url(), '/');
    }

    /**
     * @return mixed
     * @deprecated
     */
    public function hasChild()
    {
        return $this->has_child;
    }

    /**
     * @return $this
     * @deprecated
     */
    public function getRelated()
    {
        return $this;
    }

    /**
     * @return mixed
     * @deprecated
     */
    public function getNameAttribute()
    {
        return $this->title;
    }
}
