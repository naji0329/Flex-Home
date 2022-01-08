<?php

use Botble\LanguageAdvanced\Plugin;
use Illuminate\Database\Migrations\Migration;

class FixPriorityLoadForLanguageAdvanced extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Plugin::activated();
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
