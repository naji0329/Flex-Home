<?php

namespace Botble\PluginManagement\Services;

use Botble\Base\Supports\Helper;
use Botble\PluginManagement\Events\ActivatedPluginEvent;
use Botble\Setting\Supports\SettingStore;
use Composer\Autoload\ClassLoader;
use Illuminate\Contracts\Filesystem\FileNotFoundException;
use Illuminate\Filesystem\Filesystem;
use Illuminate\Foundation\Application;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Schema;

class PluginService
{

    /**
     * @var Application
     */
    protected $app;

    /**
     * @var SettingStore
     */
    protected $settingStore;

    /**
     * @var Filesystem
     */
    protected $files;

    /**
     * PluginService constructor.
     * @param Application $app
     * @param SettingStore $settingStore
     * @param Filesystem $files
     */
    public function __construct(Application $app, SettingStore $settingStore, Filesystem $files)
    {
        $this->app = $app;
        $this->settingStore = $settingStore;
        $this->files = $files;
    }

    /**
     * @param string $plugin
     * @return array
     */
    public function activate(string $plugin): array
    {
        $validate = $this->validate($plugin);

        if ($validate['error']) {
            return $validate;
        }

        $content = get_file_data(plugin_path($plugin) . '/plugin.json');
        if (empty($content)) {
            return [
                'error'   => true,
                'message' => trans('packages/plugin-management::plugin.invalid_json'),
            ];
        }

        if (!Arr::get($content, 'ready', 1)) {
            return [
                'error'   => true,
                'message' => trans('packages/plugin-management::plugin.plugin_is_not_ready',
                    ['name' => Str::studly($plugin)]),
            ];
        }

        $activatedPlugins = get_active_plugins();
        if (!in_array($plugin, $activatedPlugins)) {

            if (!empty(Arr::get($content, 'require'))) {
                $valid = count(array_intersect($content['require'], $activatedPlugins)) == count($content['require']);
                if (!$valid) {

                    return [
                        'error'   => true,
                        'message' => trans('packages/plugin-management::plugin.missing_required_plugins',
                            ['plugins' => implode(',', $content['require'])]),
                    ];
                }
            }

            if (!class_exists($content['provider'])) {
                $loader = new ClassLoader;
                $loader->setPsr4($content['namespace'], plugin_path($plugin . '/src'));
                $loader->register(true);

                $published = $this->publishAssets($plugin);

                if ($published['error']) {
                    return $published;
                }

                if (class_exists($content['namespace'] . 'Plugin')) {
                    call_user_func([$content['namespace'] . 'Plugin', 'activate']);
                }

                if ($this->files->isDirectory(plugin_path($plugin . '/database/migrations'))) {
                    $this->app->make('migrator')->run(plugin_path($plugin . '/database/migrations'));
                }

                $this->app->register($content['provider']);
            }

            $this->settingStore
                ->set('activated_plugins', json_encode(array_values(array_merge($activatedPlugins, [$plugin]))))
                ->save();

            if (class_exists($content['namespace'] . 'Plugin')) {
                call_user_func([$content['namespace'] . 'Plugin', 'activated']);
            }

            Helper::clearCache();

            event(new ActivatedPluginEvent($plugin));

            return [
                'error'   => false,
                'message' => trans('packages/plugin-management::plugin.activate_success'),
            ];
        }

        return [
            'error'   => true,
            'message' => trans('packages/plugin-management::plugin.activated_already'),
        ];
    }

    /**
     * @param string $plugin
     * @return array
     */
    protected function validate(string $plugin): array
    {
        $location = plugin_path($plugin);

        if (!$this->files->isDirectory($location)) {
            return [
                'error'   => true,
                'message' => trans('packages/plugin-management::plugin.plugin_not_exist'),
            ];
        }

        if (!$this->files->exists($location . '/plugin.json')) {
            return [
                'error'   => true,
                'message' => trans('packages/plugin-management::plugin.missing_json_file'),
            ];
        }

        return [
            'error'   => false,
            'message' => trans('packages/plugin-management::plugin.plugin_invalid'),
        ];
    }

