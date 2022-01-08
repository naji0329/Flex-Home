<?php

namespace Botble\JsValidation\Providers;

use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\JsValidation\Javascript\ValidatorHandler;
use Botble\JsValidation\JsValidatorFactory;
use Botble\JsValidation\RemoteValidationMiddleware;
use Illuminate\Contracts\Http\Kernel;
use Illuminate\Support\ServiceProvider;

class JsValidationServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot()
    {
        $this->setNamespace('core/js-validation')
            ->loadAndPublishConfigurations(['js-validation'])
            ->loadAndPublishViews()
            ->publishAssets();

        $this->bootstrapValidator();

        if ($this->app['config']->get('core.js-validation.js-validation.disable_remote_validation') === false) {
            $this->app[Kernel::class]->pushMiddleware(RemoteValidationMiddleware::class);
        }
    }

    /**
     * Configure Laravel Validator.
     *
     * @return void
     */
    protected function bootstrapValidator()
    {
        $callback = function () {
            return true;
        };

        $this->app['validator']->extend(ValidatorHandler::JS_VALIDATION_DISABLE, $callback);
    }

    /**
     * Register the application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->singleton('js-validator', function ($app) {
            $config = $app['config']->get('core.js-validation.js-validation');

            return new JsValidatorFactory($app, $config);
        });
    }
}
