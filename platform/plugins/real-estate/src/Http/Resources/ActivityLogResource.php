<?php

namespace Botble\RealEstate\Http\Resources;

use Botble\RealEstate\Models\AccountActivityLog;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * @mixin AccountActivityLog
 */
class ActivityLogResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param Request $request
     *
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id'          => $this->id,
            'ip_address'  => $this->ip_address,
            'description' => $this->getDescription(),
        ];
    }
}
