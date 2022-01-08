<?php

namespace Botble\Location\Http\Requests;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class LocationImportRequest extends Request
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
            'import_type'  => 'required|in:country,state,city',
            'order'        => 'nullable|integer|min:0|max:127',
            'abbreviation' => 'max:2',
            'status'       => 'required|' . Rule::in(BaseStatusEnum::values()),
            'country'      => 'required_if:import_type,state,city',
            'state'        => 'required_if:import_type,city',
            'nationality'  => 'required_if:import_type,country|max:120',
        ];
    }

    /**
     * Get the error messages for the defined validation rules.
     *
     * @return array
     */
    public function messages()
    {
        return [
            'country.required_if'     => trans('plugins/location::bulk-import.import_type_required_if'),
            'nationality.required_if' => trans('plugins/location::bulk-import.import_type_required_if'),
            'state.required_if'       => trans('plugins/location::bulk-import.import_type_required_if'),
        ];
    }
}
