<?php

namespace Botble\PluginManagement\Providers;

use Botble\Dashboard\Supports\DashboardWidgetInstance;
use Illuminate\Support\Collection;
use Illuminate\Support\ServiceProvider;
use Throwable;

class HookServiceProvider extends ServiceProvider
{
    public function boot()
    {
        add_filter(DASHBOARD_FILTER_ADMIN_LIST, [$this, 'addStatsWidgets'], 15, 2);
    }

    /**
     * @param array $widgets
     * @param Collection $widgetSettings
     * @return array
     * @throws Throwable
     */
    public function addStatsWidgets($widgets, $widgetSettings)
    {
        $plugins = count(scan_folder(plugin_path()));

        return (new DashboardWidgetInstance)
            ->setType('stats')
            ->setPermission('plugins.index')
            ->setTitle(trans('packages/plugin-management::plugin.plugins'))
            ->setKey('widget_total_plugins')
            ->setIcon('fa fa-plug')
            ->setColor('#8e44ad')
            ->setStatsTotal($plugins)
            ->setRoute(route('plugins.index'))
            ->init($widgets, $widgetSettings);
    }
}
