<?php

use Illuminate\Support\Arr;
use Botble\Base\Facades\ActionFacade as Action;
use Botble\Base\Facades\FilterFacade as Filter;

if (!function_exists('add_filter')) {
    /**
     * @param string$hook
     * @param $callback
     * @param int $priority
     * @param int $arguments
     */
    function add_filter($hook, $callback, $priority = 20, $arguments = 1)
    {
        Filter::addListener($hook, $callback, $priority, $arguments);
    }
}

if (!function_exists('remove_filter')) {
    /**
     * @param string $hook
     */
    function remove_filter($hook)
    {
        Filter::removeListener($hook);
    }
}

if (!function_exists('add_action')) {
    /**
     * @param string $hook
     * @param $callback
     * @param int $priority
     * @param int $arguments
     */
    function add_action(string $hook, $callback, int $priority = 20, int $arguments = 1)
    {
        Action::addListener($hook, $callback, $priority, $arguments);
    }
}

if (!function_exists('apply_filters')) {
    /**
     * @return mixed
     */
    function apply_filters()
    {
        $args = func_get_args();
        return Filter::fire(array_shift($args), $args);
    }
}

if (!function_exists('do_action')) {
    function do_action()
    {
        $args = func_get_args();
        Action::fire(array_shift($args), $args);
    }
}

if (!function_exists('get_hooks')) {
    /**
     * @param string|null $name
     * @param bool $isFilter
     * @return array
     */
    function get_hooks(?string $name = null, $isFilter = true): array
    {
        if ($isFilter == true) {
            $listeners = Filter::getListeners();
        } else {
            $listeners = Action::getListeners();
        }

        if (empty($name)) {
            return $listeners;
        }
        return Arr::get($listeners, $name, []);
    }
}
