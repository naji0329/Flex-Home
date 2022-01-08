<?php

namespace Botble\RealEstate\Repositories\Eloquent;

use Botble\RealEstate\Enums\ConsultStatusEnum;
use Botble\Support\Repositories\Eloquent\RepositoriesAbstract;
use Botble\RealEstate\Repositories\Interfaces\ConsultInterface;

class ConsultRepository extends RepositoriesAbstract implements ConsultInterface
{
    /**
     * {@inheritdoc}
     */
    public function getUnread($select = ['*'])
    {
        $data = $this->model->where('status', ConsultStatusEnum::UNREAD)->select($select)->get();
        $this->resetModel();

        return $data;
    }

    /**
     * {@inheritdoc}
     */
    public function countUnread()
    {
        $data = $this->model->where('status', ConsultStatusEnum::UNREAD)->count();
        $this->resetModel();

        return $data;
    }
}
