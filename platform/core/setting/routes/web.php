<?php

Route::group(['namespace' => 'Botble\Setting\Http\Controllers', 'middleware' => ['web', 'core']], function () {
    Route::group(['prefix' => BaseHelper::getAdminPrefix(), 'middleware' => 'auth'], function () {
        Route::group(['prefix' => 'settings'], function () {
            Route::get('general', [
                'as'         => 'settings.options',
                'uses'       => 'SettingController@getOptions',
                'permission' => 'settings.options',
            ]);

            Route::post('general/edit', [
                'as'         => 'settings.edit',
                'uses'       => 'SettingController@postEdit',
                'permission' => 'settings.options',
            ]);

            Route::get('media', [
                'as'   => 'settings.media',
                'uses' => 'SettingController@getMediaSetting',
            ]);

            Route::post('media', [
                'as'         => 'settings.media.post',
                'uses'       => 'SettingController@postEditMediaSetting',
                'permission' => 'settings.media',
                'middleware' => 'preventDemo',
            ]);

            Route::get('license/verify', [
                'as'         => 'settings.license.verify',
                'uses'       => 'SettingController@getVerifyLicense',
                'permission' => 'settings.options',
            ]);

            Route::post('license/activate', [
                'as'         => 'settings.license.activate',
                'uses'       => 'SettingController@activateLicense',
                'middleware' => 'preventDemo',
                'permission' => 'settings.options',
            ]);

            Route::post('license/deactivate', [
                'as'         => 'settings.license.deactivate',
                'uses'       => 'SettingController@deactivateLicense',
                'middleware' => 'preventDemo',
                'permission' => 'settings.options',
            ]);

            Route::post('license/reset', [
                'as'         => 'settings.license.reset',
                'uses'       => 'SettingController@resetLicense',
                'middleware' => 'preventDemo',
                'permission' => 'settings.options',
            ]);

            Route::group(['prefix' => 'email', 'permission' => 'settings.email'], function () {
                Route::get('', [
                    'as'   => 'settings.email',
                    'uses' => 'SettingController@getEmailConfig',
                ]);

                Route::post('edit', [
                    'as'   => 'settings.email.edit',
                    'uses' => 'SettingController@postEditEmailConfig',
                ]);

                Route::get('templates/edit/{type}/{name}/{template_file}', [
                    'as'   => 'setting.email.template.edit',
                    'uses' => 'SettingController@getEditEmailTemplate',
                ]);

                Route::post('template/edit', [
                    'as'   => 'setting.email.template.store',
                    'uses' => 'SettingController@postStoreEmailTemplate',
                ]);

                Route::post('template/reset-to-default', [
                    'as'   => 'setting.email.template.reset-to-default',
                    'uses' => 'SettingController@postResetToDefault',
                ]);

                Route::post('status', [
                    'as'   => 'setting.email.status.change',
                    'uses' => 'SettingController@postChangeEmailStatus',
                ]);

                Route::post('test/send', [
                    'as'   => 'setting.email.send.test',
                    'uses' => 'SettingController@postSendTestEmail',
                ]);
            });
        });
    });
});
