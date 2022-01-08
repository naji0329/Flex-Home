<?php

namespace Botble\Backup\Providers;

use Botble\Backup\Commands\BackupCreateCommand;
use Botble\Backup\Commands\BackupListCommand;
use Botble\Backup\Commands\BackupRemoveCommand;
use Botble\Backup\Commands\BackupRestoreCommand;
use Illuminate\Support\ServiceProvider;

class CommandServiceProvider extends ServiceProvider
{
    public function boot()
    {
        if ($this->app->runningInConsole()) {
            $this->commands([
                BackupCreateCommand::class,
                BackupRestoreCommand::class,
                BackupRemoveCommand::class,
                BackupListCommand::class,
            ]);
        }
    }
}
