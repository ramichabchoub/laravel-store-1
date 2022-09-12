<?php

namespace App\Providers;

use App\Repositories\Cart\Cart;
use App\Repositories\Cart\CartDatabaseRepository;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Str;

class CartServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind('cart.id', function() {
            $id = Cookie::get('cart_id');
            if (!$id) {
                $id = Str::uuid();
                Cookie::queue('cart_id', $id, 60 * 24 * 30);
            }
            return $id;
        });

        $this->app->bind(Cart::class, function() {
            return new CartDatabaseRepository();
        });
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
