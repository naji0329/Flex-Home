<?php

namespace Botble\AuditLog\Providers;

use Assets;
use AuditLog;
use Botble\ACL\Models\User;
use Illuminate\Support\Facades\Auth;
use Botble\Dashboard\Supports\DashboardWidgetInstance;
use Illuminate\Support\Collection;
use Illuminate\Support\ServiceProvider;
use Botble\AuditLog\Events\AuditHandlerEvent;
use Illuminate\Http\Request;
use stdClass;
use Throwable;

class HookServiceProvider extends ServiceProvider
{
    public function boot()
    {
        add_action(AUTH_ACTION_AFTER_LOGOUT_SYSTEM, [$this, 'handleLogout'], 45, 2);

        add_action(USER_ACTION_AFTER_UPDATE_PASSWORD, [$this, 'handleUpdatePassword'], 45, 3);
        add_action(USER_ACTION_AFTER_UPDATE_PASSWORD, [$this, 'handleUpdateProfile'], 45, 3);

        if (defined('BACKUP_ACTION_AFTER_BACKUP')) {
            add_action(BACKUP_ACTION_AFTER_BACKUP, [$this, 'handleBackup'], 45);
            add_action(BACKUP_ACTION_AFTER_RESTORE, [$this, 'handleRestore'], 45);
        }

        add_filter(DASHBOARD_FILTER_ADMIN_LIST, [$this, 'registerDashboardWidgets'], 28, 2);
    }

    /**
     * @param Request $request
     * @param User $data
     */
    public function handleLogin(Request $request, $data)
    {
        event(new AuditHandlerEvent(
            'to the system',
            'logged in',
            $data->id,
            $data->name,
            'info'
        ));
    }

    /**
     * @param string $screen
     * @param Request $request
     * @param User $data
     */
    public function handleLogout(Request $request, $data)
    {
        event(new AuditHandlerEvent(
            'of the system',
            'logged out',
            $data->id,
            $data->name,
            'info'
        ));
    }

    /**
     * @param string $screen
     * @param Request $request
     * @param stdClass $data
     */
    public function handleUpdateProfile($screen, Request $request, $data)
    {
        event(new AuditHandlerEvent(
            $screen,
            'updated profile',
            $data->id,
            AuditLog::getReferenceName($screen, $data),
            'info'
        ));
    }

    /**
     * @param string $screen
     * @param Request $request
     * @param stdClass $data
     */
    public function handleUpdatePassword($screen, Request $request, $data)
    {
        event(new AuditHandlerEvent(
            $screen,
            'changed password',
            $data->id,
            AuditLog::getReferenceName($screen, $data),
            'danger'
        ));
    }

    /**
     * @param string $screen
     */
    public function handleBackup($screen)
    {
        event(new AuditHandlerEvent($screen, 'created', 0, '', 'info'));
    }

    /**
     * @param string $screen
     */
    public function handleRestore($screen)
    {
        event(new AuditHandlerEvent($screen, 'restored', 0, '', 'info'));
    }

    /**
     * @param array $widgets
     * @param Collection $widgetSettings
     * @return array
     * @throws Throwable
     */
    public function registerDashboardWidgets($widgets, $widgetSettings)
    {
        if (!Auth::user()->hasPermission('audit-log.index')) {
            return $widgets;
        }

        Assets::addScriptsDirectly('vendor/core/plugins/audit-log/js/audit-log.js');

        return (new DashboardWidgetInstance)
            ->setPermission('audit-log.index')
            ->setKey('widget_audit_logs')
            ->setTitle(trans('plugins/audit-log::history.widget_audit_logs'))
            ->setIcon('fas fa-history')
            ->setColor('#44b6ae')
            ->setRoute(route('audit-log.widget.activities'))
            ->setBodyClass('scroll-table')
            ->setColumn('col-md-6 col-sm-6')
            ->init($widgets, $widgetSettings);
    }
}
