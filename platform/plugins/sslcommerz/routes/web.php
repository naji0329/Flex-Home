<?php

Route::group(['namespace' => 'Botble\SslCommerz\Http\Controllers', 'middleware' => ['core']], function () {
    Route::group(['prefix' => 'sslcommerz/payment'], function () {
        Route::post('/success', 'SslCommerzPaymentController@success');
        Route::post('/fail', 'SslCommerzPaymentController@fail');
        Route::post('/cancel', 'SslCommerzPaymentController@cancel');
        Route::post('/ipn', 'SslCommerzPaymentController@ipn');
    });
});
