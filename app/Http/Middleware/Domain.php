<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\URL;

class Domain
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        $store = $request->route('store', 'Default');

        App::instance('store', $store);

        URL::defaults([
            'store' => $store,
        ]);

        Route::current()->forgetParameter('store');

        return $next($request);
    }
}
