<?php

namespace Botble\RealEstate\Models;

use Botble\Base\Models\BaseModel;
use Botble\Base\Traits\EnumCastable;
use Botble\Location\Models\City;
use Botble\RealEstate\Enums\ModerationStatusEnum;
use Botble\RealEstate\Enums\PropertyPeriodEnum;
use Botble\RealEstate\Enums\PropertyStatusEnum;
use Botble\RealEstate\Enums\PropertyTypeEnum;
use Exception;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\MorphTo;
use Illuminate\Support\Arr;
use RvMedia;
use Illuminate\Support\Str;

class Property extends BaseModel
{
    use EnumCastable;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 're_properties';

    /**
     * @var array
     */
    protected $fillable = [
        'name',
        'type',
        'description',
        'content',
        'location',
        'images',
        'project_id',
        'number_bedroom',
        'number_bathroom',
        'number_floor',
        'square',
        'price',
        'status',
        'is_featured',
        'currency_id',
        'city_id',
        'period',
        'author_id',
        'author_type',
        'expire_date',
        'auto_renew',
        'latitude',
        'longitude',
    ];

    /**
     * @var array
     */
    protected $casts = [
        'status'            => PropertyStatusEnum::class,
        'moderation_status' => ModerationStatusEnum::class,
        'type'              => PropertyTypeEnum::class,
        'period'            => PropertyPeriodEnum::class,
    ];

    /**
     * @var array
     */
    protected $dates = [
        'created_at',
        'updated_at',
        'expire_date',
    ];

    /**
     * @return BelongsTo
     */
    public function project(): BelongsTo
    {
        return $this->belongsTo(Project::class, 'project_id')->withDefault();
    }

    /**
     * @return BelongsToMany
     */
    public function features(): BelongsToMany
    {
        return $this->belongsToMany(Feature::class, 're_property_features', 'property_id', 'feature_id');
    }

    /**
     * @return BelongsToMany
     */
    public function facilities(): BelongsToMany
    {
        return $this->morphToMany(Facility::class, 'reference', 're_facilities_distances')->withPivot('distance');
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
     * @return string
     */
    public function getSquareTextAttribute()
    {
        return $this->square . ' ' . setting('real_estate_square_unit', 'm²');
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
     * @return MorphTo
     */
    public function author(): MorphTo
    {
        return $this->morphTo()->withDefault();
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
        return $this->belongsToMany(Category::class, 're_property_categories');
    }

    /**
     * @param \Illuminate\Database\Eloquent\Builder $query
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeNotExpired($query)
    {
        return $query->where(function ($query) {
            $query->where('expire_date', '>=', now()->toDateTimeString())
                ->orWhere('never_expired', true);
        });
    }

    /**
     * @param \Illuminate\Database\Eloquent\Builder $query
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeExpired($query)
    {
        return $query->where(function ($query) {
            $query->where('expire_date', '<', now()->toDateTimeString())
                ->where('never_expired', false);
        });
    }

    /**
     * @return string
     */
    public function getCityNameAttribute()
    {
        return $this->city->name . ', ' . $this->city->state->name;
    }

    /**
     * @return string
     */
    public function getTypeHtmlAttribute()
    {
        return $this->type->label();
    }

    /**
     * @return string
     */
    public function getStatusHtmlAttribute()
    {
        return $this->status->toHtml();
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
    public function getPriceHtmlAttribute()
    {
        $price = $this->price_format;

        if ($this->type == PropertyTypeEnum::RENT) {
            $price .= ' / ' . Str::lower($this->period->label());
        }

        return $price;
    }

    /**
     * @return string
     */
    public function getPriceFormatAttribute()
    {
        if ($this->price_formatted) {
            return $this->price_formatted;
        }

        return $this->price_formatted = format_price($this->price, $this->currency);
    }

    /**
     * @return string
     */
    public function getMapIconAttribute()
    {
        return $this->type_html . ': ' . $this->price_format;
    }

    protected static function boot()
    {
        parent::boot();

        static::deleting(function (Property $property) {
            $property->categories()->detach();
        });
    }
}
