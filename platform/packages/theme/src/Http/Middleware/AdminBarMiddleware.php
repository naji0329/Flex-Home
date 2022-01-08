<?php

namespace Botble\Theme\Http\Middleware;

use BaseHelper;
use Botble\Setting\Supports\SettingStore;
use Closure;
use Html;
use Illuminate\Contracts\Container\BindingResolutionException;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Throwable;

class AdminBarMiddleware
{
    /**
     * @var \Illuminate\Foundation\Application|mixed
     */
    protected $app;

    /**
     * @var SettingStore
     */
    protected $settingStore;

    /**
     * AdminBarMiddleware constructor.
     * @param Application $application
     * @param SettingStore $settingStore
     */
    public function __construct(Application $application, SettingStore $settingStore)
    {
        $this->app = $application;
        $this->settingStore = $settingStore;
    }

    /**
     * Handle an incoming request.
     *
     * @param Request $request
     * @param Closure $next
     * @return mixed
     * @throws Throwable
     */
    public function handle($request, Closure $next)
    {
        $response = $next($request);

        if (!BaseHelper::getAdminPrefix()) {
            return $response;
        }

        if ($request->user() && admin_bar()->isDisplay()) {
            if (!!(int)$this->settingStore->get('show_admin_bar', 1) && $response instanceof Response) {
                $this->modifyResponse($request, $response);
            }
        }

        return $response;
    }

    /**
     * Modify the response and inject the admin bar
     *
     * @param Request $request
     * @param Response $response
     * @return Response
     * @throws Throwable
     */
    public function modifyResponse(Request $request, Response $response)
    {
        if (is_in_admin()
            || $this->app->runningInConsole()
            || $this->isDebugbarRequest()
            || $request->expectsJson()
            || $response->headers->get('Content-Type') == 'application/json'
        ) {
            return $response;
        }

        $this->injectAdminBar($response);

        return $response;
    }

    /**
     * Check if this is a request to the Debugbar OpenHandler
     * @return bool
     * @throws BindingResolutionException
     */
    protected function isDebugbarRequest()
    {
        return $this->app->make('request')->segment(1) == '_debugbar';
    }

    /**
     * Injects the admin bar into the given Response.
     * @param Response $response
     * Based on https://github.com/symfony/WebProfilerBundle/blob/master/EventListener/WebDebugToolbarListener.php
     * @throws Throwable
     */
    public function injectAdminBar(Response $response)
    {
        $content = $response->getContent();

        $this->injectHeadContent($content)->injectAdminBarHtml($content);

        // Update the new content and reset the content length
        $response->setContent($content);
        $response->headers->remove('Content-Length');
    }

    /**
     * @param string $content
     * @return $this
     */
    public function injectHeadContent(&$content)
    {
        $css = Html::style('vendor/core/packages/theme/css/admin-bar.css');
        $pos = strripos($content, '</head>');
        if (false !== $pos) {
            $content = substr($content, 0, $pos) . $css . substr($content, $pos);
        } else {
            $content = $content . $css;
        }

        return $this;
    }

    /**
     * @param string $content
     * @return $this
     * @throws Throwable
     */
    public function injectAdminBarHtml(&$content)
    {
        $html = admin_bar()->render();
        $pos = strripos($content, '</body>');
        if (false !== $pos) {
            $content = substr($content, 0, $pos) . $html . substr($content, $pos);
        } else {
            $content = $content . $html;
        }

        return $this;
    }
}
