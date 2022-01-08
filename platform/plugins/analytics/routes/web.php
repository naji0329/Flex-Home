<?php

Route::group(['namespace' => 'Botble\Analytics\Http\Controllers', 'middleware' => ['web', 'core']], function () {
    Route::group(['prefix' => BaseHelper::getAdminPrefix(), 'middleware' => 'auth'], function () {
        Route::group(['prefix' => 'analytics'], function () {
            Route::get('general', [
                'as'   => 'analytics.general',
                'uses' => 'AnalyticsController@getGeneral',
            ]);

            Route::get('page', [
                'as'   => 'analytics.page',
                'uses' => 'AnalyticsController@getTopVisitPages',
            ]);

            Route::get('browser', [
                'as'   => 'analytics.browser',
                'uses' => 'AnalyticsController@getTopBrowser',
            ]);

            Route::get('referrer', [
                'as'   => 'analytics.referrer',
                'uses' => 'AnalyticsController@getTopReferrer',
            ]);
        });
    });
});
