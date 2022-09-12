<?php

namespace App\Services\Payments;

use Illuminate\Support\Facades\Http;

class Thawani
{
    protected $secretKey;

    protected $publishableKey;

    protected $baseUrl = 'https://uatcheckout.thawani.om/api/v1';

    public function __construct($secretKey, $publishableKey, $apiKey)
    {
        $this->secretKey = $secretKey;
        $this->publishableKey = $publishableKey;
    }

    public function createPaymentIntent($data)
    {
        $response = Http::baseUrl($this->baseUrl)
            ->withHeaders([
                'thawani-api-key' => $this->publishableKey,
                'Content-Type' => 'application/json',
            ])
            //->withBody(json_encode($data), 'application/json')
            ->post('payment_intents', $data)
            ->json();

        return $response;
    }

    public function confirmPaymentIntent($id, $data)
    {
        $response = Http::baseUrl($this->baseUrl)
            ->withHeaders([
                'thawani-api-key' => $this->publishableKey,
                'Content-Type' => 'application/json',
            ])
            ->withBody(json_encode($data), 'application/json')
            ->post("payment_intents/$id/confirm")
            ->json();

        return $response;
    }

    public function cancelPaymentIntent($id)
    {
        $response = Http::baseUrl($this->baseUrl)
            ->withHeaders([
                'thawani-api-key' => $this->publishableKey,
                'Content-Type' => 'application/json',
            ])
            ->post("payment_intents/$id/cancel")
            ->json();

        return $response;
    }
}