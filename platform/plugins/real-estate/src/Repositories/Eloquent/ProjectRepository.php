<?php

namespace Botble\RealEstate\Repositories\Eloquent;

use Botble\RealEstate\Enums\ProjectStatusEnum;
use Botble\RealEstate\Repositories\Interfaces\ProjectInterface;
use Botble\Support\Repositories\Eloquent\RepositoriesAbstract;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Arr;
use Language;

class ProjectRepository extends RepositoriesAbstract implements ProjectInterface
{
    /**
     * {@inheritdoc}
     */
    public function getProjects($filters = [], $params = [])
    {
        $filters = array_merge([
            'keyword'     => null,
            'city'        => null,
            'min_floor'   => null,
            'max_floor'   => null,
            'blocks'      => null,
            'min_flat'    => null,
            'max_flat'    => null,
            'category_id' => null,
            'city_id'     => null,
            'location'    => null,
            'sort_by'     => null,
        ], $filters);

        switch ($filters['sort_by']) {
            case 'date_asc':
                $orderBy = [
                    're_projects.created_at' => 'asc',
                ];
                break;
            case 'date_desc':
                $orderBy = [
                    're_projects.created_at' => 'desc',
                ];
                break;
            case 'price_asc':
                $orderBy = [
                    're_projects.price_from' => 'asc',
                ];
                break;
            case 'price_desc':
                $orderBy = [
                    're_projects.price_from' => 'desc',
                ];
                break;
            case 'name_asc':
                $orderBy = [
                    're_projects.name' => 'asc',
                ];
                break;
            case 'name_desc':
                $orderBy = [
                    're_projects.name' => 'desc',
                ];
                break;
            default:
                $orderBy = [
                    're_projects.created_at' => 'DESC',
                ];
                break;
        }

        $params = array_merge([
            'condition' => [],
            'order_by'  => [
                're_projects.created_at' => 'DESC',
            ],
            'take'      => null,
            'paginate'  => [
                'per_page'      => 10,
                'current_paged' => 1,
            ],
            'select'    => [
                're_projects.*',
            ],
            'with'      => [],
        ], $params);

        $params['order_by'] = $orderBy;

        $this->model = $this->originalModel;

        if ($filters['keyword'] !== null) {
            $keyword = $filters['keyword'];

            $this->model = $this->model
                ->where(function (Builder $query) use ($keyword) {
                    return $query
                        ->where('re_projects.name', 'LIKE', '%' . $keyword . '%')
                        ->orWhere('re_projects.location', 'LIKE', '%' . $keyword . '%')
                        ->orWhere('re_projects.description', 'LIKE', '%' . $keyword . '%');
                });
        }

        if ($filters['city'] !== null) {
            $this->model = $this->model->whereHas('city', function ($query) use ($filters) {
                $query->where('slug', $filters['city']);
            });
        }

        if ($filters['blocks']) {
            if ($filters['blocks'] < 5) {
                $this->model = $this->model->where('re_projects.number_block', $filters['blocks']);
            } else {
                $this->model = $this->model->where('re_projects.number_block', '>=', $filters['blocks']);
            }
        }

        if ($filters['min_floor'] !== null || $filters['max_floor'] !== null) {
            $this->model = $this->model
                ->where(function ($query) use ($filters) {
                    $minFloor = Arr::get($filters, 'min_floor');
                    $maxFloor = Arr::get($filters, 'max_floor');

                    /**
                     * @var \Illuminate\Database\Query\Builder $query
                     */
                    if ($minFloor !== null) {
                        $query = $query->where('re_projects.number_floor', '>=', $minFloor);
                    }

                    if ($maxFloor !== null) {
                        $query = $query->where('re_projects.number_floor', '<=', $maxFloor);
                    }

                    return $query;
                });
        }

        if ($filters['min_flat'] !== null || $filters['max_flat'] !== null) {
            $this->model = $this->model
                ->where(function ($query) use ($filters) {
                    $minFlat = Arr::get($filters, 'min_flat');
                    $maxFlat = Arr::get($filters, 'max_flat');

                    /**
                     * @var \Illuminate\Database\Query\Builder $query
                     */
                    if ($minFlat !== null) {
                        $query = $query->where('re_projects.number_flat', '>=', $minFlat);
                    }

                    if ($maxFlat !== null) {
                        $query = $query->where('re_projects.number_flat', '<=', $maxFlat);
                    }

                    return $query;
                });
        }

        if ($filters['category_id'] !== null) {
            $categoryIds = get_property_categories_related_ids($filters['category_id']);
            $this->model = $this->model
                ->whereHas('categories', function ($query) use ($categoryIds) {
                    $query->whereIn('category_id', $categoryIds);
                });
        }

        if ($filters['city_id']) {
            $this->model = $this->model->where('re_projects.city_id', $filters['city_id']);
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
                            ->orWhere('re_projects.location', 'LIKE', '%' . $locationSearch . '%');
                    });
            } else {
                $this->model = $this->model
                    ->join('cities', 'cities.id', '=', 're_projects.city_id')
                    ->join('states', 'states.id', '=', 'cities.state_id')
                    ->where(function ($query) use ($locationSearch) {
                        return $query
                            ->where('cities.name', 'LIKE', '%' . $locationSearch . '%')
                            ->orWhere('states.name', 'LIKE', '%' . $locationSearch . '%')
                            ->orWhere('re_projects.location', 'LIKE', '%' . $locationSearch . '%');
                    });
            }
        }

        $this->model->whereNotIn('re_projects.status', [ProjectStatusEnum::NOT_AVAILABLE]);

        return $this->advancedGet($params);
    }

    /**
     * {@inheritdoc}
     */
    public function getRelatedProjects(int $projectId, $limit = 4, array $with = [])
    {
        $currentProject = $this->findById($projectId, ['categories']);

        $this->model = $this->originalModel;
        $this->model = $this->model
            ->where('re_projects.id', '<>', $projectId);

        if ($currentProject && $currentProject->categories->count()) {

            $categoryIds = $currentProject->categories->pluck('id')->toArray();

            $this->model
                ->whereHas('categories', function ($query) use ($categoryIds) {
                    $query->whereIn('re_project_categories.category_id', $categoryIds);
                });
        }

        $params = [
            'condition' => [
                ['status', 'NOT_IN', [ProjectStatusEnum::NOT_AVAILABLE]],
            ],
            'order_by'  => [
                'created_at' => 'desc',
            ],
            'take'      => $limit,
            'with'      => $with,
        ];

        return $this->advancedGet($params);
    }
}
