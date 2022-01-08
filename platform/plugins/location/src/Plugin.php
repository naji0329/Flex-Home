<?php

namespace Botble\Location;

use Illuminate\Support\Facades\Schema;
use Botble\PluginManagement\Abstracts\PluginOperationAbstract;

class Plugin extends PluginOperationAbstract
{
    public static function remove()
    {
        Schema::dropIfExists('cities');
        Schema::dropIfExists('states');
        Schema::dropIfExists('countries');
        Schema::dropIfExists('countries_translations');
        Schema::dropIfExists('states_translations');
        Schema::dropIfExists('cities_translations');
    }
}
