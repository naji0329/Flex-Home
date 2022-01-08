<?php

namespace Botble\Location\Repositories\Interfaces;

use Botble\Support\Repositories\Interfaces\RepositoryInterface;

interface CityInterface extends RepositoryInterface
{
    /**
     * @param string $keyword
     * @param int $limit
     * @param array $with
     * @param array|string[] $select
     */
    public function filters($keyword, $limit = 10, array $with = [], array $select = ['cities.*']);
}
