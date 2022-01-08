<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePaymentTables extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('payments', function (Blueprint $table) {
            $table->id();
            $table->string('currency', 120);
            $table->integer('user_id')->default(0)->unsigned();
            $table->string('charge_id', 60)->nullable();
            $table->string('payment_channel', 60)->nullable();
            $table->string('description', 255)->nullable();
            $table->decimal('amount', 15, 2)->unsigned();
            $table->integer('order_id')->unsigned()->nullable();
            $table->string('status', 60)->default('pending')->nullable();
            $table->string('payment_type')->default('confirm')->nullable();
            $table->integer('customer_id')->unsigned()->nullable();
            $table->decimal('refunded_amount', 15)->unsigned()->nullable();
            $table->string('refund_note', 255)->nullable();
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
        Schema::dropIfExists('payments');
    }
}
