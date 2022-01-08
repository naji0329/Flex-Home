<?php

namespace Botble\LanguageAdvanced\Providers;

use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\LanguageAdvanced\Listeners\AddDefaultTranslations;
use Botble\LanguageAdvanced\Listeners\DeletedContentListener;
use Botble\LanguageAdvanced\Listeners\PriorityLanguageAdvancedPluginListener;
use Botble\PluginManagement\Events\ActivatedPluginEvent;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event listener mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        DeletedContentEvent::class  => [
            DeletedContentListener::class,
        ],
        CreatedContentEvent::class  => [
            AddDefaultTranslations::class,
        ],
        ActivatedPluginEvent::class => [
            PriorityLanguageAdvancedPluginListener::class,
        ],
    ];
}
