<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateContactsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::dropIfExists('contacts');
        Schema::dropIfExists('contact_replies');

        Schema::create('contacts', function (Blueprint $table) {
            $table->id();
            $table->string('name', 60);
            $table->string('email', 60);
            $table->string('phone', 60)->nullable();
            $table->string('address', 120)->nullable();
            $table->string('subject', 120)->nullable();
            $table->longText('content');
            $table->string('status', 60)->default('unread');
            $table->timestamps();
        });

        Schema::create('contact_replies', function (Blueprint $table) {
            $table->id();
            $table->longText('message');
            $table->integer('contact_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('contacts');
        Schema::dropIfExists('contact_replies');
    }
}
