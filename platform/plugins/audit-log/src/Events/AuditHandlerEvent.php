<?php

namespace Botble\AuditLog\Events;

use Botble\Base\Events\Event;
use Illuminate\Support\Facades\Auth;
use Illuminate\Queue\SerializesModels;

class AuditHandlerEvent extends Event
{
    use SerializesModels;

    /**
     * @var string
     */
    public $module;

    /**
     * @var string
     */
    public $action;

    /**
     * @var string
     */
    public $referenceId;

    /**
     * @var string
     */
    public $referenceUser;

    /**
     * @var string
     */
    public $referenceName;

    /**
     * @var string
     */
    public $type;

    /**
     * AuditHandlerEvent constructor.
     * @param string $module
     * @param string $action
     * @param int $referenceId
     * @param null $referenceName
     * @param string $type
     * @param int $referenceUser
     */
    public function __construct($module, $action, $referenceId, $referenceName, $type, $referenceUser = 0)
    {
        if ($referenceUser === 0 && Auth::check()) {
            $referenceUser = Auth::id();
        }
        $this->module = $module;
        $this->action = $action;
        $this->referenceUser = $referenceUser;
        $this->referenceId = $referenceId;
        $this->referenceName = $referenceName;
        $this->type = $type;
    }
}
