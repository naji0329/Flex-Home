<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class VendorCreatePackageTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('packages', function (Blueprint $table) {
            $table->id();
            $table->string('name', 120);
            $table->double('price', 15, 2)->unsigned();
            $table->integer('currency_id')->unsigned();
            $table->integer('number_of_days')->unsigned();
            $table->integer('number_of_listings')->unsigned();
            $table->tinyInteger('order')->default(0);
            $table->tinyInteger('is_default')->unsigned()->default(0);
            $table->string('status', 60)->default('published');
            $table->timestamps();
        });

        Schema::table('vendors', function (Blueprint $table) {
            $table->integer('package_id')->unsigned()->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('vendors', function (Blueprint $table) {
            $table->dropColumn('package_id');
        });

        Schema::dropIfExists('packages');
    }
}
