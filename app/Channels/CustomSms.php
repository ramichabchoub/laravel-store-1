<?php

namespace App\Channels;

use Exception;
use Illuminate\Notifications\Notification;
use Illuminate\Support\Facades\Http;

class CustomSms
{
    public function send($notifiable, Notification $notification)
    {
        $config = config('services.custom-sms');

        if (!method_exists($notifiable, 'routeNotificationForSms')) {
            throw new Exception('You must define method "routeNotificationForSms" in your notifiable model.');
        }
        $to = $notifiable->routeNotificationForSms($notification);
        if (!$to) {
            throw new Exception('Empty mobile number');
        }

        if (!method_exists($notification, 'toSms')) {
            throw new Exception('You must define method "toSms" in your notification class.');
        }
        $message = $notification->toSms($notifiable);

        $response = Http::baseUrl('http://www.nsms.ps')
            ->get('api.php', [
                'comm' => 'sendsms',
                'user' => $config['user'],
                'pass' => $config['pass'],
                'to' => $to,
                'messgae' => urlencode($message),
                'sender' => $config['sender'],
            ]);

        $result = $response->body();
        if ($result != 1) {
            throw new Exception($result);
        }
    }
}