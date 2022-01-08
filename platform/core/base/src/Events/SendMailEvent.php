<?php

namespace Botble\Base\Events;

use Illuminate\Queue\SerializesModels;

class SendMailEvent extends Event
{
    use SerializesModels;

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
     * SendMailEvent constructor.
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
}
