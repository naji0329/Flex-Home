<?php

namespace Botble\RealEstate\Services;

use Botble\RealEstate\Models\Project;
use Botble\RealEstate\Models\Property;

class SaveFacilitiesService
{
    /**
     * @param Project| Property|mixed $item
     * @param array $facilities
     */
    public function execute($item, $facilities): bool
    {
        if (!$facilities || !is_array($facilities)) {
            return false;
        }

        $item->facilities()->detach();

        foreach ($facilities as $facility) {
            if (empty($facility['id'])) {
                continue;
            }

            $item->facilities()->attach($facility['id'], ['distance' => $facility['distance']]);
        }

        return true;
    }
}
