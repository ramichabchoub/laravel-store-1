<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\URL;

class SetAppLocale
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
        // $locale = Session::get('current-locale', App::getLocale());
        // if ($request->query('locale')) {
        //     $locale = $request->query('locale');
        //     Session::put('current-locale', $locale);
        // }

        $locale = $request->route('locale');
        URL::defaults([
            'locale' => $locale,
        ]);
        Route::current()->forgetParameter('locale');

        App::setLocale($locale);

        return $next($request);
    }
}
