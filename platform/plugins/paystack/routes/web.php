<?php

Route::group(['namespace' => 'Botble\Paystack\Http\Controllers', 'middleware' => ['web', 'core']], function () {
    Route::get('paystack/payment/callback', [
        'as'   => 'paystack.payment.callback',
        'uses' => 'PaystackController@getPaymentStatus',
    ]);
});
