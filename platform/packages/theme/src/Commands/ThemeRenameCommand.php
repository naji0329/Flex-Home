<?php

namespace Botble\Theme\Commands;

use Botble\Setting\Models\Setting as SettingModel;
use Botble\Theme\Commands\Traits\ThemeTrait;
use Botble\Theme\Services\ThemeService;
use Botble\Widget\Models\Widget;
use Illuminate\Console\Command;
use Illuminate\Contracts\Filesystem\FileNotFoundException;
use Illuminate\Filesystem\Filesystem as File;

class ThemeRenameCommand extends Command
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
    protected $signature = 'cms:theme:rename {name : The theme that you want to rename} {newName : The new name}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Rename theme to the new name';

    /**
     * @var File
     */
    protected $files;

    /**
     * Create a new command instance.
     *
     * @param File $files
     * @param ThemeService $themeService
     */
    public function __construct(File $files, ThemeService $themeService)
    {
        parent::__construct();
        $this->files = $files;
        $this->themeService = $themeService;
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     * @throws \League\Flysystem\FileNotFoundException
     * @throws FileNotFoundException
     */
    public function handle()
    {
        $theme = $this->getTheme();

        $newName = $this->argument('newName');

        if ($theme == $newName) {
            $this->error('Theme name are the same!');
            return 1;
        }

        if ($this->files->isDirectory(theme_path($newName))) {
            $this->error('Theme "' . $theme . '" is already exists.');
            return 1;
        }

        $this->files->move(theme_path($theme), theme_path($newName));

        $this->themeService->activate($newName);

        $themeOptions = SettingModel::where('key', 'LIKE', 'theme-' . $theme . '-%')->get();

        foreach ($themeOptions as $option) {
            $option->key = str_replace('theme-' . $theme, 'theme-' . $newName, $option->key);
            $option->save();
        }

        Widget::where('theme', $theme)->update(['theme' => $newName]);

        $widgets = Widget::where('theme', 'LIKE', $theme . '-%')->get();

        foreach ($widgets as $widget) {
            $widget->theme = str_replace($theme, $newName, $widget->theme);
            $widget->save();
        }

        $this->info('Theme "' . $theme . '" has been renamed to ' . $newName . '!');

        return 0;
    }
}
