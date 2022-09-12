<?php

namespace App\Http\Controllers\Admin;

use App\Models\Order;
use Barryvdh\DomPDF\Facade as PDF;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use ArPHP\I18N\Arabic;

class OrdersController extends Controller
{
    
    public function print(Order $order)
    {
        $ar = new Arabic();
        $pdf = PDF::loadView('admin.orders.invoice', [
            'order' => $order,
            'ar' => $ar,
        ]);

        return $pdf->stream();
    }
}
