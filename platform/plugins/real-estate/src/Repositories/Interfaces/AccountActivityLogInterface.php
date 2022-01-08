<?php

namespace Botble\RealEstate\Repositories\Interfaces;

use Botble\Support\Repositories\Interfaces\RepositoryInterface;
use Illuminate\Database\Eloquent\Collection;

interface AccountActivityLogInterface extends RepositoryInterface
{
    /**
     * @param $accountId
     * @param int $paginate
     * @return Collection
     */
    public function getAllLogs($accountId, $paginate = 10);
}
