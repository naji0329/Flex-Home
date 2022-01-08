<?php

namespace Botble\AuditLog\Commands;

use Botble\AuditLog\Models\AuditHistory;
use Illuminate\Console\Command;
use Throwable;

class CleanOldLogsCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'cms:activity-logs:clean-old-logs';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Clean logs over 30 days';

    /**
     * Execute the console command.
     *
     * @throws Throwable
     */
    public function handle()
    {
        $this->info('Processing...');

        $this->call('model:prune', ['--model' => AuditHistory::class]);

        $this->info('Done!');
    }
}
