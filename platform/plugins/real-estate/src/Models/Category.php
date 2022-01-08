<?php

namespace Botble\RealEstate\Models;

use Botble\Base\Traits\EnumCastable;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Html;

class Category extends BaseModel
{
    use EnumCastable;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 're_categories';

    /**
     * @var array
     */
    protected $fillable = [
        'name',
        'description',
        'status',
        'order',
        'is_default',
        'parent_id',
    ];

    /**
     * @var array
     */
    protected $casts = [
        'status' => BaseStatusEnum::class,
    ];

    /**
     * @return BelongsToMany
     */
    public function properties(): BelongsToMany
    {
        return $this->belongsToMany(Property::class, 're_property_categories')->with('slugable');
    }

    /**
     * @return BelongsToMany
     */
    public function projects(): BelongsToMany
    {
        return $this->belongsToMany(Project::class, 're_project_categories')->with('slugable');
    }

    /**
     * @return BelongsTo
     */
    public function parent(): BelongsTo
    {
        return $this->belongsTo(Category::class, 'parent_id')->withDefault();
    }

    /**
     * @return HasMany
     */
    public function children(): HasMany
    {
        return $this->hasMany(Category::class, 'parent_id');
    }

    /**
     * @return string
     */
    public function getBadgeWithCountAttribute()
    {
        switch ($this->status->getValue()) {
            case BaseStatusEnum::DRAFT:
                $badge = 'bg-secondary';
                break;
            case BaseStatusEnum::PENDING:
                $badge = 'bg-warning';
                break;
            default:
                $badge = 'bg-success';
                break;
        }
        $html = '';
        if ($this->is_default) {
            $html .= Html::tag('span', '<i class="fas fa-award"></i>', [
                'class'          => 'badge bg-info me-1',
                'data-bs-toggle' => 'tooltip',
                'title'          => trans('plugins/real-estate::category.is_default')
            ], null, false);
        }
        $html .= Html::tag('span', (string)$this->projects_count, [
            'class'          => 'badge font-weight-bold me-1 ' . $badge,
            'data-bs-toggle' => 'tooltip',
            'title'          => trans('plugins/real-estate::category.total_projects', ['total' => $this->projects_count])
        ]);

        $html .= Html::tag('span', (string)$this->properties_count, [
            'class'          => 'badge font-weight-bold ' . $badge,
            'data-bs-toggle' => 'tooltip',
            'title'          => trans('plugins/real-estate::category.total_properties', ['total' => $this->properties_count])
        ]);

        return $html;
    }

    protected static function boot()
    {
        parent::boot();

        self::deleting(function (Category $category) {
            foreach ($category->children()->get() as $child) {
                $child->parent_id = $category->parent_id;
                $child->save();
            }

            $category->properties()->detach();
            $category->projects()->detach();
        });
    }
}
