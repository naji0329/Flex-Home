<?php

namespace Botble\Base\Http\Middleware;

use Botble\Base\Supports\Language;
use Closure;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Http\Request;

class LocaleMiddleware
{

    /**
     * @var \Illuminate\Foundation\Application|mixed
     */
    protected $app;

    /**
     * LocaleMiddleware constructor.
     * @param Application $application
     */
    public function __construct(Application $application)
    {
        $this->app = $application;
    }

    /**
     * Handle an incoming request.
     *
     * @param Request $request
     * @param Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $this->app->setLocale(config('app.locale'));

        if (!$request->session()->has('site-locale')) {
            return $next($request);
        }

        $sessionLocale = $request->session()->get('site-locale');

        if (array_key_exists($sessionLocale, Language::getAvailableLocales()) && is_in_admin()) {
            $this->app->setLocale($sessionLocale);
            $request->setLocale($sessionLocale);
        }

        return $next($request);
    }
}
