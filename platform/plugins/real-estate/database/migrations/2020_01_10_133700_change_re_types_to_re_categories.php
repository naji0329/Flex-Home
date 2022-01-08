<?php

use Botble\RealEstate\Models\Category;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChangeReTypesToReCategories extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::rename('re_types', 're_categories');

        Schema::table('re_properties', function (Blueprint $table) {
            $table->renameColumn('type_id', 'category_id');
        });

        Schema::table('re_projects', function (Blueprint $table) {
            $table->renameColumn('type_id', 'category_id');
        });

        if (Schema::hasTable('language_meta')) {
            DB::table('language_meta')->where('reference_type', 'Botble\RealEstate\Models\Type')
                ->update(['reference_type' => Category::class]);
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::rename('re_categories', 're_types');

        Schema::table('re_properties', function (Blueprint $table) {
            $table->renameColumn('category_id', 'type_id');
        });

        Schema::table('re_projects', function (Blueprint $table) {
            $table->renameColumn('category_id', 'type_id');
        });

        if (Schema::hasTable('language_meta')) {
            DB::table('language_meta')->where('reference_type', 'Botble\RealEstate\Models\Category')
                ->update(['reference_type' => 'Botble\RealEstate\Models\Type']);
        }
    }
}
