<?php

namespace Botble\RealEstate\Notifications\API;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class ConfirmEmailNotification extends Notification implements ShouldQueue
{
    use Queueable;

    /**
     * @var string
     */
    protected $verifyToken;

    /**
     * ConfirmEmailNotification constructor.
     * @param $verifyToken
     */
    public function __construct($verifyToken)
    {
        $this->verifyToken = $verifyToken;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param mixed $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param mixed $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->view('plugins/real-estate::account.emails.confirm', [
                'link' => url('verify-email', [
                    'user'  => $notifiable->id,
                    'token' => $this->verifyToken,
                ]),
            ]);
    }
}
