<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class NewProductsNewsletter extends Mailable
{
    use Queueable, SerializesModels;

    protected $products;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($products)
    {
        $this->products = $products;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $this->subject('Latest Listings');
        $this->from('newsletter@exampe.com', config('app.name'));
        
        return $this->view('mails.products-newsletter', [
            'products' => $this->products,
        ]);
    }
}
