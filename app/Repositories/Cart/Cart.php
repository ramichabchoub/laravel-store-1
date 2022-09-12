<?php

namespace App\Repositories\Cart;

interface Cart
{
    function all();
    function add($product_id, $quantity = 1);
    function remove($product_id);
    function clear();
    function total();
}