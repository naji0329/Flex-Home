<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class RealEstateCreateFacilityTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::dropIfExists('re_facilities');
        Schema::dropIfExists('re_facilities_distances');

        Schema::create('re_facilities', function (Blueprint $table) {
            $table->id();
            $table->string('name', 120);
            $table->string('icon', 60)->nullable();
            $table->string('status', 60)->default('published');
            $table->timestamps();
        });

        Schema::create('re_facilities_distances', function (Blueprint $table) {
            $table->id();
            $table->integer('facility_id')->unsigned();
            $table->integer('reference_id')->unsigned();
            $table->string('reference_type', 255);
            $table->float('distance')->unsigned()->default(0);
        });

        Schema::rename('currencies', 're_currencies');
        Schema::rename('consults', 're_consults');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('re_facilities');
        Schema::dropIfExists('re_facilities_distances');

        Schema::rename('re_currencies', 'currencies');
        Schema::rename('re_consults', 'consults');
    }
}
