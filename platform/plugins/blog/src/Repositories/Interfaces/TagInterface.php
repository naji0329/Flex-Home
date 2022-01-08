<?php

namespace Botble\Blog\Repositories\Interfaces;

use Botble\Support\Repositories\Interfaces\RepositoryInterface;

interface TagInterface extends RepositoryInterface
{

    /**
     * @return array
     */
    public function getDataSiteMap();

    /**
     * @param int $limit
     * @param array|string[] $with
     * @param array $withCount
     * @return mixed
     */
    public function getPopularTags($limit, array $with = ['slugable'], array $withCount = ['posts']);

    /**
     * @param bool $active
     * @return array
     */
    public function getAllTags($active = true);
}
