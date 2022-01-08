<?php

namespace Botble\Translation\Console;

use Botble\Translation\Manager;
use Illuminate\Console\Command;
use Symfony\Component\Console\Input\InputArgument;

class ExportCommand extends Command
{

    /**
     * The console command name.
     *
     * @var string
     */
    protected $name = 'cms:translations:export';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Export translations to PHP files';

    /**
     * @var Manager
     */
    protected $manager;

    /**
     * ExportCommand constructor.
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
     * @throws \Symfony\Component\VarExporter\Exception\ExceptionInterface
     */
    public function handle()
    {
        $group = $this->argument('group');

        if (empty($group)) {
            $this->warn('You must either specify a group argument');

            return;
        }

        $this->manager->exportTranslations($group);

        if (!empty($group)) {
            $this->info('Done writing language files for ' . ($group == '*' ? 'ALL groups' : $group . ' group'));
        }
    }

    /**
     * Get the console command arguments.
     *
     * @return array
     */
    protected function getArguments()
    {
        return [
            ['group', InputArgument::OPTIONAL, 'The group to export (`*` for all).'],
        ];
    }
}
