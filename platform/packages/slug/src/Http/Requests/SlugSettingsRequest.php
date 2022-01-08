<?php

namespace Botble\Slug\Http\Requests;

use Botble\Support\Http\Requests\Request;
use Illuminate\Support\Str;
use SlugHelper;

class SlugSettingsRequest extends Request
{

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $rules = [];

        $canEmptyPrefixes = SlugHelper::getCanEmptyPrefixes();

        foreach ($this->except(['_token']) as $settingKey => $settingValue) {
            if (!Str::contains($settingKey, '-model-key')) {
                continue;
            }

            $prefixKey = str_replace('-model-key', '', $settingKey);

            if (!in_array($settingValue, $canEmptyPrefixes)) {
                $rules[$prefixKey] = 'required|regex:/^[\pL\s\ \_\-0-9\/]+$/u';
            } else {
                $rules[$prefixKey] = 'nullable|regex:/^[\pL\s\ \_\-0-9\/]+$/u';
            }
        }

        return $rules;
    }

    /**
     * @return array
     */
    public function attributes()
    {
        $attributes = [];
        foreach (SlugHelper::supportedModels() as $model => $name) {
            $attributes[SlugHelper::getPermalinkSettingKey($model)] = trans('packages/slug::slug.prefix_for', ['name' => $name]);
        }

        return $attributes;
    }
}
