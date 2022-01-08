<?php

use Illuminate\Database\Migrations\Migration;

class FixOldDataForReProperties extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
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
        //
    }
}
