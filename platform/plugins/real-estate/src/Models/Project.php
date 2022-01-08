<?php

namespace Botble\RealEstate\Models;

use Botble\Base\Models\BaseModel;
use Botble\Base\Traits\EnumCastable;
use Botble\Location\Models\City;
use Botble\RealEstate\Enums\ProjectStatusEnum;
use Carbon\Carbon;
use Exception;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Arr;
use RvMedia;

class Project extends BaseModel
{
    use EnumCastable;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 're_projects';

    /**
     * @var array
     */
    protected $fillable = [
        'name',
        'description',
        'content',
        'location',
        'images',
        'status',
        'is_featured',
        'investor_id',
        'number_block',
        'number_floor',
        'number_flat',
        'date_finish',
        'date_sell',
        'price_from',
        'price_to',
        'currency_id',
        'city_id',
        'author_id',
        'author_type',
        'category_id',
        'latitude',
        'longitude',
    ];

    /**
     * @var array
     */
    protected $casts = [
        'status' => ProjectStatusEnum::class,
    ];

    /**
     * @return HasMany
     */
    public function property(): HasMany
    {
        return $this->hasMany(Property::class, 'project_id');
    }

    /**
     * @param string $value
     * @return array
     */
    public function getImagesAttribute($value)
    {
        try {
            if ($value === '[null]') {
                return [];
            }

            $images = json_decode((string)$value, true);

            if (is_array($images)) {
                $images = array_filter($images);
            }

            return $images ?: [];
        } catch (Exception $exception) {
            return [];
        }
    }

    /**
     * @return string|null
     */
    public function getImageAttribute(): ?string
    {
        return Arr::first($this->images) ?? null;
    }

    /**
     * @param string $value
     */
    public function setDateFinishAttribute(?string $value): void
    {
        $this->attributes['date_finish'] = Carbon::parse($value)->toDateString();
    }

    /**
     * @param string $value
     */
    public function setDateSellAttribute(?string $value): void
    {
        $this->attributes['date_sell'] = Carbon::parse($value)->toDateString();
    }

    /**
     * @return BelongsTo
     */
    public function investor(): BelongsTo
    {
        return $this->belongsTo(Investor::class)->withDefault();
    }

    /**
     * @return BelongsToMany
     */
    public function features(): BelongsToMany
    {
        return $this->belongsToMany(Feature::class, 're_project_features', 'project_id', 'feature_id');
    }

    /**
     * @return BelongsToMany
     */
    public function facilities(): BelongsToMany
    {
        return $this->morphToMany(Facility::class, 'reference', 're_facilities_distances')->withPivot('distance');;
    }

    /**
     * @return BelongsTo
     */
    public function currency(): BelongsTo
    {
        return $this->belongsTo(Currency::class)->withDefault();
    }

    /**
     * @return BelongsTo
     */
    public function city(): BelongsTo
    {
        return $this->belongsTo(City::class)->withDefault();
    }

    /**
     * @return Category
     */
    public function getCategoryAttribute()
    {
        return $this->categories->first() ?: new Category;
    }

    /**
     * @return BelongsToMany
     */
    public function categories(): BelongsToMany
    {
        return $this->belongsToMany(Category::class, 're_project_categories');
    }

    /**
     * @return string
     */
    public function getCategoryNameAttribute()
    {
        return $this->category->name;
    }

    /**
     * @return string|null
     */
    public function getImageThumbAttribute()
    {
        return $this->image ? RvMedia::getImageUrl($this->image, 'thumb', false, RvMedia::getDefaultImage()) : null;
    }

    /**
     * @return string|null
     */
    public function getImageSmallAttribute()
    {
        return $this->image ? RvMedia::getImageUrl($this->image, 'small', false, RvMedia::getDefaultImage()) : null;
    }

    /**
     * @return string
     */
    public function getMapIconAttribute()
    {
        return $this->name;
    }
    /**
     * @return string
     */
    public function getCityNameAttribute()
    {
        return $this->city->name . ', ' . $this->city->state->name;
    }

    protected static function boot()
    {
        parent::boot();

        static::deleting(function (Project $project) {
            $project->categories()->detach();
        });
    }
}
