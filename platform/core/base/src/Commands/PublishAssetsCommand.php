<?php

namespace Botble\Base\Commands;

use Illuminate\Console\Command;

class PublishAssetsCommand extends Command
{
    /**
     * The console command signature.
     *
     * @var string
     */
    protected $signature = 'cms:publish:assets';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Publish assets (CSS, JS, Images...)';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $this->info('Publishing core, packages, plugins assets...');
        $this->call('vendor:publish', ['--tag' => 'cms-public', '--force' => true]);

        $this->info('Publishing theme assets...');
        $this->call('cms:theme:assets:publish');

        $this->info('Published assets successfully!');
    }
}
