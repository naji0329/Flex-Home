<?php

namespace Botble\RealEstate\Repositories\Eloquent;

use Botble\Support\Repositories\Eloquent\RepositoriesAbstract;
use Botble\RealEstate\Repositories\Interfaces\CategoryInterface;

class CategoryRepository extends RepositoriesAbstract implements CategoryInterface
{
    /**
     * {@inheritDoc}
     */
    public function getCategories(array $select, array $orderBy, array $conditions = [])
    {
        $data = $this->model->with('slugable')->select($select);
        if ($conditions) {
            $data = $data->where($conditions);
        }
        foreach ($orderBy as $by => $direction) {
            $data = $data->orderBy($by, $direction);
        }

        return $this->applyBeforeExecuteQuery($data)->get();
    }
}
