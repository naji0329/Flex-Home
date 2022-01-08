<?php

namespace Botble\Widget\Factories;

use Botble\Widget\Misc\InvalidWidgetClassException;
use Exception;

class WidgetFactory extends AbstractWidgetFactory
{

    /**
     * @var array
     */
    protected $widgets = [];

    /**
     * @param string $widget
     * @return $this
     */
    public function registerWidget($widget)
    {
        $this->widgets[] = new $widget;

        return $this;
    }

    /**
     * @return array
     */
    public function getWidgets(): array
    {
        return $this->widgets;
    }

    /**
     * Run widget without magic method.
     *
     * @return mixed
     */
    public function run()
    {
        $args = func_get_args();

        try {
            $this->instantiateWidget($args);
        } catch (InvalidWidgetClassException $exception) {
            if (config('app.debug') == true) {
                return $exception->getMessage();
            }
            return null;
        } catch (Exception $exception) {
            if (config('app.debug') == true) {
                return $exception->getMessage();
            }
            return null;
        }

        return $this->convertToViewExpression($this->getContent());
    }

    /**
     * Make call and get return widget content.
     *
     * @return mixed
     */
    protected function getContent()
    {
        $content = $this->app->call([$this->widget, 'run'], $this->widgetParams);

        return is_object($content) ? $content->__toString() : $content;
    }
}
