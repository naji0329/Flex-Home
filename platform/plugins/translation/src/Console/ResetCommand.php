<?php

namespace Botble\Translation\Console;

use Illuminate\Console\Command;
use Botble\Translation\Manager;

class ResetCommand extends Command
{

    /**
     * The console command name.
     *
     * @var string
     */
    protected $name = 'cms:translations:reset';

    /**
     * The console command description.
     * @var string
     */
    protected $description = 'Delete all languages records in database';

    /**
     * @var Manager
     */
    protected $manager;

    /**
     * ResetCommand constructor.
     * @param Manager $manager
     */
    public function __construct(Manager $manager)
    {
        $this->manager = $manager;

        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return void
     */
    public function handle()
    {
        $this->manager->truncateTranslations();
        $this->info('All translations are deleted');
    }
}
