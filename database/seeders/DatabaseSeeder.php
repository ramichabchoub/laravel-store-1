<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\Product;
use App\Models\Store;
use App\Models\Tag;
use Illuminate\Database\Eloquent\Factories\Sequence;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(5)->create();
        
        //Store::factory(3)->create();
        //Tag::factory(20)->create();

        // Category::factory(10)
        //     ->has(
        //         Category::factory(4)
        //             ->has(Product::factory(10)->state(new Sequence(fn($se) => [
        //                 'store_id' => Store::inRandomOrder()->first()->id,
        //             ])), 
        //                 'products'
        //             ), 
        //         'children'
        //     )
        //     ->create();

        // Product::factory()->state(new Sequence(fn($se = null) => [
        //     'store_id' => Store::inRandomOrder()->first()->id,
        //     'category_id' => Category::inRandomOrder()->first()->id,
        // ]))->count(10)->create();

    }
}
