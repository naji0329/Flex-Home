<?php

namespace Botble\Theme\Commands\Traits;

trait ThemeTrait
{
    /**
     * Get root writable path.
     *
     * @param string|null $path
     * @param string|null $theme
     * @return string
     */
    protected function getPath($path = null, $theme = null)
    {
        $rootPath = theme_path();
        if ($this->option('path')) {
            $rootPath = $this->option('path');
        }

        if (!$theme) {
            $theme = $this->getTheme();
        }

        return rtrim($rootPath, '/') . '/' . rtrim(ltrim(strtolower($theme), '/'), '/') . '/' . $path;
    }

    /**
     * Get the theme name.
     *
     * @return string
     */
    protected function getTheme()
    {
        if ($this->hasArgument('name')) {
            return strtolower($this->argument('name'));
        }

        return strtolower($this->option('name'));
    }
}
