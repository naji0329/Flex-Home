<?php

namespace Botble\Base\Supports;

use Botble\Assets\Assets as BaseAssets;
use Botble\Assets\HtmlBuilder;
use File;
use Illuminate\Config\Repository;
use Illuminate\Support\Str;
use Throwable;

/**
 * @since 22/07/2015 11:23 PM
 */
class Assets extends BaseAssets
{
    /**
     * Assets constructor.
     *
     * @param Repository $config
     * @param HtmlBuilder $htmlBuilder
     */
    public function __construct(Repository $config, HtmlBuilder $htmlBuilder)
    {
        parent::__construct($config, $htmlBuilder);

        $this->config = $config->get('core.base.assets');

        $this->scripts = $this->config['scripts'];

        $this->styles = $this->config['styles'];
    }

    /**
     * @param array $config
     */
    public function setConfig(array $config)
    {
        $this->config = $config;
    }

    /**
     * Get all admin themes
     *
     * @return array
     */
    public function getThemes(): array
    {
        $themeFolder = '/vendor/core/core/base/css/themes';

        $themes = ['default' => $themeFolder . '/default.css'];

        if (!File::isDirectory(public_path($themeFolder))) {
            return $themes;
        }

        $files = File::files(public_path($themeFolder));

        if (empty($files)) {
            return $themes;
        }

        foreach ($files as $file) {
            $name = $themeFolder . '/' . basename($file);
            if (!Str::contains($file, '.css.map')) {
                $themes[basename($file, '.css')] = $name;
            }
        }

        if (empty($themes)) {
            $themes['default'] = $themeFolder . '/default.css';
        }

        return $themes;
    }

    /**
     * @deprecated since v5.13
     * @return array
     */
    public function getAdminLocales(): array
    {
        return Language::getAvailableLocales();
    }

    /**
     * @param array $lastStyles
     * @return string
     * @throws Throwable
     */
    public function renderHeader($lastStyles = [])
    {
        do_action(BASE_ACTION_ENQUEUE_SCRIPTS);

        return parent::renderHeader($lastStyles);
    }

    /**
     * @return string
     * @throws Throwable
     */
    public function renderFooter()
    {
        $bodyScripts = $this->getScripts(self::ASSETS_SCRIPT_POSITION_FOOTER);

        return view('assets::footer', compact('bodyScripts'))->render();
    }
}
