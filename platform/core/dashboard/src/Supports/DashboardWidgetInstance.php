<?php

namespace Botble\Dashboard\Supports;

use Botble\Dashboard\Repositories\Interfaces\DashboardWidgetInterface;
use Carbon\Carbon;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Throwable;

class DashboardWidgetInstance
{
    /**
     * @var string
     */
    public $type = 'widget';

    /**
     * @var string
     */
    public $key;

    /**
     * @var string
     */
    public $title;

    /**
     * @var string
     */
    public $icon;

    /**
     * @var string
     */
    public $color;

    /**
     * @var string
     */
    public $route;

    /**
     * @var string
     */
    public $bodyClass;

    /**
     * @var bool
     */
    public $isEqualHeight = true;

    /**
     * @var string
     */
    public $column;

    /**
     * @var string
     */
    public $permission;

    /**
     * @var int
     */
    public $statsTotal = 0;

    /**
     * @var bool
     */
    public $hasLoadCallback = false;

    /**
     * @var array
     */
    public $settings = [];

    /**
     * @var array
     */
    public $predefinedRanges = [];

    /**
     * @return string
     */
    public function getType(): string
    {
        return $this->type;
    }

    /**
     * @param string $type
     * @return DashboardWidgetInstance
     */
    public function setType(string $type): self
    {
        $this->type = $type;

        return $this;
    }

    /**
     * @return string
     */
    public function getKey(): string
    {
        return $this->key;
    }

    /**
     * @param string $key
     * @return DashboardWidgetInstance
     */
    public function setKey(string $key): self
    {
        $this->key = $key;

        return $this;
    }

    /**
     * @return string
     */
    public function getTitle(): string
    {
        return $this->title;
    }

    /**
     * @param string $title
     * @return DashboardWidgetInstance
     */
    public function setTitle(string $title): self
    {
        $this->title = $title;

        return $this;
    }

    /**
     * @return string
     */
    public function getIcon(): string
    {
        return $this->icon;
    }

    /**
     * @param string $icon
     * @return DashboardWidgetInstance
     */
    public function setIcon(string $icon): self
    {
        $this->icon = $icon;

        return $this;
    }

    /**
     * @return string
     */
    public function getColor(): string
    {
        return $this->color;
    }

    /**
     * @param string $color
     * @return DashboardWidgetInstance
     */
    public function setColor(string $color): self
    {
        $this->color = $color;

        return $this;
    }

    /**
     * @return string
     */
    public function getRoute(): string
    {
        return $this->route;
    }

    /**
     * @param string $route
     * @return DashboardWidgetInstance
     */
    public function setRoute(string $route): self
    {
        $this->route = $route;

        return $this;
    }

    /**
     * @return string
     */
    public function getBodyClass(): string
    {
        return $this->bodyClass;
    }

    /**
     * @param string $bodyClass
     * @return DashboardWidgetInstance
     */
    public function setBodyClass(string $bodyClass): self
    {
        $this->bodyClass = $bodyClass;

        return $this;
    }

    /**
     * @return bool
     */
    public function isEqualHeight(): bool
    {
        return $this->isEqualHeight;
    }

    /**
     * @param bool $isEqualHeight
     * @return DashboardWidgetInstance
     */
    public function setIsEqualHeight(bool $isEqualHeight): self
    {
        $this->isEqualHeight = $isEqualHeight;

        return $this;
    }

    /**
     * @return string
     */
    public function getColumn(): string
    {
        return $this->column;
    }

    /**
     * @param string $column
     * @return DashboardWidgetInstance
     */
    public function setColumn(string $column): self
    {
        $this->column = $column;

        return $this;
    }

    /**
     * @return string
     */
    public function getPermission(): string
    {
        return $this->permission;
    }

    /**
     * @param string $permission
     * @return DashboardWidgetInstance
     */
    public function setPermission(string $permission): self
    {
        $this->permission = $permission;

        return $this;
    }

    /**
     * @return int
     */
    public function getStatsTotal(): int
    {
        return $this->statsTotal;
    }

    /**
     * @param int $statsTotal
     * @return DashboardWidgetInstance
     */
    public function setStatsTotal(int $statsTotal): self
    {
        $this->statsTotal = $statsTotal;

        return $this;
    }

    /**
     * @return bool
     */
    public function isHasLoadCallback(): int
    {
        return $this->hasLoadCallback;
    }

    /**
     * @param bool $hasLoadCallback
     * @return DashboardWidgetInstance
     */
    public function setHasLoadCallback(bool $hasLoadCallback): self
    {
        $this->hasLoadCallback = $hasLoadCallback;

        return $this;
    }

