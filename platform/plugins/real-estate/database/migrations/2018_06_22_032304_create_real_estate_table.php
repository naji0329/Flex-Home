<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateRealEstateTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        $this->down();

        Schema::create('re_projects', function (Blueprint $table) {
            $table->id();
            $table->string('name', 300);
            $table->string('description', 400)->nullable();
            $table->longText('content')->nullable();
            $table->string('images')->nullable();
            $table->string('location')->nullable();
            $table->integer('investor_id')->unsigned();
            $table->tinyInteger('number_block')->nullable();
            $table->smallInteger('number_floor')->nullable();
            $table->smallInteger('number_flat')->nullable();
            $table->boolean('is_featured')->default(0);
            $table->date('date_finish')->nullable();
            $table->date('date_sell')->nullable();
            $table->decimal('price_from', 15, 0)->nullable();
            $table->decimal('price_to', 15, 0)->nullable();
            $table->integer('currency_id')->unsigned()->nullable();
            $table->string('status', 60)->default('selling');
            $table->timestamps();
        });

        Schema::create('re_properties', function (Blueprint $table) {
            $table->id();
            $table->string('name', 300);
            $table->string('type', 20)->default('sale');
            $table->string('description', 400)->nullable();
            $table->longText('content')->nullable();
            $table->string('location')->nullable();
            $table->string('images')->nullable();
            $table->integer('project_id')->unsigned()->default(0);
            $table->tinyInteger('number_bedroom')->nullable();
            $table->tinyInteger('number_bathroom')->nullable();
            $table->tinyInteger('number_floor')->nullable();
            $table->integer('square')->nullable();
            $table->decimal('price', 15, 0)->nullable();
            $table->integer('currency_id')->unsigned()->nullable();
            $table->boolean('is_featured')->default(0);
            $table->string('status', 60)->default('selling');
            $table->timestamps();
        });

        Schema::create('re_features', function (Blueprint $table) {
            $table->id();
            $table->string('name', 120);
            $table->string('status', 60)->default('published');
        });

        Schema::create('re_property_features', function (Blueprint $table) {
            $table->integer('property_id')->unsigned();
            $table->integer('feature_id')->unsigned();
        });

        Schema::create('re_project_features', function (Blueprint $table) {
            $table->integer('project_id')->unsigned();
            $table->integer('feature_id')->unsigned();
        });

        Schema::create('re_investors', function (Blueprint $table) {
            $table->id();
            $table->string('name', 120);
            $table->string('status', 60)->default('published');
            $table->timestamps();
        });

        Schema::create('currencies', function (Blueprint $table) {
            $table->id();
            $table->string('title', 60);
            $table->string('symbol', 10);
            $table->tinyInteger('is_prefix_symbol')->unsigned()->default(0);
            $table->tinyInteger('decimals')->unsigned()->default(0);
            $table->integer('order')->default(0)->unsigned();
            $table->tinyInteger('is_default')->default(0);
            $table->double('exchange_rate')->default(1);
            $table->timestamps();
        });

        Schema::create('consults', function (Blueprint $table) {
            $table->id();
            $table->string('name', 120);
            $table->string('email', 60);
            $table->string('phone', 60);
            $table->integer('project_id')->unsigned()->nullable();
            $table->integer('property_id')->unsigned()->nullable();
            $table->longText('content')->nullable();
            $table->string('status', 60)->default('unread');
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
        Schema::disableForeignKeyConstraints();
        Schema::dropIfExists('re_investors');
        Schema::dropIfExists('re_projects');
        Schema::dropIfExists('re_properties');
        Schema::dropIfExists('re_features');
        Schema::dropIfExists('re_property_features');
        Schema::dropIfExists('re_project_features');
        Schema::dropIfExists('currencies');
        Schema::dropIfExists('consults');
    }
}
