<?php

namespace Botble\Menu\Commands;

use Illuminate\Console\Command;
use Menu;

class ClearMenuCacheCommand extends Command
{

    /**
     * The console command signature.
     *
     * @var string
     */
    protected $signature = 'cms:menu:clear-cache';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Clear cache menu URLs';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        Menu::clearCacheMenuItems();

        $this->info('Menu cache URLs cleared!');

        return 0;
    }
}
