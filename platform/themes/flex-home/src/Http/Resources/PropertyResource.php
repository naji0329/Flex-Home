<?php

namespace Theme\FlexHome\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use RvMedia;

class PropertyResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param Request $request
     * @return array
     */
    public function toArray($request)
    {
        $images = [];

        foreach ($this->images as $item) {
            $images[] = RvMedia::getImageUrl($item, 'small', false, RvMedia::getDefaultImage());
        }

        return [
            'id'              => $this->id,
            'name'            => $this->name,
            'url'             => $this->url,
            'description'     => $this->description,
            'image'           => $this->image_small,
            'image_thumb'     => $this->image_thumb,
            'images'          => $this->images,
            'price_html'      => $this->price_html,
            'city_name'       => $this->city_name,
            'number_bedroom'  => $this->number_bedroom,
            'number_bathroom' => $this->number_bathroom,
            'square'          => $this->square,
            'square_text'     => $this->square_text,
            'type'            => $this->type,
            'type_text'       => $this->type_html,
            'latitude'        => $this->latitude,
            'longitude'       => $this->longitude,
            'period'          => $this->period,
            'status_html'     => $this->status_html,
            'category_name'   => $this->category_name,
            'map_icon'        => $this->map_icon
        ];
    }
}
