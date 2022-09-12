<?php

namespace App\View\Components;

use App\Models\Cart as CartModel;
use Illuminate\Support\Facades\App;
use Illuminate\View\Component;

class Cart extends Component
{
    public $cart;

    public $total;

    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->cart = CartModel::with('product')
            ->where('cart_id', App::make('cart.id'))
            ->get();

        $this->total = $this->cart->sum(function($item) {
            return $item->product->price * $item->quantity;
        });
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.cart');
    }
}
