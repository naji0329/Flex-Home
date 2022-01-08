<?php

namespace Botble\Theme\Providers;

use File;
use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;
use Theme;

class RouteServiceProvider extends ServiceProvider
{
    /**
     * Move base routes to a service provider to make sure all filters & actions can hook to base routes
     */
    public function boot()
    {
        $this->app->booted(function () {

            $themeRoute = theme_path(Theme::getThemeName() . '/routes/web.php');
            if (File::exists($themeRoute)) {
                $this->loadRoutesFrom($themeRoute);
            }

            $this->loadRoutesFrom(package_path('theme/routes/web.php'));
        });
    }
}
