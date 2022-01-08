<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBlogTranslations extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (!Schema::hasTable('posts_translations')) {
            Schema::create('posts_translations', function (Blueprint $table) {
                $table->string('lang_code');
                $table->integer('posts_id');
                $table->string('name', 255)->nullable();
                $table->string('description', 400)->nullable();
                $table->longText('content')->nullable();

                $table->primary(['lang_code', 'posts_id'], 'posts_translations_primary');
            });
        }

        if (!Schema::hasTable('categories_translations')) {
            Schema::create('categories_translations', function (Blueprint $table) {
                $table->string('lang_code');
                $table->integer('categories_id');
                $table->string('name', 255)->nullable();
                $table->string('description', 400)->nullable();

                $table->primary(['lang_code', 'categories_id'], 'categories_translations_primary');
            });
        }

        if (!Schema::hasTable('tags_translations')) {
            Schema::create('tags_translations', function (Blueprint $table) {
                $table->string('lang_code');
                $table->integer('tags_id');
                $table->string('name', 255)->nullable();
                $table->string('description', 400)->nullable();

                $table->primary(['lang_code', 'tags_id'], 'tags_translations_primary');
            });
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('posts_translations');
        Schema::dropIfExists('categories_translations');
        Schema::dropIfExists('tags_translations');
    }
}
