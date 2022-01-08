<?php

namespace Botble\Base\Supports;

use Closure;
use Illuminate\Support\Arr;

abstract class ActionHookEvent
{

    /**
     * Holds the event listeners
     * @var array
     */
    protected $listeners = [];

    /**
     * Adds a listener
     * @param string $hook Hook name
     * @param mixed $callback Function to execute
     * @param integer $priority Priority of the action
     * @param integer $arguments Number of arguments to accept
     */
    public function addListener(string $hook, $callback, $priority = 20, $arguments = 1)
    {
        while (isset($this->listeners[$hook][$priority])) {
            $priority += 1;
        }

        $this->listeners[$hook][$priority] = compact('callback', 'arguments');
    }

    /**
     * @param string $hook
     * @return $this
     */
    public function removeListener(string $hook)
    {
        Arr::forget($this->listeners, $hook);

        return $this;
    }

    /**
     * Gets a sorted list of all listeners
     * @return array
     */
    public function getListeners()
    {
        foreach ($this->listeners as $listeners) {
            uksort($listeners, function ($param1, $param2) {
                return strnatcmp($param1, $param2);
            });
        }

        return $this->listeners;
    }

    /**
     * Gets the function
     * @param mixed $callback Callback
     * @return mixed A closure, an array if "class@method" or a string if "function_name"
     */
    protected function getFunction($callback)
    {
        if (is_string($callback)) {
            if (strpos($callback, '@')) {
                $callback = explode('@', $callback);
                return [app('\\' . $callback[0]), $callback[1]];
            }

            return $callback;
        } elseif ($callback instanceof Closure) {
            return $callback;
        } elseif (is_array($callback)) {
            return $callback;
        }

        return false;
    }

    /**
     * Fires a new action
     * @param string $action Name of action
     * @param array $args Arguments passed to the action
     */
    abstract public function fire($action, $args);
}
