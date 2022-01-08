<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreateReCategoriesMultilevelTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (!Schema::hasColumn('re_categories', 'parent_id')) {
            Schema::table('re_categories', function (Blueprint $table) {
                $table->integer('parent_id')->unsigned()->default(0);
            });
        }

        if (!Schema::hasTable('re_property_categories')) {
            Schema::create('re_property_categories', function (Blueprint $table) {
                $table->id();
                $table->integer('property_id')->unsigned()->references('id')->on('re_properties')->onDelete('cascade');
                $table->integer('category_id')->unsigned()->references('id')->on('re_categories')->onDelete('cascade');
            });
        }

        if (!Schema::hasTable('re_project_categories')) {
            Schema::create('re_project_categories', function (Blueprint $table) {
                $table->id();
                $table->integer('project_id')->unsigned()->references('id')->on('re_projects')->onDelete('cascade');
                $table->integer('category_id')->unsigned()->references('id')->on('re_categories')->onDelete('cascade');
            });
        }

        $properties = DB::table('re_properties')->get();
        foreach ($properties as $property) {
            DB::table('re_property_categories')->insert([
                'property_id' => $property->id,
                'category_id' => $property->category_id,
            ]);
        }

        $projects = DB::table('re_projects')->get();
        foreach ($projects as $project) {
            DB::table('re_project_categories')->insert([
                'project_id'  => $project->id,
                'category_id' => $project->category_id,
            ]);
        }

        if (Schema::hasColumn('re_properties', 'category_id')) {
            Schema::table('re_properties', function (Blueprint $table) {
                $table->dropColumn('category_id');
            });
        }

        if (Schema::hasColumn('re_projects', 'category_id')) {
            Schema::table('re_projects', function (Blueprint $table) {
                $table->dropColumn('category_id');
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
        Schema::table('re_properties', function (Blueprint $table) {
            $table->integer('category_id')->unsigned()->nullable();
        });

        Schema::table('re_projects', function (Blueprint $table) {
            $table->integer('category_id')->unsigned()->nullable();
        });

        $propertyCategories = DB::table('re_property_categories')->get();
        foreach ($propertyCategories as $propertyCategory) {
            DB::table('re_properties')
                ->where('id', $propertyCategory->property_id)
                ->update([
                    'category_id' => $propertyCategory->category_id,
                ]);
        }

        $projectCategories = DB::table('re_project_categories')->get();
        foreach ($projectCategories as $projectCategory) {
            DB::table('re_projects')
                ->where('id', $projectCategory->project_id)
                ->update([
                    'category_id' => $projectCategory->category_id,
                ]);
        }

        Schema::dropIfExists('re_property_categories');
        Schema::dropIfExists('re_project_categories');
        Schema::table('re_categories', function (Blueprint $table) {
            $table->dropColumn('parent_id');
        });
    }
}
