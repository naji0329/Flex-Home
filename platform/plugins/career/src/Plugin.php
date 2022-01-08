<?php

namespace Botble\Career;

use Schema;
use Botble\PluginManagement\Abstracts\PluginOperationAbstract;

class Plugin extends PluginOperationAbstract
{
    public static function remove()
    {
        Schema::dropIfExists('careers');
        Schema::dropIfExists('careers_translations');
    }
}
