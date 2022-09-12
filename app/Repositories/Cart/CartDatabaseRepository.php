<?php

namespace App\Repositories\Cart;

use App\Models\Cart as CartModel;
use App\Models\Product;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Str;

class CartDatabaseRepository implements Cart
{
    protected $id;

    public function __construct()
    {
        $this->id = App::make('cart.id');
    }

    public function all()
    {
        return CartModel::with('product')
            ->where('cart_id', $this->id)
            ->get();
    }

    public function add($product_id, $quantity = 1)
    {
        $cart = CartModel::where([
            'cart_id' => $this->id,
            'product_id' => $product_id,
        ])->first();
        
        if ($cart) {
            $cart->increment('quantity', $quantity);
        } else {
            $cart = CartModel::create([
                'user_id' => Auth::id(),
                'cart_id' => $this->id,
                'product_id' => $product_id,
                'quantity' => $quantity,
            ]);
        }
    }

    public function remove($product_id)
    {
        CartModel::where([
            'cart_id' => $this->id,
            'product_id' => $product_id,
        ])->delete();
    }

    public function clear()
    {
        CartModel::where([
            'cart_id' => $this->id,
        ])->delete();
    }

    public function total()
    {
        return $this->all()->sum(function($item) {
            return $item->product->price * $item->quantity;
        });
    }
}