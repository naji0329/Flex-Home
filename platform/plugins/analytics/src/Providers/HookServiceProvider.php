<?php

namespace Botble\Analytics\Providers;

use Assets;
use Illuminate\Support\Facades\Auth;
use Botble\Dashboard\Supports\DashboardWidgetInstance;
use Illuminate\Support\Collection;
use Illuminate\Support\ServiceProvider;
use Throwable;

class HookServiceProvider extends ServiceProvider
{
    public function boot()
    {
        if (config('plugins.analytics.general.enabled_dashboard_widgets')) {
            add_action(DASHBOARD_ACTION_REGISTER_SCRIPTS, [$this, 'registerScripts'], 18);
            add_filter(DASHBOARD_FILTER_ADMIN_LIST, [$this, 'addGeneralWidget'], 18, 2);
            add_filter(DASHBOARD_FILTER_ADMIN_LIST, [$this, 'addPageWidget'], 19, 2);
            add_filter(DASHBOARD_FILTER_ADMIN_LIST, [$this, 'addBrowserWidget'], 20, 2);
            add_filter(DASHBOARD_FILTER_ADMIN_LIST, [$this, 'addReferrerWidget'], 22, 2);
            add_filter(BASE_FILTER_AFTER_SETTING_CONTENT, [$this, 'addAnalyticsSetting'], 99);
        }
    }

    /**
     * @return void
     */
    public function registerScripts()
    {
        if (Auth::user()->hasAnyPermission([
            'analytics.general',
            'analytics.page',
            'analytics.browser',
            'analytics.referrer',
        ])) {
            Assets::addScripts(['raphael', 'morris'])
                ->addStyles(['morris'])
                ->addStylesDirectly([
                    'vendor/core/plugins/analytics/libraries/jvectormap/jquery-jvectormap-1.2.2.css',
                ])
                ->addScriptsDirectly([
                    'vendor/core/plugins/analytics/libraries/jvectormap/jquery-jvectormap-1.2.2.min.js',
                    'vendor/core/plugins/analytics/libraries/jvectormap/jquery-jvectormap-world-mill-en.js',
                    'vendor/core/plugins/analytics/js/analytics.js',
                ]);
        }
    }

    /**
     * @param array $widgets
     * @param Collection $widgetSettings
     * @return array
     * @throws Throwable
     */
    public function addGeneralWidget($widgets, $widgetSettings)
    {
        return (new DashboardWidgetInstance)
            ->setPermission('analytics.general')
            ->setKey('widget_analytics_general')
            ->setTitle(trans('plugins/analytics::analytics.widget_analytics_general'))
            ->setIcon('fas fa-chart-line')
            ->setColor('#f2784b')
            ->setRoute(route('analytics.general'))
            ->setBodyClass('row')
            ->setHasLoadCallback(true)
            ->setIsEqualHeight(false)
            ->setSettings(['show_predefined_ranges' => true])
            ->init($widgets, $widgetSettings);
    }

    /**
     * @param array $widgets
     * @param Collection $widgetSettings
     * @return array
     * @throws Throwable
     */
    public function addPageWidget($widgets, $widgetSettings)
    {
        return (new DashboardWidgetInstance)
            ->setPermission('analytics.page')
            ->setKey('widget_analytics_page')
            ->setTitle(trans('plugins/analytics::analytics.widget_analytics_page'))
            ->setIcon('far fa-newspaper')
            ->setColor('#3598dc')
            ->setRoute(route('analytics.page'))
            ->setBodyClass('scroll-table')
            ->setColumn('col-md-6 col-sm-6')
            ->setSettings(['show_predefined_ranges' => true])
            ->init($widgets, $widgetSettings);
    }

    /**
     * @param array $widgets
     * @param Collection $widgetSettings
     * @return array
     * @throws Throwable
     */
    public function addBrowserWidget($widgets, $widgetSettings)
    {
        return (new DashboardWidgetInstance)
            ->setPermission('analytics.browser')
            ->setKey('widget_analytics_browser')
            ->setTitle(trans('plugins/analytics::analytics.widget_analytics_browser'))
            ->setIcon('fab fa-safari')
            ->setColor('#8e44ad')
            ->setRoute(route('analytics.browser'))
            ->setBodyClass('scroll-table')
            ->setColumn('col-md-6 col-sm-6')
            ->setSettings(['show_predefined_ranges' => true])
            ->init($widgets, $widgetSettings);
    }

    /**
     * @param array $widgets
     * @param Collection $widgetSettings
     * @return array
     * @throws Throwable
     */
    public function addReferrerWidget($widgets, $widgetSettings)
    {
        return (new DashboardWidgetInstance)
            ->setPermission('analytics.referrer')
            ->setKey('widget_analytics_referrer')
            ->setTitle(trans('plugins/analytics::analytics.widget_analytics_referrer'))
            ->setIcon('fas fa-user-friends')
            ->setColor('#3598dc')
            ->setRoute(route('analytics.referrer'))
            ->setBodyClass('scroll-table')
            ->setColumn('col-md-6 col-sm-6')
            ->setSettings(['show_predefined_ranges' => true])
            ->init($widgets, $widgetSettings);
    }

    /**
     * @param null|string $data
     * @return string
     * @throws Throwable
     */
    public function addAnalyticsSetting($data = null): string
    {
        return $data . view('plugins/analytics::setting')->render();
    }
}
