<?php

namespace Botble\LanguageAdvanced\Listeners;

use Botble\LanguageAdvanced\Plugin;
use Exception;

class PriorityLanguageAdvancedPluginListener
{

    /**
     * Handle the event.
     *
     * @return void
     */
    public function handle()
    {
        try {
            Plugin::activated();
        } catch (Exception $exception) {
            info($exception->getMessage());
        }
    }
}
