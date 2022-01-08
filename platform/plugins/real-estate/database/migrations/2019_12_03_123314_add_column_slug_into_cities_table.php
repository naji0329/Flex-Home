<?php

use Botble\Location\Models\City;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnSlugIntoCitiesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('cities', function (Blueprint $table) {
            $table->string('slug', 120)->unique()->nullable();
            $table->tinyInteger('is_featured')->default(0);
            $table->string('image', 255)->nullable();
        });

        $cities = City::get();

        foreach ($cities as $city) {
            $city->slug = Str::slug($city->name);
            $city->save();
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('cities', function (Blueprint $table) {
            $table->dropColumn(['slug', 'is_featured', 'image']);
        });
    }
}
