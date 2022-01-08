<?php

namespace Botble\ACL\Listeners;

use Exception;
use Illuminate\Support\Facades\Auth;
use Botble\ACL\Events\RoleUpdateEvent;

class RoleUpdateListener
{
    /**
     * Handle the event.
     *
     * @param RoleUpdateEvent $event
     * @return void
     *
     * @throws Exception
     */
    public function handle(RoleUpdateEvent $event)
    {
        $permissions = $event->role->permissions;
        foreach ($event->role->users()->get() as $user) {
            $permissions[ACL_ROLE_SUPER_USER] = $user->super_user;
            $permissions[ACL_ROLE_MANAGE_SUPERS] = $user->manage_supers;

            $user->permissions = $permissions;
            $user->save();
        }

        cache()->forget(md5('cache-dashboard-menu-' . Auth::id()));
    }
}
