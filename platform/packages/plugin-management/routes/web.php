<?php

Route::group(['namespace' => 'Botble\PluginManagement\Http\Controllers', 'middleware' => ['web', 'core']], function () {
    Route::group(['prefix' => BaseHelper::getAdminPrefix(), 'middleware' => 'auth'], function () {
        Route::group(['prefix' => 'plugins'], function () {
            Route::get('', [
                'as'   => 'plugins.index',
                'uses' => 'PluginManagementController@index',
            ]);

            Route::put('status', [
                'as'         => 'plugins.change.status',
                'uses'       => 'PluginManagementController@update',
                'middleware' => 'preventDemo',
                'permission' => 'plugins.index',
            ]);

            Route::delete('{plugin}', [
                'as'         => 'plugins.remove',
                'uses'       => 'PluginManagementController@destroy',
                'middleware' => 'preventDemo',
                'permission' => 'plugins.index',
            ]);
        });
    });
});
