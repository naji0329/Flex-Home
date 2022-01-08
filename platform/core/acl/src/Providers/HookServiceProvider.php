<?php

namespace Botble\ACL\Providers;

use Botble\ACL\Repositories\Interfaces\UserInterface;
use Botble\Dashboard\Supports\DashboardWidgetInstance;
use Illuminate\Support\Collection;
use Illuminate\Support\ServiceProvider;
use Throwable;

class HookServiceProvider extends ServiceProvider
{
    public function boot()
    {
        add_filter(DASHBOARD_FILTER_ADMIN_LIST, [$this, 'addUserStatsWidget'], 12, 2);
    }

    /**
     * @param array $widgets
     * @param Collection $widgetSettings
     * @return array
     * @throws Throwable
     */
    public function addUserStatsWidget($widgets, $widgetSettings)
    {
        $users = $this->app->make(UserInterface::class)->count();

        return (new DashboardWidgetInstance)
            ->setType('stats')
            ->setPermission('users.index')
            ->setTitle(trans('core/acl::users.users'))
            ->setKey('widget_total_users')
            ->setIcon('fas fa-users')
            ->setColor('#3598dc')
            ->setStatsTotal($users)
            ->setRoute(route('users.index'))
            ->init($widgets, $widgetSettings);
    }
}
