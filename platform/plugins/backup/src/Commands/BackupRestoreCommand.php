<?php

namespace Botble\Backup\Commands;

use Botble\Backup\Supports\Backup;
use Exception;
use File;
use Illuminate\Console\Command;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;

class BackupRestoreCommand extends Command
{
    /**
     * @var Backup
     */
    public $backup;

    /**
     * The console command signature.
     *
     * @var string
     */
    protected $signature = 'cms:backup:restore {--backup= : The backup date}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Restore a backup';

    /**
     * BackupCommand constructor.
     * @param Backup $backup
     */
    public function __construct(Backup $backup)
    {
        parent::__construct();
        $this->backup = $backup;
    }

    /**
     * Execute the console command.
     * @throws Exception
     */
    public function handle()
    {
        try {
            if ($this->option('backup')) {
                $backup = $this->option('backup');

                if (!File::isDirectory($this->backup->getBackupPath($backup))) {
                    $this->error('Cannot found backup folder!');
                    return 1;
                }
            } else {
                $backups = scan_folder($this->backup->getBackupPath());

                if (empty($backups)) {
                    $this->error('No backup found to restore!');
                    return 1;
                }

                $backup = Arr::first($backups);
            }

            $this->info('Restoring backup...');

            $path = $this->backup->getBackupPath($backup);
            foreach (scan_folder($path) as $file) {
                if (Str::contains(basename($file), 'database')) {
                    $this->info('Restoring database...');
                    $this->backup->restoreDatabase($path . DIRECTORY_SEPARATOR . $file, $path);
                }

                if (Str::contains(basename($file), 'storage')) {
                    $this->info('Restoring uploaded files...');
                    $pathTo = config('filesystems.disks.public.root');
                    $this->backup->cleanDirectory($pathTo);
                    $this->backup->extractFileTo($path . DIRECTORY_SEPARATOR . $file, $pathTo);
                }
            }

            $this->call('cache:clear');

            do_action(BACKUP_ACTION_AFTER_RESTORE, BACKUP_MODULE_SCREEN_NAME, request());

            $this->info(trans('plugins/backup::backup.restore_backup_success'));

        } catch (Exception $exception) {
            $this->error($exception->getMessage());
        }

        return 0;
    }
}
