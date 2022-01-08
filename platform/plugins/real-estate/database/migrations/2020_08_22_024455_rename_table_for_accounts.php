<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class RenameTableForAccounts extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::rename('vendors', 're_accounts');
        Schema::rename('vendor_password_resets', 're_account_password_resets');
        Schema::rename('packages', 're_packages');
        Schema::rename('vendor_activity_logs', 're_account_activity_logs');
        Schema::rename('vendor_packages', 're_account_packages');

        Schema::disableForeignKeyConstraints();

        Schema::table('re_account_activity_logs', function (Blueprint $table) {
            $table->dropColumn('vendor_id');
            $table->integer('account_id')->unsigned();
        });

        Schema::table('re_account_packages', function (Blueprint $table) {
            $table->dropColumn('vendor_id');
            $table->integer('account_id')->unsigned();
        });

        DB::table('re_properties')
            ->where('author_type', 'Botble\Vendor\Models\Vendor')
            ->update(['author_type' => 'Botble\RealEstate\Models\Account']);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('re_account_activity_logs', function (Blueprint $table) {
            $table->dropColumn('account_id');
            $table->integer('vendor_id')->unsigned()->references('id')->on('vendors')->index();
        });

        Schema::table('re_account_packages', function (Blueprint $table) {
            $table->dropColumn('account_id');
            $table->integer('vendor_id')->unsigned();
        });

        Schema::rename('re_accounts', 'vendors');
        Schema::rename('re_account_password_resets', 'vendor_password_resets');
        Schema::rename('re_packages', 'packages');
        Schema::rename('re_account_activity_logs', 'vendor_activity_logs');
        Schema::rename('re_account_packages', 'vendor_packages');
    }
}
