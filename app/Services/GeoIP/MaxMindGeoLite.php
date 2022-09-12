<?php

namespace App\Services\GeoIP;

use Illuminate\Support\Facades\Http;

class MaxMindGeoLite
{
    protected $baseUrl = 'https://geolite.info/geoip/v2.1';

    protected $account_id;
    protected $key;

    public function __construct($account_id, $key)
    {
        $this->account_id = $account_id;
        $this->key = $key;
    }

    public function country($ip)
    {
        $response = Http::baseUrl($this->baseUrl)
            ->withBasicAuth($this->account_id, $this->key)
            ->withHeaders([
                //'Authorization' => $this->getAuthorization(),
                'Accept' => 'application/json',
            ])
            ->get("country/{$ip}");

        return $response->json();
    }

    public function city($ip)
    {
        $response = Http::baseUrl($this->baseUrl)
            ->withBasicAuth($this->account_id, $this->key)
            ->withHeaders([
                //'Authorization' => $this->getAuthorization(),
                'Accept' => 'application/json',
            ])
            ->get("city/{$ip}");

        return $response->json();
    }

    protected function getAuthorization()
    {
        return 'Basic ' . base64_encode($this->account_id . ':' . $this->key);
    }
}