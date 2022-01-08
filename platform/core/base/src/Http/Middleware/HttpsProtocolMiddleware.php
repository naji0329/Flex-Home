<?php

namespace Botble\Base\Http\Middleware;

use Closure;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

class HttpsProtocolMiddleware
{

    /**
     * @param Request $request
     * @param Closure $next
     * @return RedirectResponse
     */
    public function handle($request, Closure $next)
    {
        if (!$request->secure() && config('core.base.general.enable_https_support', false)) {
            return redirect()->secure($request->getRequestUri());
        }

        return $next($request);
    }
}
