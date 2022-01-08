<?php

namespace Botble\Widget\Contracts;

interface ApplicationWrapperContract
{
    /**
     * Wrapper around app()->call().
     *
     * @param string|array $method
     * @param array $params
     * @return mixed
     */
    public function call($method, $params = []);

    /**
     * Get the specified configuration value.
     *
     * @param string $key
     * @param mixed $default
     * @return mixed
     */
    public function config($key, $default = null);

    /**
     * Wrapper around app()->getNamespace().
     *
     * @return string
     */
    public function getNamespace();

    /**
     * Wrapper around app()->make().
     *
     * @param string $abstract
     * @param array $parameters
     * @return mixed
     */
    public function make($abstract, array $parameters = []);
}
