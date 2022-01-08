<?php

if (!function_exists('plugin_path')) {
    /**
     * @return string
     */
    function plugin_path($path = null)
    {
        return platform_path('plugins' . DIRECTORY_SEPARATOR . $path);
    }
}

if (!function_exists('is_plugin_active')) {
    /**
     * @param string $alias
     * @return bool
     * @throws \Illuminate\Contracts\Filesystem\FileNotFoundException
     */
    function is_plugin_active($alias)
    {
        if (!in_array($alias, get_active_plugins())) {
            return false;
        }

        $path = plugin_path($alias);

        return File::isDirectory($path) && File::exists($path . '/plugin.json');
    }
}

if (!function_exists('get_active_plugins')) {
    /**
     * @return array
     */
    function get_active_plugins()
    {
        try {
            return array_unique(json_decode(setting('activated_plugins', '[]'), true));
        } catch (Exception $exception) {
            return [];
        }
    }
}
