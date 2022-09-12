<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductsController extends Controller
{
    
    public function show($slug)
    {
        $product = Product::where('slug', $slug)->firstOrFail();
        return view('front.products.show', [
            'product' => $product,
        ]);
    }
}
