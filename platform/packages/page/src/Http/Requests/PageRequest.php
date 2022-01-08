<?php

namespace Botble\Page\Http\Requests;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Page\Supports\Template;
use Botble\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class PageRequest extends Request
{

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name'        => 'required|max:120',
            'description' => 'max:400',
            'content'     => 'required',
            'template'    => Rule::in(array_keys(Template::getPageTemplates())),
            'status'      => Rule::in(BaseStatusEnum::values()),
        ];
    }
}
