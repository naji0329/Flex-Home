<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnUsernameIntoTableReAccounts extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('re_accounts', function (Blueprint $table) {
            $table->string('username', 60)->after('email')->unique()->nullable();
        });

        $accounts = DB::table('re_accounts')->get();

        foreach ($accounts as $account) {
            DB::table('re_accounts')
                ->where('id', $account->id)
                ->update(['username' => Str::slug($account->first_name . '-' . $account->last_name) . '-' . $account->id]);
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('re_accounts', function (Blueprint $table) {
            $table->dropColumn('username');
        });
    }
}
