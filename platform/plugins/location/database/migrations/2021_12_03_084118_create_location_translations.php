<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLocationTranslations extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (!Schema::hasTable('countries_translations')) {
            Schema::create('countries_translations', function (Blueprint $table) {
                $table->string('lang_code');
                $table->integer('countries_id');
                $table->string('name', 120)->nullable();
                $table->string('nationality', 120)->nullable();

                $table->primary(['lang_code', 'countries_id'], 'countries_translations_primary');
            });
        }

        if (!Schema::hasTable('states_translations')) {
            Schema::create('states_translations', function (Blueprint $table) {
                $table->string('lang_code');
                $table->integer('states_id');
                $table->string('name', 120)->nullable();
                $table->string('abbreviation', 2)->nullable();

                $table->primary(['lang_code', 'states_id'], 'states_translations_primary');
            });
        }

        if (!Schema::hasTable('cities_translations')) {
            Schema::create('cities_translations', function (Blueprint $table) {
                $table->string('lang_code');
                $table->integer('cities_id');
                $table->string('name', 120)->nullable();

                $table->primary(['lang_code', 'cities_id'], 'cities_translations_primary');
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
        Schema::dropIfExists('countries_translations');
        Schema::dropIfExists('states_translations');
        Schema::dropIfExists('cities_translations');
    }
}
