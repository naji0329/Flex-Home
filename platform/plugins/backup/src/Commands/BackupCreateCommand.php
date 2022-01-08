<?php

namespace Botble\Backup\Commands;

use Botble\Backup\Supports\Backup;
use Exception;
use Illuminate\Console\Command;

class BackupCreateCommand extends Command
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
    protected $signature = 'cms:backup:create {name : The name of backup} {--description= : The description}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Create a backup';

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
            $this->info('Generating backup...');
            $data = $this->backup->createBackupFolder($this->argument('name'), $this->option('description'));
            $this->backup->backupDb();
            $this->backup->backupFolder(config('filesystems.disks.public.root'));
            do_action(BACKUP_ACTION_AFTER_BACKUP, BACKUP_MODULE_SCREEN_NAME, request());

            $this->info('Done! The backup folder is located in ' . $this->backup->getBackupPath($data['key']) . '!');
        } catch (Exception $exception) {
            $this->error($exception->getMessage());
        }

        return 0;
    }
}
