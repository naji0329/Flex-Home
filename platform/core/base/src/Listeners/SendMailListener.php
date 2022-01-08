<?php

namespace Botble\Base\Listeners;

use Botble\Base\Events\SendMailEvent;
use Botble\Base\Supports\EmailAbstract;
use Exception;
use Illuminate\Contracts\Mail\Mailer;
use Log;

class SendMailListener
{

    /**
     * @var Mailer
     */
    protected $mailer;

    /**
     * SendMailListener constructor.
     * @param Mailer $mailer
     */
    public function __construct(Mailer $mailer)
    {
        $this->mailer = $mailer;
    }

    /**
     * Handle the event.
     *
     * @param SendMailEvent $event
     * @return void
     * @throws Exception
     */
    public function handle(SendMailEvent $event)
    {
        try {
            $this->mailer->to($event->to)->send(new EmailAbstract($event->content, $event->title, $event->args));
        } catch (Exception $exception) {
            if ($event->debug) {
                throw $exception;
            }
            Log::error($exception->getMessage());
        }
    }
}
