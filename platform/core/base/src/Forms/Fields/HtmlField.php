<?php

namespace Botble\Base\Forms\Fields;

use Kris\LaravelFormBuilder\Fields\FormField;

class HtmlField extends FormField
{
    /**
     * {@inheritDoc}
     */
    protected function getDefaults()
    {
        return [
            'html'       => '',
            'wrapper'    => false,
            'label_show' => false,
        ];
    }

    /**
     * {@inheritDoc}
     */
    public function getAllAttributes()
    {
        // No input allowed for html fields.
        return [];
    }

    /**
     * {@inheritDoc}
     */
    protected function getTemplate()
    {
        return 'core/base::forms.fields.html';
    }
}
