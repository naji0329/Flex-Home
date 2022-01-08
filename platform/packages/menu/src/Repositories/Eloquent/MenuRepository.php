<?php

namespace Botble\Menu\Repositories\Eloquent;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Menu\Repositories\Interfaces\MenuInterface;
use Botble\Support\Repositories\Eloquent\RepositoriesAbstract;
use Illuminate\Support\Str;

class MenuRepository extends RepositoriesAbstract implements MenuInterface
{
    /**
     * {@inheritDoc}
     */
    public function findBySlug($slug, $active, array $select = [], array $with = [])
    {
        $data = $this->model->where('slug', $slug);

        if ($active) {
            $data = $data->where('status', BaseStatusEnum::PUBLISHED);
        }

        if (!empty($select)) {
            $data = $data->select($select);
        }

        if (!empty($with)) {
            $data = $data->with($with);
        }

        $data = $this->applyBeforeExecuteQuery($data, true)->first();

        $this->resetModel();

        return $data;
    }

    /**
     * {@inheritDoc}
     */
    public function createSlug($name)
    {
        $slug = Str::slug($name);
        $index = 1;
        $baseSlug = $slug;
        while ($this->model->where('slug', $slug)->count() > 0) {
            $slug = $baseSlug . '-' . $index++;
        }

        if (empty($slug)) {
            $slug = time();
        }

        $this->resetModel();

        return $slug;
    }
}
