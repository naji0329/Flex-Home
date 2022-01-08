<?php

namespace Botble\RealEstate\Repositories\Interfaces;

use Botble\RealEstate\Models\Property;
use Botble\Support\Repositories\Interfaces\RepositoryInterface;

interface PropertyInterface extends RepositoryInterface
{
    /**
     * @param int $propertyId
     * @param int $limit
     * @return array
     */
    public function getRelatedProperties(int $propertyId, $limit = 4, array $with = []);

    /**
     * @param array $filters
     * @param array $params
     * @return array
     */
    public function getProperties($filters = [], $params = []);

    /**
     * @param int $propertyId
     * @param array $with
     * @return Property
     */
    public function getProperty(int $propertyId, array $with = []);

    /**
     * @param array $condition
     * @param int $limit
     * @param array $with
     * @return array
     */
    public function getPropertiesByConditions(array $condition, $limit, array $with = []);
}
