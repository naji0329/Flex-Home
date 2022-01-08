<?php

namespace Botble\Base\Supports;

use Artisan;
use Cache;
use Eloquent;
use Exception;
use File;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\Schema;
use Request;

class Helper
{
    /**
     * Load helpers from a directory
     * @param string $directory
     * @since 2.0
     */
    public static function autoload(string $directory): void
    {
        $helpers = File::glob($directory . '/*.php');
        foreach ($helpers as $helper) {
            File::requireOnce($helper);
        }
    }

    /**
     * @param Eloquent | Model $object
     * @param string $sessionName
     * @return bool
     */
    public static function handleViewCount(Eloquent $object, $sessionName): bool
    {
        if (!array_key_exists($object->id, session()->get($sessionName, []))) {
            try {
                $object->increment('views');
                session()->put($sessionName . '.' . $object->id, time());
                return true;
            } catch (Exception $exception) {
                return false;
            }
        }

        return false;
    }

    /**
     * Format Log data
     *
     * @param array $input
     * @param string $line
     * @param string $function
     * @param string $class
     * @return array
     */
    public static function formatLog($input, $line = '', $function = '', $class = ''): array
    {
        return array_merge($input, [
            'user_id'   => Auth::check() ? Auth::id() : 'System',
            'ip'        => Request::ip(),
            'line'      => $line,
            'function'  => $function,
            'class'     => $class,
            'userAgent' => Request::header('User-Agent'),
        ]);
    }

    /**
     * @param string $module
     * @param string $type
     * @return boolean
     */
    public static function removeModuleFiles(string $module, $type = 'packages'): bool
    {
        $folders = [
            public_path('vendor/core/' . $type . '/' . $module),
            resource_path('assets/' . $type . '/' . $module),
            resource_path('views/vendor/' . $type . '/' . $module),
            resource_path('lang/vendor/' . $type . '/' . $module),
            config_path($type . '/' . $module),
        ];

        foreach ($folders as $folder) {
            if (File::isDirectory($folder)) {
                File::deleteDirectory($folder);
            }
        }

        return true;
    }

    /**
     * @param string $command
     * @param array $parameters
     * @param null $outputBuffer
     * @return bool|int
     * @throws Exception
     * @deprecated since v5.5, will be removed in v5.7
     */
    public static function executeCommand(string $command, array $parameters = [], $outputBuffer = null): bool
    {
        if (!function_exists('proc_open')) {
            if (config('app.debug') && config('core.base.general.can_execute_command')) {
                throw new Exception(trans('core/base::base.proc_close_disabled_error'));
            }
            return false;
        }

        if (config('core.base.general.can_execute_command')) {
            return Artisan::call($command, $parameters, $outputBuffer);
        }

        return false;
    }

    /**
     * @return bool
     */
    public static function isConnectedDatabase(): bool
    {
        try {
            return Schema::hasTable('settings');
        } catch (Exception $exception) {
            return false;
        }
    }

    /**
     * @return bool
     */
    public static function clearCache(): bool
    {
        Event::dispatch('cache:clearing');

        try {
            Cache::flush();
            if (!File::exists($storagePath = storage_path('framework/cache'))) {
                return true;
            }

            foreach (File::files($storagePath) as $file) {
                if (preg_match('/facade-.*\.php$/', $file)) {
                    File::delete($file);
                }
            }
        } catch (Exception $exception) {
            info($exception->getMessage());
        }

        Event::dispatch('cache:cleared');

        return true;
    }

    /**
     * @return bool
     */
    public static function isActivatedLicense(): bool
    {
        if (!File::exists(storage_path('.license'))) {
            return false;
        }

        $coreApi = new Core;

        $result = $coreApi->verifyLicense(true);

        if (!$result['status']) {
            return false;
        }

        return true;
    }

    /**
     * @param string $countryCode
     * @return string
     */
    public static function getCountryNameByCode(?string $countryCode): ?string
    {
        if (empty($countryCode)) {
            return null;
        }

        return Arr::get(self::countries(), $countryCode, $countryCode);
    }

    /**
     * @return string[]
     */
    public static function countries(): array
    {
        return config('core.base.general.countries', []);
    }

    /**
     * @return bool|string
     */
    public static function getIpFromThirdParty()
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, 'http://ipecho.net/plain');
        curl_setopt($curl, CURLOPT_HEADER, 0);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 10);
        curl_setopt($curl, CURLOPT_TIMEOUT, 10);
        $response = curl_exec($curl);

        $httpStatus = curl_getinfo($curl, CURLINFO_HTTP_CODE);

        curl_close($curl);

        if ($httpStatus == 200) {
            return $response ?: Request::ip();
        }

        return Request::ip();
    }

    /**
     * @param string $setting
     * @return bool
     */
    public static function isIniValueChangeable(string $setting): bool
    {
        static $iniAll;

        if (!isset($iniAll)) {
            $iniAll = false;
            // Sometimes `ini_get_all()` is disabled via the `disable_functions` option for "security purposes".
            if (function_exists('ini_get_all')) {
                $iniAll = ini_get_all();
            }
        }

        // Bit operator to workaround https://bugs.php.net/bug.php?id=44936 which changes access level to 63 in PHP 5.2.6 - 5.2.17.
        if (isset($iniAll[$setting]['access']) && (INI_ALL === ($iniAll[$setting]['access'] & 7) || INI_USER === ($iniAll[$setting]['access'] & 7))) {
            return true;
        }

        // If we were unable to retrieve the details, fail gracefully to assume it's changeable.
        if (!is_array($iniAll)) {
            return true;
        }

        return false;
    }

    /**
     * @param int $value
     * @return int
     */
    public static function convertHrToBytes($value)
    {
        $value = strtolower(trim($value));
        $bytes = (int)$value;

        if (false !== strpos($value, 'g')) {
            $bytes *= 1024 * 1024 * 1024;
        } elseif (false !== strpos($value, 'm')) {
            $bytes *= 1024 * 1024;
        } elseif (false !== strpos($value, 'k')) {
            $bytes *= 1024;
        }

        // Deal with large (float) values which run into the maximum integer size.
        return min($bytes, PHP_INT_MAX);
    }
}
