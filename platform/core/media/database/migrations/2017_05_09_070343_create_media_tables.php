<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateMediaTables extends Migration
{

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('media_folders', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id')->unsigned()->references('id')->on('users')->index();
            $table->string('name')->nullable();
            $table->string('slug')->nullable();
            $table->integer('parent_id')->default(0);
            $table->timestamps();
            $table->softDeletes();
        });

        Schema::create('media_files', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id')->unsigned()->references('id')->on('users')->index();
            $table->string('name', 255);
            $table->integer('folder_id')->default(0)->unsigned();
            $table->string('mime_type', 120);
            $table->integer('size');
            $table->string('url', 255);
            $table->text('options')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });

        Schema::create('media_settings', function (Blueprint $table) {
            $table->id();
            $table->string('key', 120);
            $table->text('value')->nullable();
            $table->integer('media_id')->nullable();
            $table->integer('user_id')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('media_folders');
        Schema::dropIfExists('media_files');
        Schema::dropIfExists('media_settings');
    }
}
