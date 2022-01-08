<?php

namespace Botble\RealEstate\Http\Requests;

use Botble\RealEstate\Enums\ProjectStatusEnum;
use Botble\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class ProjectRequest extends Request
{

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name'         => 'required|max:120',
            'description'  => 'max:350',
            'content'      => 'required',
            'number_block' => 'numeric|min:0|max:10000|nullable',
            'number_floor' => 'numeric|min:0|max:10000|nullable',
            'number_flat'  => 'numeric|min:0|max:10000|nullable',
            'price_from'   => 'numeric|min:0|nullable',
            'price_to'     => 'numeric|min:0|nullable',
            'latitude'     => 'max:20|nullable',
            'longitude'    => 'max:20|nullable',
            'status'       => Rule::in(ProjectStatusEnum::values()),
        ];
    }
}
