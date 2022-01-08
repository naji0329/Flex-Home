<?php

namespace Botble\Widget\Widgets;

use Botble\Widget\AbstractWidget;
use Illuminate\Contracts\Filesystem\FileNotFoundException;

class Text extends AbstractWidget
{
    /**
     * The configuration array.
     *
     * @var array
     */
    protected $config = [];

    /**
     * @var string
     */
    protected $frontendTemplate = 'packages/widget::widgets.text.frontend';

    /**
     * @var string
     */
    protected $backendTemplate = 'packages/widget::widgets.text.backend';

    /**
     * @var bool
     */
    protected $isCore = true;

    /**
     * Text constructor.
     *
     * @throws FileNotFoundException
     */
    public function __construct()
    {
        parent::__construct([
            'name'        => trans('packages/widget::widget.widget_text'),
            'description' => trans('packages/widget::widget.widget_text_description'),
            'content'     => null,
        ]);
    }
}
