<?php

namespace Botble\Location\Repositories\Eloquent;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Location\Repositories\Interfaces\CityInterface;
use Botble\Support\Repositories\Eloquent\RepositoriesAbstract;
use Illuminate\Database\Eloquent\Builder;
use Language;

class CityRepository extends RepositoriesAbstract implements CityInterface
{
    /**
     * {@inheritDoc}
     */
    public function filters($keyword, $limit = 10, array $with = [], array $select = ['cities.*'])
    {
        $data = $this->model
            ->where('cities.status', BaseStatusEnum::PUBLISHED)
            ->join('states', 'states.id', '=', 'cities.state_id')
            ->join('countries', 'countries.id', '=', 'cities.country_id')
            ->where('states.status', BaseStatusEnum::PUBLISHED)
            ->where('countries.status', BaseStatusEnum::PUBLISHED);

        if (is_plugin_active('language-advanced') && Language::getCurrentLocale() != Language::getDefaultLocale()) {
            $data = $data
                ->where(function (Builder $query) use ($keyword) {
                    return $query
                        ->whereHas('translations', function ($query) use ($keyword) {
                            $query->where('name', 'LIKE', '%' . $keyword . '%');
                        })
                        ->orWhereHas('state.translations', function ($query) use ($keyword) {
                            $query->where('name', 'LIKE', '%' . $keyword . '%');
                        });
                });
        } else {
            $data = $data
                ->where(function (Builder $query) use ($keyword) {
                    return $query
                        ->where('cities.name', 'LIKE', '%' . $keyword . '%')
                        ->orWhere('states.name', 'LIKE', '%' . $keyword . '%');
                });
        }

        $data = $data->limit($limit);

        if ($with) {
            $data = $this->model->with($with);
        }

        return $this->applyBeforeExecuteQuery($data)->get($select);
    }
}

