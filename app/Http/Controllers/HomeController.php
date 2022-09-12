<?php

namespace App\Http\Controllers;

use App\Jobs\NewProductsEmail;
use App\Mail\NewProductsNewsletter;
use App\Models\Product;
use App\Models\User;
use App\Services\GeoIP\MaxMindGeoLite;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Mail;

class HomeController extends Controller
{
    public function index()
    {
        // $config = config('services.maxmind');
        // $geoip = new MaxMindGeoLite($config['account_id'], $config['license_key']);

        // $country = $geoip->country('213.244.80.165');

        $latest = Product::latest()->take(10)->get();
        return view('front.home', [
            'latest' => $latest,
        ]);
    }

    public function newsletter()
    {
        dispatch(new NewProductsEmail())
            ->onQueue('emails')
            ->delay(Carbon::now()->addMinutes(10));

        dispatch(new NewProductsEmail())->onQueue('emails');
    }
}
