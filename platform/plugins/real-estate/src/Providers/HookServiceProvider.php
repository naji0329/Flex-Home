<?php

namespace Botble\RealEstate\Providers;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;
use Botble\Dashboard\Supports\DashboardWidgetInstance;
use Botble\Payment\Enums\PaymentMethodEnum;
use Botble\Payment\Enums\PaymentStatusEnum;
use Botble\Payment\Models\Payment;
use Botble\Payment\Supports\PaymentHelper;
use Botble\RealEstate\Enums\ConsultStatusEnum;
use Botble\RealEstate\Enums\ModerationStatusEnum;
use Botble\RealEstate\Enums\PropertyStatusEnum;
use Botble\RealEstate\Models\Account;
use Botble\RealEstate\Models\Category;
use Botble\RealEstate\Repositories\Interfaces\AccountInterface;
use Botble\RealEstate\Repositories\Interfaces\ConsultInterface;
use Botble\RealEstate\Repositories\Interfaces\PackageInterface;
use Botble\RealEstate\Repositories\Interfaces\PropertyInterface;
use Botble\RealEstate\Repositories\Interfaces\TransactionInterface;
use Form;
use Html;
use Illuminate\Contracts\Container\BindingResolutionException;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\ServiceProvider;
use Menu;
use MetaBox;
use Route;
use Throwable;

class HookServiceProvider extends ServiceProvider
{
    /**
     * @throws Throwable
     */
    public function boot()
    {
        add_filter(BASE_FILTER_TOP_HEADER_LAYOUT, [$this, 'registerTopHeaderNotification'], 130);
        add_filter(BASE_FILTER_APPEND_MENU_NAME, [$this, 'getUnReadCount'], 130, 2);
        add_filter(BASE_FILTER_MENU_ITEMS_COUNT, [$this, 'getMenuItemCount'], 130);

        add_filter(IS_IN_ADMIN_FILTER, [$this, 'setInAdmin']);

        if (defined('MENU_ACTION_SIDEBAR_OPTIONS')) {
            Menu::addMenuOptionModel(Category::class);
            add_action(MENU_ACTION_SIDEBAR_OPTIONS, [$this, 'registerMenuOptions'], 13);
        }

        $this->app->booted(function () {
            if (defined('PAYMENT_FILTER_PAYMENT_PARAMETERS')) {
                add_filter(PAYMENT_FILTER_PAYMENT_PARAMETERS, function ($html) {
                    if (!auth('account')->check()) {
                        return $html;
                    }

                    return $html . Form::hidden('customer_id', auth('account')->id())->toHtml() .
                        Form::hidden('customer_type', Account::class)->toHtml();
                }, 123);
            }

            if (defined('PAYMENT_ACTION_PAYMENT_PROCESSED')) {
                add_action(PAYMENT_ACTION_PAYMENT_PROCESSED, function ($data) {
                    $payment = PaymentHelper::storeLocalPayment($data);

                    MetaBox::saveMetaBoxData($payment, 'subscribed_packaged_id', session('subscribed_packaged_id'));
                }, 123);

                add_action(BASE_ACTION_META_BOXES, function ($context, $payment) {
                    if (get_class($payment) == Payment::class && $context == 'advanced' && Route::currentRouteName() == 'payments.show') {
                        MetaBox::addMetaBox('additional_payment_data', __('Package information'), function () use ($payment) {

                            $subscribedPackageId = MetaBox::getMetaData($payment, 'subscribed_packaged_id', true);

                            $package = app(PackageInterface::class)->findById($subscribedPackageId);

                            if (!$package) {
                                return null;
                            }

                            return view('plugins/real-estate::partials.payment-extras', compact('package'));
                        }, get_class($payment), $context);
                    }
                }, 128, 2);
            }

            if (defined('ACTION_AFTER_UPDATE_PAYMENT')) {
                add_action(ACTION_AFTER_UPDATE_PAYMENT, function ($request, $payment) {
                    if (in_array($payment->payment_channel, [PaymentMethodEnum::COD, PaymentMethodEnum::BANK_TRANSFER])
                        && $request->input('status') == PaymentStatusEnum::COMPLETED
                        && $payment->status == PaymentStatusEnum::PENDING
                    ) {
                        $subscribedPackageId = MetaBox::getMetaData($payment, 'subscribed_packaged_id', true);

                        if (!$subscribedPackageId) {
                            return false;
                        }

                        $package = app(PackageInterface::class)->findById($subscribedPackageId);

                        if (!$package) {
                            return false;
                        }

                        $account = app(AccountInterface::class)->findById($payment->customer_id);

                        if (!$account) {
                            return false;
                        }

                        $account->credits += $package->number_of_listings;
                        $account->save();

                        $account->packages()->attach($package);

                        app(TransactionInterface::class)->createOrUpdate([
                            'user_id'    => 0,
                            'account_id' => $payment->customer_id,
                            'credits'    => $package->number_of_listings,
                            'payment_id' => $payment ? $payment->id : null,
                        ]);
                    }
                }, 123, 2);
            }

            add_filter(DASHBOARD_FILTER_ADMIN_LIST, function ($widgets) {
                foreach ($widgets as $key => $widget) {
                    if (in_array($key, [
                            'widget_total_themes',
                            'widget_total_users',
                            'widget_total_plugins',
                            'widget_total_pages',
                        ]) && $widget['type'] == 'stats') {
                        Arr::forget($widgets, $key);
                    }
                }

                return $widgets;
            }, 150);

            add_filter(DASHBOARD_FILTER_ADMIN_LIST, function ($widgets, $widgetSettings) {
                $items = app(PropertyInterface::class)
                    ->getModel()
                    ->notExpired()
                    ->where('status','!=', PropertyStatusEnum::NOT_AVAILABLE)
                    ->where('moderation_status', ModerationStatusEnum::APPROVED)
                    ->count();

                return (new DashboardWidgetInstance)
                    ->setType('stats')
                    ->setPermission('property.index')
                    ->setTitle(trans('plugins/real-estate::property.active_properties'))
                    ->setKey('widget_total_1')
                    ->setIcon('fas fa-briefcase')
                    ->setColor('#8e44ad')
                    ->setStatsTotal($items)
                    ->setRoute(route('property.index'))
                    ->init($widgets, $widgetSettings);
            }, 2, 2);

            add_filter(DASHBOARD_FILTER_ADMIN_LIST, function ($widgets, $widgetSettings) {
                $items = app(PropertyInterface::class)
                    ->getModel()
                    ->notExpired()
                    ->where('moderation_status', ModerationStatusEnum::PENDING)
                    ->count();

                return (new DashboardWidgetInstance)
                    ->setType('stats')
                    ->setPermission('property.index')
                    ->setTitle(trans('plugins/real-estate::property.pending_properties'))
                    ->setKey('widget_total_2')
                    ->setIcon('fas fa-briefcase')
                    ->setColor('#32c5d2')
                    ->setStatsTotal($items)
                    ->setRoute(route('property.index'))
                    ->init($widgets, $widgetSettings);
            }, 3, 2);

            add_filter(DASHBOARD_FILTER_ADMIN_LIST, function ($widgets, $widgetSettings) {
                $items = app(PropertyInterface::class)
                    ->getModel()
                    ->expired()
                    ->count();

                return (new DashboardWidgetInstance)
                    ->setType('stats')
                    ->setPermission('property.index')
                    ->setTitle(trans('plugins/real-estate::property.expired_properties'))
                    ->setKey('widget_total_3')
                    ->setIcon('fas fa-briefcase')
                    ->setColor('#e7505a')
                    ->setStatsTotal($items)
                    ->setRoute(route('property.index'))
                    ->init($widgets, $widgetSettings);
            }, 4, 2);

            add_filter(DASHBOARD_FILTER_ADMIN_LIST, function ($widgets, $widgetSettings) {
                $items = app(AccountInterface::class)->count();

                return (new DashboardWidgetInstance)
                    ->setType('stats')
                    ->setPermission('account.index')
                    ->setTitle(trans('plugins/real-estate::account.agents'))
                    ->setKey('widget_total_4')
                    ->setIcon('fas fa-users')
                    ->setColor('#3598dc')
                    ->setStatsTotal($items)
                    ->setRoute(route('account.index'))
                    ->init($widgets, $widgetSettings);
            }, 5, 2);
        });

        if (defined('LANGUAGE_MODULE_SCREEN_NAME')) {
            add_action(BASE_ACTION_META_BOXES, [$this, 'addLanguageChooser'], 55, 2);
        }

        add_filter('social_login_before_saving_account', function ($data, $oAuth, $providerData) {
            if (Arr::get($providerData, 'model') == Account::class && Arr::get($providerData, 'guard') == 'account') {
                $firstName = implode(' ', explode(' ', $oAuth->getName(), -1));
                Arr::forget($data, 'name');
                $data = array_merge($data, [
                    'first_name' => $firstName,
                    'last_name'  => trim(str_replace($firstName, '', $oAuth->getName())),
                ]);
            }
            return $data;
        }, 49, 3);
    }

