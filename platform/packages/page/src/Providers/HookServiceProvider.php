<?php

namespace Botble\Page\Providers;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Dashboard\Supports\DashboardWidgetInstance;
use Botble\Page\Models\Page;
use Botble\Page\Repositories\Interfaces\PageInterface;
use Botble\Page\Services\PageService;
use Eloquent;
use Illuminate\Contracts\Container\BindingResolutionException;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\ServiceProvider;
use Menu;
use Throwable;

class HookServiceProvider extends ServiceProvider
{
    public function boot()
    {
        if (defined('MENU_ACTION_SIDEBAR_OPTIONS')) {
            Menu::addMenuOptionModel(Page::class);
            add_action(MENU_ACTION_SIDEBAR_OPTIONS, [$this, 'registerMenuOptions'], 10);
        }

        add_filter(DASHBOARD_FILTER_ADMIN_LIST, [$this, 'addPageStatsWidget'], 15, 2);
        add_filter(BASE_FILTER_PUBLIC_SINGLE_DATA, [$this, 'handleSingleView'], 1);

        if (function_exists('theme_option')) {
            add_action(RENDERING_THEME_OPTIONS_PAGE, [$this, 'addThemeOptions'], 31);
        }
    }

    public function addThemeOptions()
    {
        $pages = $this->app->make(PageInterface::class)
            ->pluck('name', 'id', ['status' => BaseStatusEnum::PUBLISHED]);

        theme_option()
            ->setSection([
                'title'      => 'Page',
                'desc'       => 'Theme options for Page',
                'id'         => 'opt-text-subsection-page',
                'subsection' => true,
                'icon'       => 'fa fa-book',
                'fields'     => [
                    [
                        'id'         => 'homepage_id',
                        'type'       => 'customSelect',
                        'label'      => trans('packages/page::pages.settings.show_on_front'),
                        'attributes' => [
                            'name'    => 'homepage_id',
                            'list'    => ['' => trans('packages/page::pages.settings.select')] + $pages,
                            'value'   => '',
                            'options' => [
                                'class' => 'form-control',
                            ],
                        ],
                    ],
                ],
            ]);
    }

    /**
     * Register sidebar options in menu
     * @throws Throwable
     */
    public function registerMenuOptions()
    {
        if (Auth::user()->hasPermission('pages.index')) {
            Menu::registerMenuOptions(Page::class, trans('packages/page::pages.menu'));
        }
    }

    /**
     * @param array $widgets
     * @param Collection $widgetSettings
     * @return array
     *
     * @throws BindingResolutionException
     * @throws Throwable
     */
    public function addPageStatsWidget($widgets, $widgetSettings)
    {
        $pages = $this->app->make(PageInterface::class)->count(['status' => BaseStatusEnum::PUBLISHED]);

        return (new DashboardWidgetInstance)
            ->setType('stats')
            ->setPermission('pages.index')
            ->setTitle(trans('packages/page::pages.pages'))
            ->setKey('widget_total_pages')
            ->setIcon('far fa-file-alt')
            ->setColor('#32c5d2')
            ->setStatsTotal($pages)
            ->setRoute(route('pages.index'))
            ->init($widgets, $widgetSettings);
    }

    /**
     * @param Eloquent $slug
     * @return array|Eloquent
     *
     * @throws BindingResolutionException
     */
    public function handleSingleView($slug)
    {
        return (new PageService)->handleFrontRoutes($slug);
    }
}
