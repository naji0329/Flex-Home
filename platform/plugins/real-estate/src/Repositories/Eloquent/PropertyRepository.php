<?php

namespace Botble\RealEstate\Repositories\Eloquent;

use Botble\RealEstate\Enums\ModerationStatusEnum;
use Botble\RealEstate\Enums\PropertyStatusEnum;
use Botble\RealEstate\Enums\PropertyTypeEnum;
use Botble\RealEstate\Repositories\Interfaces\PropertyInterface;
use Botble\Support\Repositories\Eloquent\RepositoriesAbstract;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Arr;
use Language;

class PropertyRepository extends RepositoriesAbstract implements PropertyInterface
{
    /**
     * {@inheritdoc}
     */
    public function getRelatedProperties(int $propertyId, $limit = 4, array $with = [])
    {
        $currentProperty = $this->findById($propertyId, ['categories']);

        $this->model = $this->originalModel;
        $this->model = $this->model
            ->where('re_properties.id', '<>', $propertyId)
            ->notExpired();

        if ($currentProperty && $currentProperty->categories->count()) {

            $categoryIds = $currentProperty->categories->pluck('id')->toArray();

            $this->model
                ->whereHas('categories', function ($query) use ($categoryIds) {
                    $query->whereIn('category_id', $categoryIds);
                })
                ->where('type', $currentProperty->type);
        }

        $params = [
            'condition' => [
                ['status', 'NOT_IN', [PropertyStatusEnum::NOT_AVAILABLE]],
                'moderation_status' => ModerationStatusEnum::APPROVED,
            ],
            'order_by'  => [
                'created_at' => 'desc',
            ],
            'take'      => $limit,
            'with'      => $with,
        ];

        return $this->advancedGet($params);
    }

