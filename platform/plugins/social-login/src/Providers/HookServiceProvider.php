<?php

namespace Botble\SocialLogin\Providers;

use Illuminate\Support\Arr;
use Illuminate\Support\ServiceProvider;
use SocialService;
use Theme;

class HookServiceProvider extends ServiceProvider
{
    public function boot()
    {
        if (SocialService::setting('enable')) {
            add_filter(BASE_FILTER_AFTER_LOGIN_OR_REGISTER_FORM, [$this, 'addLoginOptions'], 25, 2);
        }
    }

    /**
     * @param string $html
     * @param string $module
     * @return null|string
     * @throws \Throwable
     */
    public function addLoginOptions($html, string $module)
    {
        if (!SocialService::isSupportedModule($module)) {
            return $html;
        }

        if ($total = count(SocialService::supportedModules())) {
            $params = [];
            $data = collect(SocialService::supportedModules())->firstWhere('model', $module);

            if ($total > 1) {
                $params = ['guard' => $data['guard']];
            }

            if (Arr::get($data, 'use_css', true) && defined('THEME_OPTIONS_MODULE_SCREEN_NAME')) {
                Theme::asset()
                    ->usePath(false)
                    ->add('social-login-css', asset('vendor/core/plugins/social-login/css/social-login.css'), [], [],
                        '1.1.0');
            }

            $view = Arr::get($data, 'view', 'plugins/social-login::login-options');

            return $html . view($view, compact('params'))->render();
        }

        return $html;
    }
}
