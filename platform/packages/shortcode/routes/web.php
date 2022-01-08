<?php

Route::group(['namespace' => 'Botble\Shortcode\Http\Controllers', 'middleware' => ['web', 'core']], function () {
    Route::group(['prefix' => BaseHelper::getAdminPrefix(), 'middleware' => 'auth'], function () {
        Route::group(['prefix' => 'short-codes'], function () {
            Route::get('ajax-get-admin-config/{key}', [
                'as'         => 'short-codes.ajax-get-admin-config',
                'uses'       => 'ShortcodeController@ajaxGetAdminConfig',
                'permission' => false,
            ]);
        });
    });
});
