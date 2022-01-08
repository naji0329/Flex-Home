<?php

use Botble\ACL\Models\User;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnAuthorIntoRePropertiesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('re_properties', function (Blueprint $table) {
            $table->integer('author_id')->nullable();
            $table->string('author_type', 255)->default(addslashes(User::class));
        });

        Schema::table('re_projects', function (Blueprint $table) {
            $table->integer('author_id')->nullable();
            $table->string('author_type', 255)->default(addslashes(User::class));
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
            $table->dropColumn(['author_id', 'author_type']);
        });

        Schema::table('re_projects', function (Blueprint $table) {
            $table->dropColumn(['author_id', 'author_type']);
        });
    }
}
