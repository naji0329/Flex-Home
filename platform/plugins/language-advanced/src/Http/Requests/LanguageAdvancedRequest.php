<?php

namespace Botble\LanguageAdvanced\Http\Requests;

use Botble\Support\Http\Requests\Request;

class LanguageAdvancedRequest extends Request
{

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'model' => 'required|max:255',
        ];
    }
}
