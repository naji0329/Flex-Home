<?php

namespace Botble\RealEstate\Http\Requests;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class PackageRequest extends Request
{

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name'               => 'required',
            'price'              => 'numeric|required|min:0',
            'percent_save'       => 'numeric|required|min:0',
            'currency_id'        => 'required',
            'number_of_listings' => 'numeric|required|min:1',
            'status'             => Rule::in(BaseStatusEnum::values()),
        ];
    }
}
