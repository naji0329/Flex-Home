<?php

namespace Botble\Page\Repositories\Eloquent;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Page\Repositories\Interfaces\PageInterface;
use Botble\Support\Repositories\Eloquent\RepositoriesAbstract;

class PageRepository extends RepositoriesAbstract implements PageInterface
{

    /**
     * {@inheritDoc}
     */
    public function getDataSiteMap()
    {
        $data = $this->model
            ->where('status', BaseStatusEnum::PUBLISHED)
            ->orderBy('created_at', 'desc');

        return $this->applyBeforeExecuteQuery($data)->get();
    }

    /**
     * {@inheritDoc}
     */
    public function getFeaturedPages($limit)
    {
        $data = $this->model
            ->where(['status' => BaseStatusEnum::PUBLISHED, 'is_featured' => 1])
            ->orderBy('created_at')
            ->limit($limit)
            ->orderBy('created_at', 'desc');

        return $this->applyBeforeExecuteQuery($data)->get();
    }

    /**
     * {@inheritDoc}
     */
    public function whereIn($array, $select = [])
    {
        $pages = $this->model
            ->whereIn('id', $array)
            ->where('status', BaseStatusEnum::PUBLISHED);

        if (empty($select)) {
            $select = ['*'];
        }

        $data = $pages
            ->select($select)
            ->orderBy('created_at');

        return $this->applyBeforeExecuteQuery($data)->get();
    }

    /**
     * {@inheritDoc}
     */
    public function getSearch($query, $limit = 10)
    {
        $pages = $this->model->where('status', BaseStatusEnum::PUBLISHED);
        foreach (explode(' ', $query) as $term) {
            $pages = $pages->where('name', 'LIKE', '%' . $term . '%');
        }

        $data = $pages
            ->orderBy('created_at', 'desc')
            ->limit($limit);

        return $this->applyBeforeExecuteQuery($data)->get();
    }

    /**
     * {@inheritDoc}
     */
    public function getAllPages($active = true)
    {
        $data = $this->model;

        if ($active) {
            $data = $data->where('status', BaseStatusEnum::PUBLISHED);
        }

        return $this->applyBeforeExecuteQuery($data)->get();
    }
}
