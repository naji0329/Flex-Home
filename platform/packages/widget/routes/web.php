<?php

Route::group(['namespace' => 'Botble\Widget\Http\Controllers', 'middleware' => ['web', 'core']], function () {
    Route::group(['prefix' => BaseHelper::getAdminPrefix(), 'middleware' => 'auth'], function () {
        Route::group(['prefix' => 'widgets'], function () {
            Route::get('load-widget', 'WidgetController@showWidget');

            Route::get('', [
                'as'   => 'widgets.index',
                'uses' => 'WidgetController@index',
            ]);

            Route::post('save-widgets-to-sidebar', [
                'as'         => 'widgets.save_widgets_sidebar',
                'uses'       => 'WidgetController@postSaveWidgetToSidebar',
                'permission' => 'widgets.index',
            ]);

            Route::delete('delete', [
                'as'         => 'widgets.destroy',
                'uses'       => 'WidgetController@postDelete',
                'permission' => 'widgets.index',
            ]);
        });
    });
});
