<?php

namespace Botble\Setting\Http\Requests;

use Botble\Support\Http\Requests\Request;

class LicenseSettingRequest extends Request
{

    /**
     * Get the validation rules that apply to the request.
     * @return array
     */
    public function rules()
    {
        return [
            'purchase_code'           => 'required',
            'buyer'                   => 'required',
            'license_rules_agreement' => 'accepted:1',
        ];
    }
}
