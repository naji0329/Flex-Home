<?php

Route::group([
    'prefix'     => 'api/v1',
    'namespace'  => 'Botble\RealEstate\Http\Controllers\API',
    'middleware' => ['api'],
], function () {

    Route::post('register', 'AuthenticationController@register');
    Route::post('login', 'AuthenticationController@login');

    Route::post('password/forgot', 'ForgotPasswordController@sendResetLinkEmail');

    Route::post('verify-account', 'VerificationController@verify');
    Route::post('resend-verify-account-email', 'VerificationController@resend');

    Route::group(['middleware' => ['auth:account-api']], function () {
        Route::get('logout', 'AuthenticationController@logout');
        Route::get('me', 'AccountController@getProfile');
        Route::put('me', 'AccountController@updateProfile');
        Route::post('update-avatar', 'AccountController@updateAvatar');
        Route::put('change-password', 'AccountController@updatePassword');
    });

});
