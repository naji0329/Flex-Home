<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCareersTranslationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (!Schema::hasTable('careers_translations')) {
            Schema::create('careers_translations', function (Blueprint $table) {
                $table->string('lang_code');
                $table->integer('careers_id');
                $table->string('name', 255)->nullable();
                $table->string('location', 255)->nullable();
                $table->string('salary', 255)->nullable();
                $table->longText('description')->nullable();

                $table->primary(['lang_code', 'careers_id'], 'careers_translations_primary');
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
        Schema::dropIfExists('careers_translations');
    }
}
