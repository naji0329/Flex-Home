<?php

namespace Botble\Theme;

use File;
use Theme as ThemeFacade;

class Manager
{
    /**
     * @var array
     */
    protected $themes = [];

    /**
     * Manager constructor.
     */
    public function __construct()
    {
        $this->registerTheme(self::getAllThemes());
    }

    /**
     * @param string|array $theme
     * @return void
     */
    public function registerTheme($theme): void
    {
        if (!is_array($theme)) {
            $theme = [$theme];
        }

        $this->themes = array_merge_recursive($this->themes, $theme);
    }

    /**
     * @return array
     */
    public function getAllThemes(): array
    {
        $themes = [];
        $themePath = theme_path();
        foreach (scan_folder($themePath) as $folder) {
            $jsonFile = $themePath . '/' . $folder . '/theme.json';

            $publicJsonFile = public_path('themes/' . ThemeFacade::getPublicThemeName() . '/theme.json');

            if (File::exists($publicJsonFile)) {
                $jsonFile = $publicJsonFile;
            }

            $theme = get_file_data($jsonFile);
            if (!empty($theme)) {
                $themes[$folder] = $theme;
            }
        }

        return $themes;
    }

    /**
     * @return array
     */
    public function getThemes(): array
    {
        return $this->themes;
    }
}
