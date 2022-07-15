<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('courses', function (Blueprint $table) {
            $table->id();
            $table->string('title')->nullable();
            $table->string('starting_date')->nullable();
            $table->string('ending_date')->nullable();
            $table->float('fee', 10, 2)->default(0);
            $table->text('short_description')->nullable();
            $table->text('long_description')->nullable();
            $table->text('image')->nullable();
            $table->tinyInteger('status')->default(1)->comment('1 => Active; 0 => Inactive');
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
        Schema::dropIfExists('courses');
    }
};
