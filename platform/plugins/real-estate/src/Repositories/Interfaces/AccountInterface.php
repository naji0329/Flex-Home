<?php

namespace Botble\RealEstate\Repositories\Interfaces;

use Botble\Support\Repositories\Interfaces\RepositoryInterface;

interface AccountInterface extends RepositoryInterface
{
    /**
     * @param string $name
     * @param int|null $id
     * @return string
     */
    public function createUsername($name, $id = null);
}
