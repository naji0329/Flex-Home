<?php

namespace Botble\Slug\Forms\Fields;

use Assets;
use Kris\LaravelFormBuilder\Fields\FormField;

class PermalinkField extends FormField
{

    /**
     * {@inheritDoc}
     */
    protected function getTemplate()
    {
        Assets::addScriptsDirectly('vendor/core/packages/slug/js/slug.js')
            ->addStylesDirectly('vendor/core/packages/slug/css/slug.css');

        return 'packages/slug::forms.fields.permalink';
    }
}
