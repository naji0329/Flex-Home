<?php

namespace Botble\Support\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class BaseMiddleware
{
    /**
     * @param Request $request
     * @param Closure $next
     * @return mixed
     */
    public function handle($request, $next)
    {
        return $next($request);
    }
}
