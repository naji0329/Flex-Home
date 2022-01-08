<?php

namespace Botble\Base\Supports;

use Exception;
use Illuminate\Support\Collection;

class BreadcrumbsGenerator
{
    /**
     * @var Collection
     */
    protected $breadcrumbs;

    /**
     * @var array
     */
    protected $callbacks = [];

    /**
     * @param array $callbacks
     * @param array $before
     * @param array $after
     * @param string $name
     * @param array $params
     * @return Collection
     * @throws Exception
     */
    public function generate(array $callbacks, array $before, array $after, string $name, array $params): Collection
    {
        $this->breadcrumbs = new Collection;
        $this->callbacks = $callbacks;

        foreach ($before as $callback) {
            $callback($this);
        }

        $this->call($name, $params);

        foreach ($after as $callback) {
            $callback($this);
        }

        return $this->breadcrumbs;
    }

    /**
     * @param string $name
     * @param array $params
     * @throws Exception
     */
    protected function call(string $name, array $params): void
    {
        if (!isset($this->callbacks[$name])) {
            throw new Exception($name);
        }

        $this->callbacks[$name]($this, ...$params);
    }

    /**
     * @param string $name
     * @param mixed ...$params
     * @throws Exception
     */
    public function parent(string $name, ...$params): void
    {
        $this->call($name, $params);
    }

    /**
     * @param string $title
     * @param string|null $url
     * @param array $data
     */
    public function push(string $title, string $url = null, array $data = []): void
    {
        $this->breadcrumbs->push((object)array_merge($data, compact('title', 'url')));
    }
}
