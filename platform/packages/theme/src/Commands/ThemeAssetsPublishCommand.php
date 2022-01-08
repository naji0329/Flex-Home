<?php

namespace Botble\Theme\Commands;

use Botble\Theme\Commands\Traits\ThemeTrait;
use Botble\Theme\Services\ThemeService;
use Illuminate\Console\Command;
use Illuminate\Filesystem\Filesystem as File;

class ThemeAssetsPublishCommand extends Command
{
    use ThemeTrait;

    /**
     * @var ThemeService
     */
    public $themeService;

    /**
     * The console command name.
     *
     * @var string
     */
    protected $signature = '
        cms:theme:assets:publish
        {--name= : The theme that you want to publish assets}
        {--path= : Path to theme directory}
    ';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Publish assets for a theme';

    /**
     * ThemeAssetsPublishCommand constructor.
     * @param ThemeService $themeService
     */
    public function __construct(ThemeService $themeService)
    {
        parent::__construct();
        $this->themeService = $themeService;
    }

    /**
     * Execute the console command.
     *
     * @return bool
     */
    public function handle()
    {
        if ($this->option('name') && !preg_match('/^[a-z0-9\-]+$/i', $this->option('name'))) {
            $this->error('Only alphabetic characters are allowed.');
            return 1;
        }

        if ($this->option('name') && !File::isDirectory($this->getPath())) {
            $this->error('Theme "' . $this->getTheme() . '" is not exists.');
            return 1;
        }

        $result = $this->themeService->publishAssets($this->option('name'));

        if ($result['error']) {
            $this->error($result['message']);
            return 1;
        }

        $this->info($result['message']);

        return 0;
    }
}
