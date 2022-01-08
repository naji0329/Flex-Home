<?php

namespace Botble\RealEstate\Forms\Fields;

use Botble\Base\Supports\Editor;
use Illuminate\Support\Arr;
use Kris\LaravelFormBuilder\Fields\FormField;

class CustomEditorField extends FormField
{

    /**
     * @return string
     */
    protected function getTemplate()
    {
        return 'plugins/real-estate::account.forms.fields.custom-editor';
    }

    /**
     * @param array $options
     * @param bool $showLabel
     * @param bool $showField
     * @param bool $showError
     * @return string
     */
    public function render(array $options = [], $showLabel = true, $showField = true, $showError = true)
    {
        (new Editor)->registerAssets();

        $options['attr'] = Arr::set($options['attr'], 'class', Arr::get($options['attr'], 'class') . 'form-control editor-' .
            setting('rich_editor', config('core.base.general.editor.primary')));

        return parent::render($options, $showLabel, $showField, $showError);
    }
}
