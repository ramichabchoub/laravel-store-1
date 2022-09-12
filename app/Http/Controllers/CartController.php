<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Product;
use App\Repositories\Cart\Cart as CartRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Str;


class CartController extends Controller
{
    
    public function index(CartRepository $cart)
    {
        return view('front.cart', [
            'cart' => $cart->all(),
            'total' => $cart->total(),
        ]);
    }

    public function store(Request $request, CartRepository $cart)
    {
        $request->validate([
            'product_id' => 'required|exists:products,id',
            'quantity' => 'int|min:1',
        ]);

        $product = Product::findOrFail( $request->product_id );
        $cart->add($request->product_id, $request->input('quantity', 1));

        if ($request->expectsJson()) {
            return [
                'message' => 'Product added to cart',
                'cart' => $cart->all(),
            ];
        }

        return redirect()->back()
            ->with('status', "Product {$product->name} added to cart.");
    }

    public function destroy(CartRepository $cart, $product_id)
    {
        $cart->remove($product_id);
        return redirect()->back()
            ->with('status', "Item removed from cart.");

    }
}
