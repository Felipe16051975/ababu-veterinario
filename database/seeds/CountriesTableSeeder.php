<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class CountriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Instead of using complex SQL file, create basic countries
        DB::table('countries')->insert([
            ['id' => 'us', 'name' => 'United States', 'alpha_3' => 'usa', 'enabled' => 1],
            ['id' => 'gb', 'name' => 'United Kingdom', 'alpha_3' => 'gbr', 'enabled' => 1],
            ['id' => 'it', 'name' => 'Italy', 'alpha_3' => 'ita', 'enabled' => 1],
            ['id' => 'es', 'name' => 'Spain', 'alpha_3' => 'esp', 'enabled' => 1],
            ['id' => 'fr', 'name' => 'France', 'alpha_3' => 'fra', 'enabled' => 1],
            ['id' => 'de', 'name' => 'Germany', 'alpha_3' => 'deu', 'enabled' => 1],
        ]);
        $this->command->info('Countries table seeded with basic data!');
    }
}
