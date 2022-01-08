<?php

namespace Botble\Base\Supports;

use Illuminate\Routing\ResourceRegistrar;
use Illuminate\Routing\Route;

class CustomResourceRegistrar extends ResourceRegistrar
{
    /**
     * The default actions for a resourceful controller.
     *
     * @var array
     */
    protected $resourceDefaults = ['index', 'create', 'store', 'edit', 'update', 'destroy'];

    /**
     * Get the name for a given resource.
     *
     * @param string $resource
     * @param string $method
     * @param array $options
     * @return string
     */
    protected function getResourceRouteName($resource, $method, $options)
    {
        switch ($method) {
            case 'store':
                $method = 'create';
                break;
            case 'update':
                $method = 'edit';
                break;
        }

        return parent::getResourceRouteName($resource, $method, $options);
    }

    /**
     * Add the edit method for a resourceful route.
     *
     * @param string $name
     * @param string $base
     * @param string $controller
     * @param array $options
     * @return Route
     */
    protected function addResourceEdit($name, $base, $controller, $options)
    {
        $uri = $this->getResourceUri($name) . '/' . static::$verbs['edit'] . '/{' . $base . '}';

        $action = $this->getResourceAction($name, $controller, 'edit', $options);

        return $this->router->get($uri, $action);
    }

    /**
     * Add the update method for a resourceful route.
     *
     * @param string $name
     * @param string $base
     * @param string $controller
     * @param array $options
     * @return Route
     */
    protected function addResourceUpdate($name, $base, $controller, $options)
    {
        $uri = $this->getResourceUri($name) . '/' . static::$verbs['edit'] . '/{' . $base . '}';

        $action = $this->getResourceAction($name, $controller, 'update', $options);

        return $this->router->post($uri, $action)->name($name . '.update');
    }

    /**
     * Add the store method for a resourceful route.
     *
     * @param string $name
     * @param string $base
     * @param string $controller
     * @param array $options
     * @return Route
     */
    protected function addResourceStore($name, $base, $controller, $options)
    {
        $uri = $this->getResourceUri($name) . '/' . static::$verbs['create'];

        $action = $this->getResourceAction($name, $controller, 'store', $options);

        return $this->router->post($uri, $action)->name($name . '.store');
    }

    /**
     * Add the index method for a resourceful route.
     *
     * @param string $name
     * @param string $base
     * @param string $controller
     * @param array $options
     * @return \Illuminate\Routing\Route
     */
    protected function addResourceIndex($name, $base, $controller, $options)
    {
        $uri = $this->getResourceUri($name);

        unset($options['missing']);

        $action = $this->getResourceAction($name, $controller, 'index', $options);

        return $this->router->match(['GET', 'POST'], $uri, $action);
    }
}
