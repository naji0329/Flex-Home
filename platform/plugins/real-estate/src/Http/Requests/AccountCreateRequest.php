<?php

namespace Botble\RealEstate\Http\Requests;

use Botble\Support\Http\Requests\Request;

class AccountCreateRequest extends Request
{

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'first_name' => 'required|max:120|min:2',
            'last_name'  => 'required|max:120|min:2',
            'username'   => 'required|max:60|min:2|unique:re_accounts,username',
            'email'      => 'required|max:60|min:6|email|unique:re_accounts',
            'password'   => 'required|min:6|confirmed',
        ];
    }
}
