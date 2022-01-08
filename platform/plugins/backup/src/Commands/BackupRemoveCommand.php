<?php

namespace Botble\Backup\Commands;

use Botble\Backup\Supports\Backup;
use Exception;
use File;
use Illuminate\Console\Command;
use Illuminate\Console\ConfirmableTrait;

class BackupRemoveCommand extends Command
{
    use ConfirmableTrait;

    /**
     * @var Backup
     */
    public $backup;

    /**
     * The console command signature.
     *
     * @var string
     */
    protected $signature = 'cms:backup:remove {backup : The backup date} {--force : Remove backup without confirmation}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Remove a backup';

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
            $backup = $this->argument('backup');

            if (!File::isDirectory($this->backup->getBackupPath($backup))) {
                $this->error('Cannot found backup folder!');
                return 1;
            }

            if (!$this->confirmToProceed('Are you sure you want to permanently delete?', true)) {
                return 1;
            }

            $this->backup->deleteFolderBackup($this->backup->getBackupPath($backup));

            $this->info('Remove a backup successfully!');

        } catch (Exception $exception) {
            $this->error($exception->getMessage());
        }

        return 0;
    }
}
