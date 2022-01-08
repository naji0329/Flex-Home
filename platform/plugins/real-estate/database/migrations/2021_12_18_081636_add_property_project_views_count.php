<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddPropertyProjectViewsCount extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (!Schema::hasColumn('re_properties', 'views')) {
            Schema::table('re_properties', function (Blueprint $table) {
                $table->integer('views')->unsigned()->default(0);
            });
        }

        if (!Schema::hasColumn('re_projects', 'views')) {
            Schema::table('re_projects', function (Blueprint $table) {
                $table->integer('views')->unsigned()->default(0);
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
        if (Schema::hasColumn('re_properties', 'views')) {
            Schema::table('re_properties', function (Blueprint $table) {
                $table->dropColumn('views');
            });
        }

        if (Schema::hasColumn('re_projects', 'views')) {
            Schema::table('re_projects', function (Blueprint $table) {
                $table->dropColumn('views');
            });
        }
    }
}
