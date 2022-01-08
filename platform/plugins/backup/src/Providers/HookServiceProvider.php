<?php

namespace Botble\Backup\Providers;

use Illuminate\Support\ServiceProvider;

class HookServiceProvider extends ServiceProvider
{
    public function boot()
    {
        if (app()->environment('demo')) {
            add_filter(DASHBOARD_FILTER_ADMIN_NOTIFICATIONS, [$this, 'registerAdminAlert'], 5);
        }
    }

    /**
     * @param string $alert
     * @return string
     * @throws \Throwable
     */
    public function registerAdminAlert($alert): string
    {
        return $alert . view('plugins/backup::partials.admin-alert')->render();
    }
}
