<?php

namespace App\Http\Controllers;

use App\Actions\Fortify\CreateNewUser;
use App\Models\Cart;
use App\Models\Order;
use App\Models\User;
use App\Notifications\NewOrderCreatedNotification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Throwable;

class CheckoutController extends Controller
{
    //
    public function index()
    {

        User::find(1)->notify(new NewOrderCreatedNotification(new Order()));
        return;

        $cart = Cart::with('product')
            ->where('cart_id',App::make('cart.id'))
            ->get();

        $total = $cart->sum(function($item) {
            return $item->product->price * $item->quantity;
        });
        
        return view('front.checkout', [
            'cart' => $cart,
            'total' => $total,
        ]);
    }

    public function store(Request $request)
    {
        /*$request->validate([
            'first_name' => 'required',
        ]);*/

        $cart = Cart::with('product')
            ->where('cart_id',App::make('cart.id'))
            ->get();

        if ($cart->count() == 0) {
            return redirect('/');
        }

        $total = $cart->sum(function($item) {
            return $item->product->price * $item->quantity;
        });

        DB::beginTransaction();

        try {

            if ($request->post('register')) {
                $user = $this->createUser($request);
            }

            $request->merge([
                'user_id' => Auth::id(),
                'total' => $total,
            ]);

            $order = Order::create($request->all());

            foreach ($cart as $item) {
                $order->items()->create([
                    'product_id' => $item->product_id,
                    'quantity' => $item->quantity,
                    'price' => $item->product->price,
                ]);
            }

            //Cart::where('cart_id',App::make('cart.id'))->delete();

            DB::commit();

            $user = User::where('type', '=', 'admin')->first();
            $user->notify(new NewOrderCreatedNotification($order));

            return redirect('/')->with('status', 'Thank you! Your order has been placed!');

        } catch (Throwable $e) {
            DB::rollBack();
            return redirect()->back()
                ->with('error', $e->getMessage())
                ->withInput();
        }
    }

    protected function createUser(Request $request)
    {
        $data = [
            'name' => $request->fisrt_name . ' ' . $request->last_name,
            'password' => Str::random(8),
            'email' => $request->email,
            'terms' => 1,
        ];

        $creator = new CreateNewUser();
        $user = $creator->create($data);
        Auth::login($user);

        return $user;
    }
}
