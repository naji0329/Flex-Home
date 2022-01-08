<?php

namespace Botble\Theme\Commands;

use Botble\Theme\Commands\Traits\ThemeTrait;
use Botble\Theme\Services\ThemeService;
use Illuminate\Console\Command;

class ThemeAssetsRemoveCommand extends Command
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
        cms:theme:assets:remove
        {name : The theme that you want to publish assets}
        {--path= : Path to theme directory}
    ';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Remove assets for a theme';

    /**
     * ThemeAssetsRemoveCommand constructor.
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
        if (!preg_match('/^[a-z0-9\-]+$/i', $this->argument('name'))) {
            $this->error('Only alphabetic characters are allowed.');
            return 1;
        }

        $result = $this->themeService->removeAssets($this->getTheme());

        if ($result['error']) {
            $this->error($result['message']);
            return 1;
        }

        $this->info($result['message']);

        return 0;
    }
}
