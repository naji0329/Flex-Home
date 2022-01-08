<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class RealEstateCreateTypeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('re_types', function (Blueprint $table) {
            $table->id();
            $table->string('name', 120);
            $table->string('status', 60)->default('published');
            $table->integer('order')->default(0)->unsigned();
            $table->tinyInteger('is_default')->default(0);
            $table->timestamps();
        });

        Schema::table('re_properties', function (Blueprint $table) {
            $table->integer('type_id')->unsigned()->nullable();
        });

        Schema::table('re_projects', function (Blueprint $table) {
            $table->integer('type_id')->unsigned()->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('re_properties', function (Blueprint $table) {
            $table->dropColumn('type_id');
        });

        Schema::table('re_projects', function (Blueprint $table) {
            $table->dropColumn('type_id');
        });
        Schema::dropIfExists('re_types');
    }
}
