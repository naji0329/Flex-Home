<?php

namespace Botble\Language\Commands;

use Illuminate\Foundation\Console\RouteClearCommand as BaseRouteClearCommand;
use Language;

class RouteClearCommand extends BaseRouteClearCommand
{
    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        parent::handle();

        foreach (Language::getSupportedLanguagesKeys() as $locale) {

            $path = $this->laravel->getCachedRoutesPath();

            if (!$locale) {
                $locale = Language::getDefaultLocale();
            }

            $path = substr($path, 0, -4) . '_' . $locale . '.php';

            if ($this->files->exists($path)) {
                $this->files->delete($path);
            }
        }

        return 0;
    }
}
