<?php

namespace Botble\Translation\Console;

use Botble\Translation\Manager;
use Botble\Translation\Models\Translation;
use File;
use Illuminate\Console\Command;
use Illuminate\Support\Arr;
use Theme;

class RemoveUnusedTranslationsCommand extends Command
{

    /**
     * The console command name.
     *
     * @var string
     */
    protected $name = 'cms:translations:remove-unused-translations';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Remove unused translations';

    /**
     * @var Manager
     */
    protected $manager;

    /**
     * RemoveUnusedTranslationsCommand constructor.
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
     * @return int
     */
    public function handle()
    {
        $this->info('Remove unused translations in resource/lang...');

        foreach (File::directories(resource_path('lang/vendor/packages')) as $package) {
            if (!File::isDirectory(package_path(File::basename($package)))) {
                File::deleteDirectory($package);
            }
        }

        foreach (File::directories(resource_path('lang/vendor/plugins')) as $plugin) {
            if (!File::isDirectory(plugin_path(File::basename($plugin)))) {
                File::deleteDirectory($plugin);
            }
        }

        if (defined('THEME_MODULE_SCREEN_NAME')) {
            foreach (File::allFiles(resource_path('lang')) as $file) {
                if (File::isFile($file) && $file->getExtension() === 'json') {
                    $locale = $file->getFilenameWithoutExtension();

                    if ($locale == 'en') {
                        continue;
                    }

                    $translations = get_file_data($file->getRealPath(), true);

                    $defaultEnglishFile = theme_path(Theme::getThemeName() . '/lang/en.json');

                    if ($defaultEnglishFile) {
                        $enTranslations = get_file_data($defaultEnglishFile, true);
                        $translations = array_merge($enTranslations, $translations);

                        $enTranslationKeys = array_keys($enTranslations);

                        foreach ($translations as $key => $translation) {
                            if (!in_array($key, $enTranslationKeys)) {
                                Arr::forget($translations, $key);
                            }
                        }
                    }

                    ksort($translations);

                    File::put($file->getRealPath(), json_encode($translations, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES));
                }
            }
        }

        $this->info('Importing...');
        $this->manager->importTranslations();

        $groups = Translation::groupBy('group')->pluck('group');

        $counter = 0;
        foreach ($groups as $group) {
            $keys = Translation::where('group', $group)
                ->where('locale', 'en')
                ->pluck('key');

            $counter += Translation::where('locale', '!=', 'en')
                ->where('group', $group)
                ->whereNotIn('key', $keys)
                ->delete();
        }

        $this->manager->exportAllTranslations();

        $this->info('Exporting...');
        $this->info('Done! Deleted ' . $counter . ' items!');

        return 0;
    }
}
