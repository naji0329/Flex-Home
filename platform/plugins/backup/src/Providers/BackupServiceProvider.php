<?php

namespace Botble\Backup\Providers;

use Botble\Base\Traits\LoadAndPublishDataTrait;
use Illuminate\Support\Facades\Event;
use Illuminate\Routing\Events\RouteMatched;
use Illuminate\Support\ServiceProvider;

class BackupServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function boot()
    {
        $this->setNamespace('plugins/backup')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['permissions', 'general'])
            ->loadRoutes(['web'])
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->publishAssets();

        $this->app->register(CommandServiceProvider::class);

        Event::listen(RouteMatched::class, function () {
            dashboard_menu()->registerItem([
                'id'          => 'cms-plugin-backup',
                'priority'    => 8,
                'parent_id'   => 'cms-core-platform-administration',
                'name'        => 'plugins/backup::backup.menu_name',
                'icon'        => null,
                'url'         => route('backups.index'),
                'permissions' => ['backups.index'],
            ]);
        });

        $this->app->booted(function () {
            $this->app->register(HookServiceProvider::class);
        });
    }
}
