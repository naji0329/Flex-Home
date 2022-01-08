<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\Schema;

class AddLatLongIntoRealEstateTables extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('re_projects', function($table) {
            $table->string('latitude', 25)->nullable();
            $table->string('longitude', 25)->nullable();
        });

        Schema::table('re_properties', function($table) {
            $table->string('latitude', 25)->nullable();
            $table->string('longitude', 25)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('re_projects', function($table) {
            $table->dropColumn(['latitude', 'longitude']);
        });

        Schema::table('re_properties', function($table) {
            $table->dropColumn(['latitude', 'longitude']);
        });
    }
}
