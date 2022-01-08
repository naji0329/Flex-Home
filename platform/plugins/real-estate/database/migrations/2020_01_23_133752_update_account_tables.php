<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateAccountTables extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('packages', function (Blueprint $table) {
            $table->dropColumn('number_of_days');
            $table->integer('percent_save')->unsigned()->default(0);
        });

        Schema::table('vendors', function (Blueprint $table) {
            $table->dropColumn(['package_id', 'package_start_date', 'package_end_date']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('packages', function (Blueprint $table) {
            $table->integer('number_of_days')->unsigned();
            $table->dropColumn('percent_save');
        });

        Schema::table('vendors', function (Blueprint $table) {
            $table->integer('package_id')->unsigned()->nullable();
            $table->dateTime('package_start_date')->nullable();
            $table->dateTime('package_end_date')->nullable();
        });
    }
}
