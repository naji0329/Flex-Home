<?php

namespace Botble\Translation;

use Botble\Base\Supports\MountManager;
use Botble\Translation\Models\Translation;
use Exception;
use Illuminate\Filesystem\Filesystem;
use Illuminate\Foundation\Application;
use Illuminate\Support\Arr;
use Illuminate\Support\ServiceProvider;
use Lang;
use League\Flysystem\Adapter\Local as LocalAdapter;
use League\Flysystem\Filesystem as Flysystem;
use Symfony\Component\VarExporter\VarExporter;

class Manager
{
    /**
     * @var Application
     */
    protected $app;

    /**
     * @var Filesystem
     */
    protected $files;

    /**
     * @var array|\ArrayAccess
     */
    protected $config;

    /**
     * Manager constructor.
     * @param Application $app
     * @param Filesystem $files
     */
    public function __construct(Application $app, Filesystem $files)
    {
        $this->app = $app;
        $this->files = $files;
        $this->config = $app['config']['plugins.translation.general'];
    }

    /**
     * @param string $group
     * @param string $key
     */
    public function missingKey($group, $key)
    {
        if (!in_array($group, $this->config['exclude_groups'])) {
            Translation::firstOrCreate([
                'locale' => $this->app['config']['app.locale'],
                'group'  => $group,
                'key'    => $key,
            ]);
        }
    }

    /**
     * @param bool $replace
     * @return int
     */
    public function importTranslations($replace = false)
    {
        try {
            $this->publishLocales();
        } catch (Exception $exception) {
            info($exception->getMessage());
        }

        $counter = 0;

        foreach ($this->files->directories($this->app['path.lang']) as $langPath) {
            $locale = basename($langPath);
            foreach ($this->files->allfiles($langPath) as $file) {
                $info = pathinfo($file);
                $group = $info['filename'];
                if (in_array($group, $this->config['exclude_groups'])) {
                    continue;
                }
                $subLangPath = str_replace($langPath . DIRECTORY_SEPARATOR, '', $info['dirname']);
                $subLangPath = str_replace(DIRECTORY_SEPARATOR, '/', $subLangPath);
                $langDirectory = $group;
                if ($subLangPath != $langPath) {
                    $langDirectory = $subLangPath . '/' . $group;
                    $group = substr($subLangPath, 0, -3) . '/' . $group;
                }

                $translations = Lang::getLoader()->load($locale, $langDirectory);
                if ($translations && is_array($translations)) {
                    foreach (Arr::dot($translations) as $key => $value) {
                        $importedTranslation = $this->importTranslation($key, $value,
                            ($locale != 'vendor' ? $locale : substr($subLangPath, -2)), $group, $replace);
                        $counter += $importedTranslation ? 1 : 0;
                    }
                }
            }
        }

        return $counter;
    }

    public function publishLocales()
    {
        $paths = ServiceProvider::pathsToPublish(null, 'cms-lang');

        foreach ($paths as $from => $to) {
            if ($this->files->isFile($from)) {
                if (!$this->files->isDirectory(dirname($to))) {
                    $this->files->makeDirectory(dirname($to), 0755, true);
                }
                $this->files->copy($from, $to);
            } elseif ($this->files->isDirectory($from)) {
                $manager = new MountManager([
                    'from' => new Flysystem(new LocalAdapter($from)),
                    'to'   => new Flysystem(new LocalAdapter($to)),
                ]);

                foreach ($manager->listContents('from://', true) as $file) {
                    if ($file['type'] === 'file') {
                        $manager->put('to://' . $file['path'], $manager->read('from://' . $file['path']));
                    }
                }
            }
        }
    }

    /**
     * @param string $key
     * @param string $value
     * @param string $locale
     * @param string $group
     * @param bool $replace
     * @return bool
     */
    public function importTranslation($key, $value, $locale, $group, $replace = false)
    {
        // process only string values
        if (is_array($value)) {
            return false;
        }
        $value = (string)$value;
        $translation = Translation::firstOrNew([
            'locale' => $locale,
            'group'  => $group,
            'key'    => $key,
        ]);

        // Check if the database is different from files
        $newStatus = $translation->value === $value ? Translation::STATUS_SAVED : Translation::STATUS_CHANGED;
        if ($newStatus !== (int)$translation->status) {
            $translation->status = $newStatus;
        }

        // Only replace when empty, or explicitly told so
        if ($replace || !$translation->value) {
            $translation->value = $value;
        }

        $translation->save();

        return true;
    }

    /**
     * @param null $group
     * @throws \Symfony\Component\VarExporter\Exception\ExceptionInterface
     */
    public function exportTranslations($group = null)
    {
        if (!empty($group)) {
            if (!in_array($group, $this->config['exclude_groups'])) {
                if ($group == '*') {
                    return $this->exportAllTranslations();
                }

                $tree = $this->makeTree(Translation::ofTranslatedGroup($group)->orderByGroupKeys(Arr::get($this->config,
                    'sort_keys', false))->get());

                foreach ($tree as $locale => $groups) {
                    if (isset($groups[$group])) {
                        $translations = $groups[$group];
                        $file = $locale . '/' . $group;

                        if (!$this->files->isDirectory($this->app->langPath() . '/' . $locale)) {
                            $this->files->makeDirectory($this->app->langPath() . '/' . $locale, 755, true);
                            system('find ' . $this->app->langPath() . '/' . $locale . ' -type d -exec chmod 755 {} \;');
                        }

                        $groups = explode('/', $group);
                        if (count($groups) > 1) {
                            $folderName = Arr::last($groups);
                            Arr::forget($groups, count($groups) - 1);

                            $dir = 'vendor/' . implode('/', $groups) . '/' . $locale;
                            if (!$this->files->isDirectory($this->app->langPath() . '/' . $dir)) {
                                $this->files->makeDirectory($this->app->langPath() . '/' . $dir, 755, true);
                                system('find ' . $this->app->langPath() . '/' . $dir . ' -type d -exec chmod 755 {} \;');
                            }
                            $file = $dir . '/' . $folderName;
                        }
                        $path = $this->app['path.lang'] . '/' . $file . '.php';
                        $output = "<?php\n\nreturn " . VarExporter::export($translations) . ";\n";
                        $this->files->put($path, $output);
                    }
                }

                Translation::ofTranslatedGroup($group)->update(['status' => Translation::STATUS_SAVED]);
            }
        }
    }

    /**
     * @return bool
     * @throws \Symfony\Component\VarExporter\Exception\ExceptionInterface
     */
    public function exportAllTranslations()
    {
        $groups = Translation::whereNotNull('value')->selectDistinctGroup()->get('group');

        foreach ($groups as $group) {
            $this->exportTranslations($group->group);
        }

        return true;
    }

    /**
     * @param array $translations
     * @return array
     */
    protected function makeTree($translations)
    {
        $array = [];
        foreach ($translations as $translation) {
            Arr::set($array[$translation->locale][$translation->group], $translation->key, $translation->value);
        }

        return $array;
    }

    /**
     * @throws Exception
     */
    public function cleanTranslations()
    {
        Translation::whereNull('value')->delete();
    }

    public function truncateTranslations()
    {
        Translation::truncate();
    }

    /**
     * @param null|string $key
     * @return mixed
     */
    public function getConfig($key = null)
    {
        if ($key == null) {
            return $this->config;
        }

        return $this->config[$key];
    }
}
