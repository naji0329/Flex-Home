<?php

namespace Botble\AuditLog\Commands;

use Botble\AuditLog\Repositories\Interfaces\AuditLogInterface;
use Illuminate\Console\Command;
use Throwable;

class ActivityLogClearCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'cms:activity-logs:clear';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Clear all activity logs';

    /**
     * @var AuditLogInterface
     */
    protected $auditLogRepository;

    /**
     * RebuildPermissions constructor.
     *
     * @param AuditLogInterface $auditLogRepository
     */
    public function __construct(AuditLogInterface $auditLogRepository)
    {
        parent::__construct();
        $this->auditLogRepository = $auditLogRepository;
    }

    /**
     * Execute the console command.
     *
     * @throws Throwable
     */
    public function handle()
    {
        $this->info('Processing...');
        $count = $this->auditLogRepository->count();
        $this->auditLogRepository->getModel()->truncate();
        $this->info('Done. Deleted ' . $count . ' records!');
    }
}
