<?php

namespace Botble\RealEstate\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PackageResource extends JsonResource
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
            'id'                  => $this->id,
            'name'                => $this->name,
            'price'               => $this->price,
            'price_text'          => format_price($this->price, $this->currency),
            'price_per_post_text' => format_price($this->price / $this->number_of_listings, $this->currency),
            'percent_save'        => $this->percent_save,
            'number_of_listings'  => $this->number_of_listings,
        ];
    }
}
