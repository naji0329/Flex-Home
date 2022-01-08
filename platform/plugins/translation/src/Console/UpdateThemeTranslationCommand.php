<?php

namespace Botble\Translation\Console;

use Illuminate\Console\Command;
use Illuminate\Support\Str;
use Symfony\Component\Finder\Finder;
use Theme;

class UpdateThemeTranslationCommand extends Command
{

    /**
     * The console command name.
     *
     * @var string
     */
    protected $name = 'cms:translations:update-theme-translations';

    /**
     * The console command description.
     * @var string
     */
    protected $description = 'Update theme translations';

    /**
     * Execute the console command.
     *
     * @return void
     */
    public function handle()
    {
        $keys = $this->findTranslations(core_path());
        $keys += $this->findTranslations(package_path());
        $keys += $this->findTranslations(plugin_path());
        $keys += $this->findTranslations(theme_path(Theme::getThemeName()));
        ksort($keys);

        $data = json_encode($keys, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);

        save_file_data(theme_path(Theme::getThemeName() . '/lang/en.json'), $data, false);

        $this->info('Found ' . count($keys) . ' keys');
    }

    /**
     * @param string $path
     * @return array
     */
    public function findTranslations(string $path): array
    {
        $keys = [];

        $stringPattern =
            '[^\w]' .                                     // Must not have an alphanum before real method
            '(__)' .             // Must start with one of the functions
            '\(\s*' .                                       // Match opening parenthesis
            "(?P<quote>['\"])" .                            // Match " or ' and store in {quote}
            '(?P<string>(?:\\\k{quote}|(?!\k{quote}).)*)' . // Match any string that can be {quote} escaped
            '\k{quote}' .                                   // Match " or ' previously matched
            '\s*[\),]';                                    // Close parentheses or new parameter

        // Find all PHP + Twig files in the app folder, except for storage
        $finder = new Finder;
        $finder->in($path)->name('*.php')->files();

        /**
         * @var \Symfony\Component\Finder\SplFileInfo $file
         */
        foreach ($finder as $file) {
            if (!preg_match_all('/' . $stringPattern . '/siU', $file->getContents(), $matches)) {
                continue;
            }

            foreach ($matches['string'] as $key) {
                if (preg_match('/(^[a-zA-Z0-9_-]+([.][^\)\ ]+)+$)/siU', $key, $groupMatches) && !Str::contains($key, '...')) {
                    // Do nothing, it has to be treated as a group
                    continue;
                }

                // Skip keys which contain namespacing characters, unless they also contain a space, which makes it JSON.
                if (!(Str::contains($key, '::') && Str::contains($key, '.')) || Str::contains($key, ' ')) {
                    $keys[$key] = $key;
                }
            }
        }

        return array_unique($keys);
    }
}
