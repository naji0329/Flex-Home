<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateTableAccountActivityLogs extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('re_account_activity_logs', function (Blueprint $table) {
            $table->string('ip_address', 39)->nullable()->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('re_account_activity_logs', function (Blueprint $table) {
            $table->string('ip_address', 25)->nullable()->change();
        });
    }
}
