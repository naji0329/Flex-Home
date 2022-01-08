<?php

namespace Botble\AuditLog\Listeners;

use Botble\ACL\Models\User;
use Botble\AuditLog\Models\AuditHistory;
use Illuminate\Auth\Events\Login;

class LoginListener
{

    /**
     * @var AuditHistory
     */
    public $auditHistory;

    /**
     * AuditHandlerListener constructor.
     * @param AuditHistory $auditHistory
     */
    public function __construct(AuditHistory $auditHistory)
    {
        $this->auditHistory = $auditHistory;
    }

    /**
     * Handle the event.
     *
     * @param Login $event
     * @return void
     */
    public function handle(Login $event)
    {
        /**
         * @var User $user
         */
        $user = $event->user;

        if ($user instanceof User) {
            $this->auditHistory->user_agent = request()->userAgent();
            $this->auditHistory->ip_address = request()->ip();
            $this->auditHistory->module = 'to the system';
            $this->auditHistory->action = 'logged in';
            $this->auditHistory->user_id = $user->id;
            $this->auditHistory->reference_user = 0;
            $this->auditHistory->reference_id = $user->id;
            $this->auditHistory->reference_name = $user->name;
            $this->auditHistory->type = 'info';

            $this->auditHistory->save();
        }
    }
}