    /**
     * @param array $settings
     * @return DashboardWidgetInstance
     */
    public function setSettings(array $settings): self
    {
        $this->settings = $settings;

        return $this;
    }

    /**
     * @param array $predefinedRanges
     * @return DashboardWidgetInstance
     */
    public function setPredefinedRanges(array $predefinedRanges): self
    {
        $this->predefinedRanges = $predefinedRanges;

        return $this;
    }

    /**
     * @return array
     */
    public function getPredefinedRangesDefault(): array
    {
        $endDate = today()->endOfDay();

        return [
            [
                'key'       => 'today',
                'label'     => trans('core/dashboard::dashboard.predefined_ranges.today'),
                'startDate' => today()->startOfDay(),
                'endDate'   => $endDate,
            ],
            [
                'key'       => 'yesterday',
                'label'     => trans('core/dashboard::dashboard.predefined_ranges.yesterday'),
                'startDate' => Carbon::yesterday()->startOfDay(),
                'endDate'   => Carbon::yesterday()->endOfDay(),
            ],
            [
                'key'       => 'this_week',
                'label'     => trans('core/dashboard::dashboard.predefined_ranges.this_week'),
                'startDate' => now()->startOfWeek(),
                'endDate'   => now()->endOfWeek(),
            ],
            [
                'key'       => 'last_7_days',
                'label'     => trans('core/dashboard::dashboard.predefined_ranges.last_7_days'),
                'startDate' => now()->subDays(7)->startOfDay(),
                'endDate'   => $endDate,
            ],
            [
                'key'       => 'this_month',
                'label'     => trans('core/dashboard::dashboard.predefined_ranges.this_month'),
                'startDate' => now()->startOfMonth(),
                'endDate'   => $endDate,
            ],
            [
                'key'       => 'last_30_days',
                'label'     => trans('core/dashboard::dashboard.predefined_ranges.last_30_days'),
                'startDate' => now()->subDays(29)->startOfDay(),
                'endDate'   => $endDate,
            ],
            [
                'key'       => 'this_year',
                'label'     => trans('core/dashboard::dashboard.predefined_ranges.this_year'),
                'startDate' => now()->startOfYear(),
                'endDate'   => $endDate,
            ],
        ];
    }

    /**
     * @return array
     */
    public function getPredefinedRanges(): array
    {
        return $this->predefinedRanges ?: $this->getPredefinedRangesDefault();
    }

    /**
     * @param array $widgets
     * @param Collection $widgetSettings
     * @return array
     * @throws Throwable
     */
    public function init($widgets, $widgetSettings)
    {
        if (!Auth::user()->hasPermission($this->permission)) {
            return $widgets;
        }

        $widget = $widgetSettings->where('name', $this->key)->first();
        $widgetSetting = $widget ? $widget->settings->first() : null;

        if (!$widget) {
            $widget = app(DashboardWidgetInterface::class)
                ->firstOrCreate(['name' => $this->key]);
        }

        $widget->title = $this->title;
        $widget->icon = $this->icon;
        $widget->color = $this->color;
        $widget->route = $this->route;
        if ($this->type === 'widget') {
            $widget->bodyClass = $this->bodyClass;
            $widget->column = $this->column;

            $settings = array_merge($widgetSetting && $widgetSetting->settings ? $widgetSetting->settings : [], $this->settings);
            $predefinedRanges = $this->getPredefinedRanges();

            $data = [
                'id'   => $widget->id,
                'type' => $this->type,
                'view' => view('core/dashboard::widgets.base', compact('widget', 'widgetSetting', 'settings', 'predefinedRanges'))->render(),
            ];

            if (empty($widgetSetting) || array_key_exists($widgetSetting->order, $widgets)) {
                $widgets[] = $data;
            } else {
                $widgets[$widgetSetting->order] = $data;
            }

            return $widgets;
        }

        $widget->statsTotal = $this->statsTotal;

        $widgets[$this->key] = [
            'id'   => $widget->id,
            'type' => $this->type,
            'view' => view('core/dashboard::widgets.stats', compact('widget', 'widgetSetting'))->render(),
        ];

        return $widgets;
    }

    /**
     * @param string $filterRangeInput
     * @return mixed
     */
    public function getFilterRange(?string $filterRangeInput)
    {
        $predefinedRanges = $this->getPredefinedRanges();
        $predefinedRanges = collect($predefinedRanges);

        if (!$filterRangeInput) {
            return $predefinedRanges->first();
        }

        $predefinedRangeFound = $predefinedRanges->firstWhere('key', $filterRangeInput);

        if ($predefinedRangeFound) {
            return $predefinedRangeFound;
        }

        return $predefinedRanges->first();
    }
}
