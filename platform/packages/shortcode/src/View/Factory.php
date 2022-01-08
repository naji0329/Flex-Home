<?php

namespace Botble\Shortcode\View;

use Botble\Shortcode\Compilers\ShortcodeCompiler;
use Illuminate\Events\Dispatcher;
use Illuminate\View\Engines\EngineResolver;
use Illuminate\View\Factory as IlluminateViewFactory;
use Illuminate\View\ViewFinderInterface;

class Factory extends IlluminateViewFactory
{

    /**
     * Short code engine resolver
     *
     * @var ShortcodeCompiler
     */
    public $shortcode;

    /**
     * @var array
     */
    protected $aliases = [];

    /**
     * Factory constructor.
     * @param EngineResolver $engines
     * @param ViewFinderInterface $finder
     * @param Dispatcher $events
     * @param ShortcodeCompiler $shortcode
     * @since 2.1
     */
    public function __construct(
        EngineResolver $engines,
        ViewFinderInterface $finder,
        Dispatcher $events,
        ShortcodeCompiler $shortcode
    ) {
        parent::__construct($engines, $finder, $events);
        $this->shortcode = $shortcode;
    }

    /**
     * Get the evaluated view contents for the given view.
     *
     * @param string $view
     * @param array $data
     * @param array $mergeData
     * @return \Illuminate\Contracts\View\View|string|View
     * @since 2.1
     */
    public function make($view, $data = [], $mergeData = [])
    {
        if (isset($this->aliases[$view])) {
            $view = $this->aliases[$view];
        }

        $path = $this->finder->find($view);
        $data = array_merge($mergeData, $this->parseData($data));

        $this->callCreator($view = new View($this, $this->getEngineFromPath($path), $view, $path, $data,
            $this->shortcode));

        return $view;
    }
}
