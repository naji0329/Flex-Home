<?php

namespace Botble\RealEstate\Http\Requests\API;

use Botble\Support\Http\Requests\Request;

class ForgotPasswordRequest extends Request
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'email' => 'required|email|string',
        ];
    }
}
