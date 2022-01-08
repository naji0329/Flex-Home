<?php

namespace Botble\Base\Supports;

use Exception;
use Illuminate\Contracts\View\Factory as ViewFactory;
use Illuminate\Routing\Router;
use Illuminate\Support\Collection;
use Illuminate\Support\HtmlString;
use Illuminate\Support\Traits\Macroable;
use stdClass;

class BreadcrumbsManager
{
    use Macroable;

    /**
     * @var BreadcrumbsGenerator
     */
    protected $generator;

    /**
     * @var Router
     */
    protected $router;

    /**
     * @var ViewFactory
     */
    protected $viewFactory;

    /**
     * @var array
     */
    protected $callbacks = [];

    /**
     * @var array
     */
    protected $before = [];

    /**
     * @var array
     */
    protected $after = [];

    /**
     * @var array|null
     */
    protected $route;

    /**
     * BreadcrumbsManager constructor.
     * @param BreadcrumbsGenerator $generator
     * @param Router $router
     * @param ViewFactory $viewFactory
     */
    public function __construct(BreadcrumbsGenerator $generator, Router $router, ViewFactory $viewFactory)
    {
        $this->generator = $generator;
        $this->router = $router;
        $this->viewFactory = $viewFactory;
    }

    /**
     * @param string $name
     * @param callable $callback
     */
    public function register(string $name, callable $callback): void
    {
        $this->for($name, $callback);
    }

    /**
     * @param string $name
     * @param callable $callback
     */
    public function for(string $name, callable $callback): void
    {
        if (!isset($this->callbacks[$name])) {
            $this->callbacks[$name] = $callback;
        }
    }

    /**
     * @param callable $callback
     */
    public function before(callable $callback): void
    {
        $this->before[] = $callback;
    }

    /**
     * @param callable $callback
     */
    public function after(callable $callback): void
    {
        $this->after[] = $callback;
    }

    /**
     * @param string|null $name
     * @return bool
     */
    public function exists(string $name = null): bool
    {
        if (empty($name)) {
            try {
                [$name] = $this->getCurrentRoute();
            } catch (Exception $exception) {
                return false;
            }
        }

        return isset($this->callbacks[$name]);
    }

    /**
     * @return array|null
     * @throws Exception
     */
    protected function getCurrentRoute()
    {
        // Manually set route
        if ($this->route) {
            return $this->route;
        }

        // Determine the current route
        $route = $this->router->current();

        // No current route - must be the 404 page
        if ($route === null) {
            return ['errors.404', []];
        }

        // Convert route to name
        $name = $route->getName();

        if ($name === null) {
            throw new Exception($route);
        }

        $params = array_values($route->parameters());

        return [$name, $params];
    }

    /**
     * @param string|null $name
     * @param mixed ...$params
     * @return string
     * @throws Exception
     */
    public function render(string $name = null, ...$params): string
    {
        return $this->view('core/base::layouts.partials.breadcrumbs', $name, ...$params)->toHtml();
    }

    /**
     * @param string $view
     * @param string|null $name
     * @param mixed ...$params
     * @return HtmlString
     * @throws Exception
     */
    public function view(string $view, string $name = null, ...$params): HtmlString
    {
        $breadcrumbs = $this->generate($name, ...$params);

        $html = $this->viewFactory->make($view, compact('breadcrumbs'))->render();

        return new HtmlString($html);
    }

    /**
     * @param string|null $name
     * @param mixed ...$params
     * @return Collection
     * @throws Exception
     */
    public function generate(string $name = null, ...$params): Collection
    {
        // Route-bound breadcrumbs
        if ($name === null) {
            try {
                [$name, $params] = $this->getCurrentRoute();
            } catch (Exception $exception) {
                return new Collection;
            }
        }

        try {
            return $this->generator->generate($this->callbacks, $this->before, $this->after, $name, $params);
        } catch (Exception $exception) {
            return new Collection;
        }
    }

    /**
     * @return stdClass|null
     * @throws Exception
     */
    public function current(): ?stdClass
    {
        return $this->generate()->where('current', '!==', false)->last();
    }

    /**
     * @param string $name
     * @param mixed ...$params
     */
    public function setCurrentRoute(string $name, ...$params): void
    {
        $this->route = [$name, $params];
    }

    /**
     * @return void
     */
    public function clearCurrentRoute(): void
    {
        $this->route = null;
    }
}
