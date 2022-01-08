<?php

namespace Botble\Widget\Factories;

use Botble\Widget\AbstractWidget;
use Botble\Widget\Contracts\ApplicationWrapperContract;
use Botble\Widget\Misc\InvalidWidgetClassException;
use Botble\Widget\Misc\ViewExpressionTrait;
use Botble\Widget\WidgetId;
use Exception;
use Illuminate\Support\Str;

abstract class AbstractWidgetFactory
{
    use ViewExpressionTrait;

    /**
     * Widget object to work with.
     *
     * @var AbstractWidget
     */
    protected $widget;

    /**
     * Widget configuration array.
     *
     * @var array
     */
    protected $widgetConfig;

    /**
     * The name of the widget being called.
     *
     * @var string
     */
    public $widgetName;

    /**
     * Array of widget parameters excluding the first one (config).
     *
     * @var array
     */
    public $widgetParams;

    /**
     * Array of widget parameters including the first one (config).
     *
     * @var array
     */
    public $widgetFullParams;

    /**
     * Laravel application wrapper for better testability.
     *
     * @var ApplicationWrapperContract;
     */
    public $app;

    /**
     * The flag for not wrapping content in a special container.
     *
     * @var bool
     */
    public static $skipWidgetContainer = false;

    /**
     * Constructor.
     *
     * @param ApplicationWrapperContract $app
     */
    public function __construct(ApplicationWrapperContract $app)
    {
        $this->app = $app;
    }

    /**
     * Magic method that catches all widget calls.
     *
     * @param string $widgetName
     * @param array $params
     * @return mixed
     */
    public function __call($widgetName, array $params = [])
    {
        array_unshift($params, $widgetName);

        return call_user_func_array([$this, 'run'], $params);
    }

    /**
     * Set class properties and instantiate a widget object.
     *
     * @param array $params
     *
     * @throws InvalidWidgetClassException
     * @throws Exception
     */
    protected function instantiateWidget(array $params = [])
    {
        WidgetId::increment();

        $this->widgetName = $this->parseFullWidgetNameFromString(array_shift($params));
        $this->widgetFullParams = $params;
        $this->widgetConfig = (array)array_shift($params);
        $this->widgetParams = $params;

        $widgetClass = $this->widgetName;

        if (!class_exists($widgetClass, false)) {
            throw new Exception($widgetClass . ' is not exists');
        }

        if (!is_subclass_of($widgetClass, AbstractWidget::class)) {
            throw new InvalidWidgetClassException('Class "' . $widgetClass . '" must extend "' . AbstractWidget::class . '" class');
        }

        $this->widget = new $widgetClass($this->widgetConfig);
    }

    /**
     * Convert stuff like 'profile.feedWidget' to 'Profile\FeedWidget'.
     *
     * @param string $widgetName
     * @return string
     */
    protected function parseFullWidgetNameFromString($widgetName)
    {
        return Str::studly(str_replace('.', '\\', $widgetName));
    }
}
