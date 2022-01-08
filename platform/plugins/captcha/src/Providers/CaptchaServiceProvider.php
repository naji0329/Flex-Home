<?php

namespace Botble\Captcha\Providers;

use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\Captcha\Captcha;
use Botble\Captcha\CaptchaV3;
use Botble\Captcha\Facades\CaptchaFacade;
use Illuminate\Foundation\AliasLoader;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\ServiceProvider;

class CaptchaServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    /**
     * Indicates if loading of the provider is deferred.
     *
     * @var bool
     */
    protected $defer = false;

    public function register()
    {
        config([
            'plugins.captcha.general.secret'     => setting('captcha_secret'),
            'plugins.captcha.general.site_key'   => setting('captcha_site_key'),
            'plugins.captcha.general.type'       => setting('captcha_type'),
        ]);

        $this->app->singleton('captcha', function ($app) {
            if (config('plugins.captcha.general.type') == 'v3') {
                return new CaptchaV3($app);
            }

            return new Captcha($app);
        });

        AliasLoader::getInstance()->alias('Captcha', CaptchaFacade::class);
    }

    /**
     * @throws \Illuminate\Contracts\Container\BindingResolutionException
     */
    public function boot()
    {
        $this->setNamespace('plugins/captcha')
            ->loadAndPublishConfigurations(['general'])
            ->loadAndPublishViews()
            ->loadAndPublishTranslations();

        $this->bootValidator();

        if (defined('THEME_MODULE_SCREEN_NAME') && setting('captcha_hide_badge')) {
            \Theme::asset()->writeStyle('hide-recaptcha-badge', '.grecaptcha-badge { visibility: hidden; }');
        }

        $this->app->booted(function () {
            $this->app->register(HookServiceProvider::class);
        });
    }

    /**
     * Create captcha validator rule
     */
    public function bootValidator()
    {
        $app = $this->app;

        /**
         * @var Validator $validator
         */
        $validator = $app['validator'];
        $validator->extend('captcha', function ($attribute, $value, $parameters) use ($app) {
            /**
             * @var Captcha $captcha
             */
            $captcha = $app['captcha'];
            /**
             * @var Request $request
             */
            $request = $app['request'];

            if (config('plugins.captcha.general.type') == 'v3') {
                if (empty($parameters)) {
                    $parameters = ['form', '0.6'];
                }
            } else {
                $parameters = $this->mapParameterToOptions($parameters);
            }

            return $captcha->verify($value, $request->getClientIp(), $parameters);
        });

        $validator->replacer('captcha', function ($message) {
            return $message === 'validation.captcha' ? trans('plugins/captcha::captcha.failed_validate') : $message;
        });

        if ($app->bound('form')) {
            $app['form']->macro('captcha', function ($attributes = []) use ($app) {
                return $app['captcha']->display($attributes, ['lang' => $app->getLocale()]);
            });
        }
    }

    /**
     * @param array $parameters
     * @return array
     */
    public function mapParameterToOptions($parameters = []): array
    {
        if (!is_array($parameters)) {
            return [];
        }
        $options = [];
        foreach ($parameters as $parameter) {
            $option = explode(':', $parameter);
            if (count($option) === 2) {
                Arr::set($options, $option[0], $option[1]);
            }
        }

        return $options;
    }

    /**
     * Get the services provided by the provider.
     *
     * @return array
     */
    public function provides()
    {
        return ['captcha'];
    }
}
