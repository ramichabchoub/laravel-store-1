<?php

namespace App\Notifications;

use App\Channels\CustomSms;
use App\Models\Order;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\BroadcastMessage;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use Illuminate\Notifications\Messages\NexmoMessage;

use NotificationChannels\Fcm\FcmChannel;
use NotificationChannels\Fcm\FcmMessage;
use NotificationChannels\Fcm\Resources\AndroidConfig;
use NotificationChannels\Fcm\Resources\AndroidFcmOptions;
use NotificationChannels\Fcm\Resources\AndroidNotification;
use NotificationChannels\Fcm\Resources\ApnsConfig;
use NotificationChannels\Fcm\Resources\ApnsFcmOptions;

class NewOrderCreatedNotification extends Notification
{
    use Queueable;

    protected $order;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(Order $order)
    {
        $this->order = $order;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        //return ['mail', 'database', 'broadcast', 'nexmo'];
        return [FcmChannel::class, CustomSms::class];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
                    ->subject('New Order')
                    ->greeting('Hello, ' . $notifiable->name)
                    ->line('A new order has beeen created.')
                    ->action('View order', url('/'))
                    ->line('Thank you for using our application!')
                    ->view('mails.invoice', [
                        'notifiable' => $notifiable,
                        'order' => $this->order,
                    ]);
    }

    public function toDatabase($notifiable)
    {
        return [
            'title' => 'New Order',
            'body' => 'A new order has beeen created.',
            'action' => url('/'),
            'icon' => '',
            'order_id' => $this->order->id,
        ];
    }

    public function toBroadcast($notifiable)
    {
        $message = new BroadcastMessage([
            'title' => 'New Order',
            'body' => 'A new order has beeen created.',
            'action' => url('/'),
            'icon' => '',
            'order_id' => $this->order->id,
        ]);

        return $message;
    }

    public function toNexmo($notifiable)
    {
        return (new NexmoMessage())->content('A new order has beeen created');
    }

    public function toFcm($notifiable)
    {
        return FcmMessage::create()
            ->setData([
                'order_id' => $this->order->id,
                'user' => $this->order->user->name,
            ])
            ->setNotification(\NotificationChannels\Fcm\Resources\Notification::create()
                ->setTitle('New Order')
                ->setBody('A new order has beeen created.')
                ->setImage('http://example.com/url-to-image-here.png'))
            ->setAndroid(
                AndroidConfig::create()
                    ->setFcmOptions(AndroidFcmOptions::create()->setAnalyticsLabel('analytics'))
                    ->setNotification(AndroidNotification::create()->setColor('#0A0A0A'))
            )->setApns(
                ApnsConfig::create()
                    ->setFcmOptions(ApnsFcmOptions::create()->setAnalyticsLabel('analytics_ios')));
    }

    public function toSms($notifiable)
    {
        return 'A new order has beeen created & sent to processing.';
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
