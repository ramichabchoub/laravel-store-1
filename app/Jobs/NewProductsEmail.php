<?php

namespace App\Jobs;

use App\Mail\NewProductsNewsletter;
use App\Models\Product;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;

class NewProductsEmail implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        $products = Product::whereDate('created_at', '>=', Carbon::now()->subDays(7))
            ->latest()
            ->limit(10)
            ->get();

        $users = User::where('type', '=', 'user')->get();

        Mail::to($users)->send(new NewProductsNewsletter($products));
        
    }
}
