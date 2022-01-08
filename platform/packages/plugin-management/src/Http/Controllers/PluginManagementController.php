<?php

namespace Botble\PluginManagement\Http\Controllers;

use Assets;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\PluginManagement\Services\PluginService;
use Exception;
use File;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Arr;
use Illuminate\View\View;

class PluginManagementController extends Controller
{
    /**
     * Show all plugins in system
     * @return Application|Factory|View
     */
    public function index()
    {
        page_title()->setTitle(trans('packages/plugin-management::plugin.plugins'));

        Assets::addScriptsDirectly('vendor/core/packages/plugin-management/js/plugin.js')
            ->addStylesDirectly('vendor/core/packages/plugin-management/css/plugin.css');

        $list = [];

        if (File::exists(plugin_path('.DS_Store'))) {
            File::delete(plugin_path('.DS_Store'));
        }

        $plugins = scan_folder(plugin_path());
        if (!empty($plugins)) {
            $installed = get_active_plugins();
            foreach ($plugins as $plugin) {
                if (File::exists(plugin_path($plugin . '/.DS_Store'))) {
                    File::delete(plugin_path($plugin . '/.DS_Store'));
                }

                $pluginPath = plugin_path($plugin);
                if (!File::isDirectory($pluginPath) || !File::exists($pluginPath . '/plugin.json')) {
                    continue;
                }

                $content = get_file_data($pluginPath . '/plugin.json');
                if (!empty($content)) {
                    if (!is_array($installed) || !in_array($plugin, $installed)) {
                        $content['status'] = 0;
                    } else {
                        $content['status'] = 1;
                    }

                    $content['path'] = $plugin;
                    $content['image'] = null;
                    if (File::exists($pluginPath . '/screenshot.png')) {
                        $content['image'] = base64_encode(File::get($pluginPath . '/screenshot.png'));
                    }
                    $list[] = (object)$content;
                }
            }
        }

        return view('packages/plugin-management::index', compact('list'));
    }

    /**
     * Activate or Deactivate plugin
     *
     * @param Request $request
     * @param BaseHttpResponse $response
     * @param PluginService $pluginService
     * @return BaseHttpResponse
     */
    public function update(Request $request, BaseHttpResponse $response, PluginService $pluginService)
    {
        $plugin = strtolower($request->input('name'));

        $content = get_file_data(plugin_path($plugin . '/plugin.json'));
        if (empty($content)) {
            return $response
                ->setError()
                ->setMessage(trans('packages/plugin-management::plugin.invalid_plugin'));
        }

        try {
            $activatedPlugins = get_active_plugins();
            if (!in_array($plugin, $activatedPlugins)) {
                if (!empty(Arr::get($content, 'require'))) {
                    if (count(array_intersect($content['require'], $activatedPlugins)) != count($content['require'])) {
                        return $response
                            ->setError()
                            ->setMessage(trans('packages/plugin-management::plugin.missing_required_plugins', [
                                'plugins' => implode(',', $content['require']),
                            ]));
                    }
                }

                $result = $pluginService->activate($plugin);

                $migrator = app('migrator');
                $migrator->run(database_path('migrations'));

                $paths = [
                    core_path(),
                    package_path(),
                ];

                foreach ($paths as $path) {
                    foreach (scan_folder($path) as $module) {

                        $modulePath = $path . '/' . $module;

                        if (File::isDirectory($modulePath . '/database/migrations')) {
                            $migrator->run($modulePath . '/database/migrations');
                        }
                    }
                }
            } else {
                $result = $pluginService->deactivate($plugin);
            }

            if ($result['error']) {
                return $response->setError()->setMessage($result['message']);
            }

            return $response->setMessage(trans('packages/plugin-management::plugin.update_plugin_status_success'));
        } catch (Exception $exception) {
            return $response
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    /**
     * Remove plugin
     *
     * @param string $plugin
     * @param BaseHttpResponse $response
     * @param PluginService $pluginService
     * @return BaseHttpResponse
     */
    public function destroy($plugin, BaseHttpResponse $response, PluginService $pluginService)
    {
        $plugin = strtolower($plugin);

        try {
            $result = $pluginService->remove($plugin);

            if ($result['error']) {
                return $response->setError()->setMessage($result['message']);
            }

            return $response->setMessage(trans('packages/plugin-management::plugin.remove_plugin_success'));
        } catch (Exception $exception) {
            return $response
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }
}
