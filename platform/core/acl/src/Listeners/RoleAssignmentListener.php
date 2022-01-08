<?php

namespace Botble\ACL\Listeners;

use Exception;
use Illuminate\Support\Facades\Auth;
use Botble\ACL\Events\RoleAssignmentEvent;

class RoleAssignmentListener
{

    /**
     * Handle the event.
     *
     * @param RoleAssignmentEvent $event
     * @return void
     *
     * @throws Exception
     */
    public function handle(RoleAssignmentEvent $event)
    {
        $permissions = $event->role->permissions;
        $permissions[ACL_ROLE_SUPER_USER] = $event->user->super_user;
        $permissions[ACL_ROLE_MANAGE_SUPERS] = $event->user->manage_supers;

        $event->user->permissions = $permissions;
        $event->user->save();

        cache()->forget(md5('cache-dashboard-menu-' . Auth::id()));
    }
}
