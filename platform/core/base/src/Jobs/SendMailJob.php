<?php

namespace Botble\Base\Jobs;

use Botble\Base\Supports\EmailAbstract;
use Exception;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Log;
use Mail;

class SendMailJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * @var string
     */
    public $content;

    /**
     * @var string
     */
    public $title;

    /**
     * @var string
     */
    public $to;

    /**
     * @var array
     */
    public $args;

    /**
     * @var boolean
     */
    public $debug = false;

    /**
     * SendMailJob constructor.
     * @param string $content
     * @param string $title
     * @param string $to
     * @param array $args
     * @param bool $debug
     */
    public function __construct($content, $title, $to, $args, $debug = false)
    {
        $this->content = $content;
        $this->title = $title;
        $this->to = $to;
        $this->args = $args;
        $this->debug = $debug;
    }

    /**
     * Handle the job.
     *
     * @return void
     * @throws Exception
     */
    public function handle()
    {
        try {
            Mail::to($this->to)->send(new EmailAbstract($this->content, $this->title, $this->args));
        } catch (Exception $exception) {
            if ($this->debug) {
                throw $exception;
            }
            Log::error($exception->getMessage());
        }
    }
}
