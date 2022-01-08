<?php

namespace Botble\Setting\Http\Requests;

use Assets;
use Botble\Support\Http\Requests\Request;
use DateTimeZone;
use Illuminate\Validation\Rule;

class SettingRequest extends Request
{

    /**
     * Get the validation rules that apply to the request.
     * @return array
     */
    public function rules()
    {
        return [
            'admin_email'         => 'nullable|array',
            'default_admin_theme' => Rule::in(array_keys(Assets::getThemes())),
            'time_zone'           => Rule::in(DateTimeZone::listIdentifiers()),
        ];
    }
}