    /**
     * {@inheritdoc}
     */
    public function getProperties($filters = [], $params = [])
    {
        $filters = array_merge([
            'keyword'     => null,
            'type'        => null,
            'bedroom'     => null,
            'bathroom'    => null,
            'floor'       => null,
            'min_square'  => null,
            'max_square'  => null,
            'min_price'   => null,
            'max_price'   => null,
            'project'     => null,
            'category_id' => null,
            'city_id'     => null,
            'city'        => null,
            'location'    => null,
            'sort_by'     => null,
        ], $filters);

        switch ($filters['sort_by']) {
            case 'date_asc':
                $orderBy = [
                    're_properties.created_at' => 'asc',
                ];
                break;
            case 'date_desc':
                $orderBy = [
                    're_properties.created_at' => 'desc',
                ];
                break;
            case 'price_asc':
                $orderBy = [
                    're_properties.price' => 'asc',
                ];
                break;
            case 'price_desc':
                $orderBy = [
                    're_properties.price' => 'desc',
                ];
                break;
            case 'name_asc':
                $orderBy = [
                    're_properties.name' => 'asc',
                ];
                break;
            case 'name_desc':
                $orderBy = [
                    're_properties.name' => 'desc',
                ];
                break;
            default:
                $orderBy = [
                    're_properties.created_at' => 'desc',
                ];
                break;
        }

        $params = array_merge([
            'condition' => [
                ['re_properties.status', 'NOT_IN', [PropertyStatusEnum::NOT_AVAILABLE]],
                're_properties.moderation_status' => ModerationStatusEnum::APPROVED,
            ],
            'order_by'  => [
                're_properties.created_at' => 'desc',
            ],
            'take'      => null,
            'paginate'  => [
                'per_page'      => 10,
                'current_paged' => 1,
            ],
            'select'    => [
                're_properties.*',
            ],
            'with'      => [],
        ], $params);

        $params['order_by'] = $orderBy;

        $this->model = $this->originalModel->notExpired();

        if ($filters['keyword'] !== null) {
            $keyword = $filters['keyword'];

            $this->model = $this->model
                ->where(function (Builder $query) use ($keyword) {
                    return $query
                        ->where('re_properties.name', 'LIKE', '%' . $keyword . '%')
                        ->orWhere('re_properties.location', 'LIKE', '%' . $keyword . '%')
                        ->orWhere('re_properties.description', 'LIKE', '%' . $keyword . '%');
                });
        }

        if ($filters['type'] !== null) {
            if ($filters['type'] == PropertyTypeEnum::SALE) {
                $this->model = $this->model->where('re_properties.type', $filters['type']);
            } else {
                $this->model = $this->model->where('re_properties.type', $filters['type']);
            }
        }

        if ($filters['bedroom']) {
            if ($filters['bedroom'] < 5) {
                $this->model = $this->model->where('re_properties.number_bedroom', $filters['bedroom']);
            } else {
                $this->model = $this->model->where('re_properties.number_bedroom', '>=', $filters['bedroom']);
            }
        }

        if ($filters['bathroom']) {
            if ($filters['bathroom'] < 5) {
                $this->model = $this->model->where('re_properties.number_bathroom', $filters['bathroom']);
            } else {
                $this->model = $this->model->where('re_properties.number_bathroom', '>=', $filters['bathroom']);
            }
        }

        if ($filters['floor']) {
            if ($filters['floor'] < 5) {
                $this->model = $this->model->where('re_properties.number_floor', $filters['floor']);
            } else {
                $this->model = $this->model->where('re_properties.number_floor', '>=', $filters['floor']);
            }
        }

        if ($filters['min_square'] !== null || $filters['max_square'] !== null) {
            $this->model = $this->model
                ->where(function ($query) use ($filters) {
                    $minSquare = Arr::get($filters, 'min_square');
                    $maxSquare = Arr::get($filters, 'max_square');

                    /**
                     * @var \Illuminate\Database\Query\Builder $query
                     */
                    if ($minSquare !== null) {
                        $query = $query->where('re_properties.square', '>=', $minSquare);
                    }

                    if ($maxSquare !== null) {
                        $query = $query->where('re_properties.square', '<=', $maxSquare);
                    }

                    return $query;
                });
        }

        if ($filters['min_price'] !== null || $filters['max_price'] !== null) {
            $this->model = $this->model
                ->where(function ($query) use ($filters) {

                    $minPrice = Arr::get($filters, 'min_price');
                    $maxPrice = Arr::get($filters, 'max_price');

                    /**
                     * @var Builder $query
                     */
                    if ($minPrice !== null) {
                        $query = $query->where('re_properties.price', '>=', $minPrice);
                    }

                    if ($maxPrice !== null) {
                        $query = $query->where('re_properties.price', '<=', $maxPrice);
                    }

                    return $query;
                });
        }

        if ($filters['city'] !== null) {
            $this->model = $this->model->whereHas('city', function ($query) use ($filters) {
                $query->where('slug', $filters['city']);
            });
        }

        if ($filters['project'] !== null) {
            $this->model = $this->model->where('re_properties.project_id', $filters['project']);
        }

        if ($filters['category_id'] !== null) {
            $categoryIds = get_property_categories_related_ids($filters['category_id']);
            $this->model = $this->model
                ->whereHas('categories', function ($query) use ($categoryIds) {
                    $query->whereIn('category_id', $categoryIds);
                });
        }

        if ($filters['city_id']) {
            $this->model = $this->model->where('re_properties.city_id', $filters['city_id']);
        } elseif ($filters['location']) {
            $locationData = explode(',', $filters['location']);

            if (count($locationData) > 1) {
                $locationSearch = trim($locationData[0]);
            } else {
                $locationSearch = trim($filters['location']);
            }

            if (is_plugin_active('language-advanced') && Language::getCurrentLocale() != Language::getDefaultLocale()) {
                $this->model = $this->model
                    ->where(function (Builder $query) use ($locationSearch) {
                        return $query
                            ->whereHas('city.translations', function ($query) use ($locationSearch) {
                                $query->where('name', 'LIKE', '%' . $locationSearch . '%');
                            })
                            ->orWhereHas('city.state.translations', function ($query) use ($locationSearch) {
                                $query->where('name', 'LIKE', '%' . $locationSearch . '%');
                            })
                            ->orWhere('re_properties.location', 'LIKE', '%' . $locationSearch . '%');
                    });
            } else {
                $this->model = $this->model
                    ->join('cities', 'cities.id', '=', 're_properties.city_id')
                    ->join('states', 'states.id', '=', 'cities.state_id')
                    ->where(function ($query) use ($locationSearch) {
                        return $query
                            ->where('cities.name', 'LIKE', '%' . $locationSearch . '%')
                            ->orWhere('states.name', 'LIKE', '%' . $locationSearch . '%')
                            ->orWhere('re_properties.location', 'LIKE', '%' . $locationSearch . '%');
                    });
            }
        }

        return $this->advancedGet($params);
    }

    /**
     * {@inheritDoc}
     */
    public function getProperty(int $propertyId, array $with = [])
    {
        $params = [
            'condition' => [
                'id'                => $propertyId,
                'moderation_status' => ModerationStatusEnum::APPROVED,
            ],
            'with'      => $with,
            'take'      => 1,
        ];

        $this->model = $this->originalModel->notExpired();

        return $this->advancedGet($params);
    }

    /**
     * {@inheritDoc}
     */
    public function getPropertiesByConditions(array $condition, $limit, array $with = [])
    {
        $this->model = $this->originalModel->notExpired();

        $params = [
            'condition' => $condition,
            'with'      => $with,
            'take'      => $limit,
            'order_by'  => ['created_at' => 'desc'],
        ];

        return $this->advancedGet($params);
    }
}
