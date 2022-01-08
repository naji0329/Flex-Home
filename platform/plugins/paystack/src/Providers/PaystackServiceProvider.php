<?php

namespace Botble\Paystack\Providers;

use Botble\Base\Traits\LoadAndPublishDataTrait;
use Illuminate\Contracts\Filesystem\FileNotFoundException;
use Illuminate\Support\ServiceProvider;

class PaystackServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    /**
     * @throws FileNotFoundException
     */
    public function boot()
    {
        if (is_plugin_active('payment')) {
            $this->setNamespace('plugins/paystack')
                ->loadHelpers()
                ->loadRoutes(['web'])
                ->loadAndPublishViews()
                ->publishAssets();

            $this->app->register(HookServiceProvider::class);

            $config = $this->app->make('config');

            $config->set([
                'paystack.publicKey'     => get_payment_setting('public', PAYSTACK_PAYMENT_METHOD_NAME),
                'paystack.secretKey'     => get_payment_setting('secret', PAYSTACK_PAYMENT_METHOD_NAME),
                'paystack.merchantEmail' => get_payment_setting('merchant_email', PAYSTACK_PAYMENT_METHOD_NAME),
                'paystack.paymentUrl'    => 'https://api.paystack.co',
            ]);
        }
    }
}
