<?php
Route::get('push', function(){
    //require __DIR__ . '/vendor/autoload.php';

      $options = array(
        'cluster' => 'ap1',
        'useTLS' => true
      );
      $pusher = new Pusher\Pusher(
        '629e61b22d8769aff09b',
        '456b1999eb55c0c25ca2',
        '1328301',
        $options
      );

      $data['message'] = 'hello world';
      $pusher->trigger('my-channel', 'my-event', $data);
})->name('comment.setting');
Route::group(['namespace' => 'Botble\Comment\Http\Controllers', 'middleware' => ['web', 'core']], function () {

    Route::group(['prefix' => BaseHelper::getAdminPrefix(), 'middleware' => 'auth'], function () {

        Route::group(['prefix' => 'comment-users', 'as' => 'comment-user.'], function () {
            Route::resource('', 'CommentUserController')->parameters(['' => 'comment-user']);
            Route::delete('items/destroy', [
                'as'         => 'deletes',
                'uses'       => 'CommentUserController@deletes',
                'permission' => 'comment-user.destroy',
            ]);
        });

        Route::group(['prefix' => 'comments', 'as' => 'comment.'], function () {
            Route::resource('', 'CommentController')->parameters(['' => 'comment']);
            Route::delete('items/destroy', [
                'as'         => 'deletes',
                'uses'       => 'CommentController@deletes',
                'permission' => 'comment.destroy',
            ]);

            Route::post('save/setting', [
                'as'         => 'storage-settings',
                'uses'       => 'CommentController@storeSettings',
                'permission' => 'setting.options',
            ]);

            // Updater

            Route::get('update/check', [
                'as'    => 'updater-check',
                'uses'  => 'UpdateController@checkVersion',
                'permission' => 'setting.options',
            ]);

            Route::post('update/download', [
                'as'    => 'updater-download',
                'uses'  => 'UpdateController@download',
                'permission' => 'setting.options',
            ]);
        });

        Route::get('comment/settings', 'CommentController@getSettings')->name('comment.setting');
    });

    Route::post('comments/login/current', 'CommentController@cloneUser')->name('comment.current-user');
});
