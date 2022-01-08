<?php

namespace Botble\SslCommerz\Providers;

use Botble\Base\Supports\Helper;
use Botble\Base\Traits\LoadAndPublishDataTrait;
use Illuminate\Contracts\Filesystem\FileNotFoundException;
use Illuminate\Support\ServiceProvider;

class SslCommerzServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register()
    {
        Helper::autoload(__DIR__ . '/../../helpers');
    }

    /**
     * @throws FileNotFoundException
     */
    public function boot()
    {
        if (is_plugin_active('payment')) {
            $this->setNamespace('plugins/sslcommerz')
                ->loadAndPublishConfigurations(['sslcommerz'])
                ->loadRoutes(['web'])
                ->loadAndPublishViews()
                ->publishAssets();

            $this->app->register(HookServiceProvider::class);

            $this->app->make('config')->set([
                'plugins.sslcommerz.sslcommerz.apiCredentials.store_id' => get_payment_setting('store_id', SSLCOMMERZ_PAYMENT_METHOD_NAME),
                'plugins.sslcommerz.sslcommerz.apiCredentials.store_password' => get_payment_setting('store_password', SSLCOMMERZ_PAYMENT_METHOD_NAME),
                'plugins.sslcommerz.sslcommerz.connect_from_localhost' => get_payment_setting('mode', SSLCOMMERZ_PAYMENT_METHOD_NAME) == 0,
                'plugins.sslcommerz.sslcommerz.apiDomain' => get_payment_setting('mode', SSLCOMMERZ_PAYMENT_METHOD_NAME) == 0 ? 'https://sandbox.sslcommerz.com' : 'https://securepay.sslcommerz.com',
            ]);
        }
    }
}
