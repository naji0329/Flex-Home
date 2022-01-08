<?php

namespace Botble\Base\Events;

use Eloquent;
use Illuminate\Http\Request;
use Illuminate\Queue\SerializesModels;
use stdClass;
use Illuminate\Database\Eloquent\Model;

class UpdatedContentEvent extends Event
{
    use SerializesModels;

    /**
     * @var string
     */
    public $screen;

    /**
     * @var Request
     */
    public $request;

    /**
     * @var Eloquent|false
     */
    public $data;

    /**
     * CreatedContentEvent constructor.
     *
     * @param string $screen
     * @param Request $request
     * @param Eloquent|false|stdClass $data
     */
    public function __construct($screen, $request, $data)
    {
        if ($screen instanceof Model) {
            $screen = $screen->getTable();
        }

        $this->screen = $screen;
        $this->request = $request;
        $this->data = $data;
    }
}
