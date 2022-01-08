<?php

namespace Botble\Language\Providers;

use Botble\Language\Commands\RouteCacheCommand;
use Botble\Language\Commands\RouteClearCommand;
use Botble\Language\Commands\SyncOldDataCommand;
use Illuminate\Support\ServiceProvider;

class CommandServiceProvider extends ServiceProvider
{
    public function boot()
    {
        $this->commands([
            SyncOldDataCommand::class,
        ]);

        $this->app->extend('command.route.cache', function () {
            return new RouteCacheCommand($this->app['files']);
        });

        $this->app->extend('command.route.clear', function () {
            return new RouteClearCommand($this->app['files']);
        });
    }
}
