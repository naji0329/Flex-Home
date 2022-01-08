<?php

use Botble\Location\Models\City;
use Botble\RealEstate\Models\Project;
use Botble\RealEstate\Models\Property;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnCityIdIntoTablePropertiesAndProjects extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('re_properties', function (Blueprint $table) {
            $table->integer('city_id')->unsigned()->nullable();
        });

        Schema::table('re_projects', function (Blueprint $table) {
            $table->integer('city_id')->unsigned()->nullable();
        });

        $projects = Project::get();

        foreach ($projects as $project) {
            $project->city_id = City::inRandomOrder()->value('id');
            $project->save();
        }

        $properties = Property::get();

        foreach ($properties as $property) {
            $property->city_id = City::inRandomOrder()->value('id');
            $property->save();
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('re_properties', function (Blueprint $table) {
            $table->dropColumn('city_id');
        });

        Schema::table('re_projects', function (Blueprint $table) {
            $table->dropColumn('city_id');
        });
    }
}