    /**
     * @param string $plugin
     * @return array
     */
    public function publishAssets(string $plugin): array
    {
        $validate = $this->validate($plugin);

        if ($validate['error']) {
            return $validate;
        }

        $pluginPath = public_path('vendor/core/plugins');

        if (!$this->files->isDirectory($pluginPath)) {
            $this->files->makeDirectory($pluginPath, 0755, true);
        }

        if (!$this->files->isWritable($pluginPath)) {
            return [
                'error'   => true,
                'message' => trans('packages/plugin-management::plugin.folder_is_not_writeable',
                    ['name' => $pluginPath]),
            ];
        }

        if ($this->files->isDirectory(plugin_path($plugin . '/public'))) {
            $this->files->copyDirectory(plugin_path($plugin . '/public'), $pluginPath . '/' . $plugin);
        }

        return [
            'error'   => false,
            'message' => trans('packages/plugin-management::plugin.published_assets_success', ['name' => $plugin]),
        ];
    }

    /**
     * @param string $plugin
     * @return array
     * @throws FileNotFoundException
     */
    public function remove(string $plugin): array
    {
        $validate = $this->validate($plugin);

        if ($validate['error']) {
            return $validate;
        }

        $this->deactivate($plugin);

        $location = plugin_path($plugin);

        if ($this->files->exists($location . '/plugin.json')) {
            $content = get_file_data($location . '/plugin.json');

            if (!empty($content)) {
                if (!class_exists($content['provider'])) {
                    $loader = new ClassLoader;
                    $loader->setPsr4($content['namespace'], plugin_path($plugin . '/src'));
                    $loader->register(true);
                }

                Schema::disableForeignKeyConstraints();
                if (class_exists($content['namespace'] . 'Plugin')) {
                    call_user_func([$content['namespace'] . 'Plugin', 'remove']);
                }
                Schema::enableForeignKeyConstraints();
            }
        }

        $migrations = [];
        foreach (scan_folder($location . '/database/migrations') as $file) {
            $migrations[] = pathinfo($file, PATHINFO_FILENAME);
        }

        DB::table('migrations')->whereIn('migration', $migrations)->delete();

        $this->files->deleteDirectory($location);

        if (empty($this->files->directories(plugin_path()))) {
            $this->files->deleteDirectory(plugin_path());
        }

        Helper::removeModuleFiles($plugin, 'plugins');

        if (class_exists($content['namespace'] . 'Plugin')) {
            call_user_func([$content['namespace'] . 'Plugin', 'removed']);
        }

        Helper::clearCache();

        return [
            'error'   => false,
            'message' => trans('packages/plugin-management::plugin.plugin_removed'),
        ];
    }

    /**
     * @param string $plugin
     * @return array
     * @throws FileNotFoundException
     */
    public function deactivate(string $plugin): array
    {
        $validate = $this->validate($plugin);

        if ($validate['error']) {
            return $validate;
        }

        $content = get_file_data(plugin_path($plugin) . '/plugin.json');
        if (empty($content)) {
            return [
                'error'   => true,
                'message' => trans('packages/plugin-management::plugin.invalid_json'),
            ];
        }

        if (!class_exists($content['provider'])) {
            $loader = new ClassLoader;
            $loader->setPsr4($content['namespace'], plugin_path($plugin . '/src'));
            $loader->register(true);
        }

        $activatedPlugins = get_active_plugins();
        if (in_array($plugin, $activatedPlugins)) {
            if (class_exists($content['namespace'] . 'Plugin')) {
                call_user_func([$content['namespace'] . 'Plugin', 'deactivate']);
            }
            if (($key = array_search($plugin, $activatedPlugins)) !== false) {
                unset($activatedPlugins[$key]);
            }
            $this->settingStore
                ->set('activated_plugins', json_encode(array_values($activatedPlugins)))
                ->save();

            if (class_exists($content['namespace'] . 'Plugin')) {
                call_user_func([$content['namespace'] . 'Plugin', 'deactivated']);
            }

            Helper::clearCache();

            return [
                'error'   => false,
                'message' => trans('packages/plugin-management::plugin.deactivated_success'),
            ];
        }

        return [
            'error'   => true,
            'message' => trans('packages/plugin-management::plugin.deactivated_already'),
        ];
    }
}
