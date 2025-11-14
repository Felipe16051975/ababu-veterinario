<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAnimaliaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Check if using SQLite to avoid MySQL-specific syntax issues
        if (config('database.default') === 'sqlite') {
            Schema::create('animalia', function (Blueprint $table) {
                $table->integer('tsn')->primary();
                $table->char('unit_ind1', 1)->nullable();
                $table->char('unit_name1', 35);
                $table->char('unit_ind2', 1)->nullable();
                $table->string('unit_name2', 35)->nullable();
                $table->string('unit_ind3', 7)->nullable();
                $table->string('unit_name3', 35)->nullable();
                $table->string('unit_ind4', 7)->nullable();
                $table->string('unit_name4', 35)->nullable();
                $table->char('unnamed_taxon_ind', 1)->nullable();
                $table->string('name_usage', 12);
                $table->string('unaccept_reason', 50)->nullable();
                $table->string('credibility_rtng', 40);
                $table->char('completeness_rtng', 10)->nullable();
                $table->char('currency_rating', 7)->nullable();
                $table->smallInteger('phylo_sort_seq')->nullable();
                $table->datetime('initial_time_stamp');
                $table->integer('parent_tsn')->nullable();
                $table->integer('taxon_author_id')->nullable();
                $table->integer('hybrid_author_id')->nullable();
                $table->smallInteger('kingdom_id');
                $table->smallInteger('rank_id');
                $table->date('update_date');
                $table->char('uncertain_prnt_ind', 3)->nullable();
                $table->text('n_usage')->nullable();
                $table->text('complete_name')->nullable();
                
                $table->index(['tsn', 'parent_tsn']);
                $table->index(['tsn', 'unit_name1', 'name_usage']);
                $table->index(['kingdom_id', 'rank_id']);
                $table->index(['tsn', 'taxon_author_id']);
            });
        } else {
            DB::unprepared(File::get(base_path() . '/database/schemas/Animalia.sql'));
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('animalia');
    }
}
