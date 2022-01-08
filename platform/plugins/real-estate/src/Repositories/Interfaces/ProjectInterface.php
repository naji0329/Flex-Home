<?php

namespace Botble\RealEstate\Repositories\Interfaces;

use Botble\Support\Repositories\Interfaces\RepositoryInterface;
use Illuminate\Support\Collection;

interface ProjectInterface extends RepositoryInterface
{
    /**
     * @param array $filters
     * @param array $params
     * @return array
     */
    public function getProjects($filters = [], $params = []);

    /**
     * @param int $projectId
     * @param int $limit
     * @param array $with
     * @return Collection
     */
    public function getRelatedProjects(int $projectId, $limit = 4, array $with = []);
}