    /**
     * @return bool
     */
    public function setInAdmin($isInAdmin): bool
    {
        return request()->segment(1) === 'account' || $isInAdmin;
    }

    /**
     * @param string $options
     * @return string
     *
     * @throws Throwable
     */
    public function registerTopHeaderNotification($options)
    {
        if (Auth::user()->hasPermission('consults.edit')) {
            $consults = $this->app->make(ConsultInterface::class)
                ->advancedGet([
                    'condition' => [
                        'status' => ConsultStatusEnum::UNREAD,
                    ],
                    'paginate'  => [
                        'per_page'      => 10,
                        'current_paged' => 1,
                    ],
                    'select'    => ['id', 'name', 'email', 'phone', 'created_at'],
                    'order_by'  => ['created_at' => 'DESC'],
                ]);

            if ($consults->count() == 0) {
                return $options;
            }

            return $options . view('plugins/real-estate::notification', compact('consults'))->render();
        }

        return $options;
    }

    /**
     * @param int $number
     * @param string $menuId
     * @return string
     * @throws BindingResolutionException
     */
    public function getUnReadCount($number, $menuId)
    {
        if ($menuId == 'cms-plugins-consult') {
            $attributes = [
                'class' => 'badge badge-success menu-item-count unread-consults',
                'style' => 'display: none;',
            ];

            return Html::tag('span', '', $attributes)->toHtml();
        }

        return $number;
    }

    /**
     * @param array $data
     * @return array
     */
    public function getMenuItemCount(array $data = []) : array
    {
        if (Auth::user()->hasPermission('consult.index')) {
            $data[] = [
                'key'   => 'unread-consults',
                'value' => app(ConsultInterface::class)->countUnread()
            ];
        }

        return $data;
    }

    /**
     * Register sidebar options in menu
     * @throws Throwable
     */
    public function registerMenuOptions()
    {
        if (Auth::user()->hasPermission('property_category.index')) {
            Menu::registerMenuOptions(Category::class, trans('plugins/real-estate::category.menu'));
        }
    }

    /**
     * @param BaseModel $model
     * @param string $priority
     */
    public function addLanguageChooser($priority, $model)
    {
        if ($priority == 'head' && $model instanceof Category) {
            echo view('plugins/language::partials.admin-list-language-chooser', [
                    'route' => 'property_category.index',
                ])->render();
        }
    }
}
