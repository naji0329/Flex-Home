<?php

namespace Botble\Location;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Location\Repositories\Interfaces\CityInterface;
use Botble\Location\Repositories\Interfaces\StateInterface;

class Location
{
    /**
     * @var StateInterface
     */
    public $stateRepository;
    /**
     * @var CityInterface
     */
    public $cityRepository;

    /**
     * Location constructor.
     * @param StateInterface $stateRepository
     * @param CityInterface $cityRepository
     */
    public function __construct(StateInterface $stateRepository, CityInterface $cityRepository)
    {
        $this->stateRepository = $stateRepository;
        $this->cityRepository = $cityRepository;
    }

    /**
     * @return \Illuminate\Config\Repository|mixed
     */
    public function getStates()
    {
        $states = $this->stateRepository->advancedGet([
            'condition' => [
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            'order_by'  => ['order' => 'DESC'],
        ]);

        return $states->pluck('name', 'id')->all();
    }

    /**
     * @param $stateId
     * @return \Illuminate\Config\Repository|mixed
     */
    public function getCitiesByState($stateId)
    {
        $cities = $this->cityRepository->advancedGet([
            'condition' => [
                'status'   => BaseStatusEnum::PUBLISHED,
                'state_id' => $stateId,
            ],
            'order_by'  => ['order' => 'DESC'],
        ]);

        return $cities->pluck('name', 'id')->all();
    }

    /**
     * @param $cityId
     * @return string
     */
    public function getCityNameById($cityId)
    {
        $city = $this->cityRepository->getFirstBy([
            'id'     => $cityId,
            'status' => BaseStatusEnum::PUBLISHED,
        ]);

        return $city ? $city->name : null;
    }

    /**
     * @param $stateId
     * @return string
     */
    public function getStateNameById($stateId)
    {
        $state = $this->stateRepository->getFirstBy([
            'id'     => $stateId,
            'status' => BaseStatusEnum::PUBLISHED,
        ]);

        return $state ? $state->name : null;
    }
}
