<?php

namespace Botble\Payment\Providers;

use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\Payment\Enums\PaymentMethodEnum;
use Botble\Payment\Models\Payment;
use Botble\Payment\Services\Gateways\PayPalPaymentService;
use Botble\Payment\Services\Gateways\StripePaymentService;
use Illuminate\Support\Facades\Event;
use Illuminate\Routing\Events\RouteMatched;
use Illuminate\Support\ServiceProvider;
use Botble\Payment\Repositories\Caches\PaymentCacheDecorator;
use Botble\Payment\Repositories\Eloquent\PaymentRepository;
use Botble\Payment\Repositories\Interfaces\PaymentInterface;
use Laravel\Cashier\Cashier;

class PaymentServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register()
    {
        $this
            ->setNamespace('plugins/payment')
            ->loadHelpers();

        $this->app->singleton(PaymentInterface::class, function () {
            return new PaymentCacheDecorator(new PaymentRepository(new Payment));
        });

        if (class_exists('Laravel\Cashier\Cashier')) {
            Cashier::ignoreMigrations();
        }
    }

    public function boot()
    {
        $this
            ->loadAndPublishConfigurations(['payment', 'permissions'])
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->loadRoutes(['web'])
            ->loadMigrations()
            ->publishAssets();

        Event::listen(RouteMatched::class, function () {
            dashboard_menu()
                ->registerItem([
                    'id'          => 'cms-plugins-payments',
                    'priority'    => 800,
                    'parent_id'   => null,
                    'name'        => 'plugins/payment::payment.name',
                    'icon'        => 'fas fa-credit-card',
                    'url'         => route('payment.index'),
                    'permissions' => ['payment.index'],
                ])
                ->registerItem([
                    'id'          => 'cms-plugins-payments-all',
                    'priority'    => 0,
                    'parent_id'   => 'cms-plugins-payments',
                    'name'        => 'plugins/payment::payment.transactions',
                    'icon'        => null,
                    'url'         => route('payment.index'),
                    'permissions' => ['payment.index'],
                ])
                ->registerItem([
                    'id'          => 'cms-plugins-payment-methods',
                    'priority'    => 1,
                    'parent_id'   => 'cms-plugins-payments',
                    'name'        => 'plugins/payment::payment.payment_methods',
                    'icon'        => null,
                    'url'         => route('payments.methods'),
                    'permissions' => ['payments.methods'],
                ]);
        });

        add_shortcode('payment-form', __('Payment form'), __('Payment form'), function ($shortCode) {
            $data = [
                'name'        => $shortCode->name,
                'currency'    => $shortCode->currency,
                'amount'      => $shortCode->amount,
                'returnUrl'   => $shortCode->return_url,
                'callbackUrl' => $shortCode->callback_url,
            ];

            $view = 'plugins/payment::partials.form';

            if ($shortCode->view && view()->exists($shortCode->view)) {
                $view = $shortCode->view;
            }

            return view($view, $data);
        });

        shortcode()->setAdminConfig('payment-form', function ($attributes) {
            return view('plugins/payment::partials.payment-form-admin-config', compact('attributes'))->render();
        });

        add_shortcode('payment-info', __('Payment info'), __('Payment info'), function ($shortCode) {
            $payment = app(PaymentInterface::class)->getFirstBy(['charge_id' => $shortCode->charge_id]);

            if (!$payment) {
                return trans('plugins/payment::payment.payment_not_found');
            }

            $detail = null;

            switch ($payment->payment_channel) {
                case PaymentMethodEnum::PAYPAL:
                    $paymentDetail = (new PayPalPaymentService)->getPaymentDetails($payment->charge_id);
                    $detail = view('plugins/payment::paypal.detail', ['payment' => $paymentDetail])->render();
                    break;
                case PaymentMethodEnum::STRIPE:
                    $paymentDetail = (new StripePaymentService)->getPaymentDetails($payment->charge_id);
                    $detail = view('plugins/payment::stripe.detail', ['payment' => $paymentDetail])->render();
                    break;
                case PaymentMethodEnum::COD:
                case PaymentMethodEnum::BANK_TRANSFER:
                default:
                    break;
            }

            $detail = apply_filters(PAYMENT_FILTER_PAYMENT_INFO_DETAIL, $detail, $payment);

            $view = 'plugins/payment::partials.info';

            if ($shortCode->view && view()->exists($shortCode->view)) {
                $view = $shortCode->view;
            }

            return view($view, compact('payment', 'detail'));
        });

        shortcode()->setAdminConfig('payment-info', function ($attributes) {
            return view('plugins/payment::partials.payment-info-admin-config', compact('attributes'))->render();
        });

        add_filter(PAYMENT_FILTER_ADDITIONAL_PAYMENT_METHODS, function ($html, array $data) {
            $html .= view('plugins/payment::stripe.methods', $data)->render();
            $html .= view('plugins/payment::paypal.methods', $data)->render();

            return $html;
        }, 1, 2);
    }
}
