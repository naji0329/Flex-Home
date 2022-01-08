<?php

namespace Botble\RealEstate\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use RealEstateHelper;

class RedirectIfAccount
{
    /**
     * Handle an incoming request.
     *
     * @param Request $request
     * @param Closure $next
     * @param string|null $guard
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = 'account')
    {
        if (!RealEstateHelper::isRegisterEnabled()) {
            abort(404);
        }

        if (Auth::guard($guard)->check()) {
            return redirect(route('public.account.dashboard'));
        }

        return $next($request);
    }
}
