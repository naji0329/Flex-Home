<?php

namespace Botble\ACL\Traits;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

trait LogoutGuardTrait
{

    /**
     * Check if a particular guard is active.
     *
     * @param $request
     * @param $guard
     * @return bool
     */
    public function isActiveGuard($request, $guard)
    {
        $name = Auth::guard($guard)->getName();
        return $this->sessionHas($request, $name) && $this->sessionGet($request,
                $name) === $this->getAuthIdentifier($guard);
    }

    /**
     * Check if the session has a particular key.
     *
     * @param Request $request
     * @param string $name
     * @return bool
     */
    public function sessionHas($request, $name)
    {
        return $request->session()->has($name);
    }

    /**
     * Get the specified key from the session.
     *
     * @param Request $request
     * @param string $name
     * @return mixed
     */
    public function sessionGet($request, $name)
    {
        return $request->session()->get($name);
    }

    /**
     * Get the Auth identifier for the specified guard.
     *
     * @param string $guard
     * @return mixed
     */
    public function getAuthIdentifier($guard)
    {
        return Auth::guard($guard)->id();
    }
}
