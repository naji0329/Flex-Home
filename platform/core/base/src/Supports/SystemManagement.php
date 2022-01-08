<?php

namespace Botble\Base\Supports;

use App;
use File;
use Illuminate\Contracts\Filesystem\FileNotFoundException;
use Request;

class SystemManagement
{
    /**
     * Get the Composer file contents as an array
     * @return array
     * @throws FileNotFoundException
     */
    public static function getComposerArray()
    {
        return get_file_data(base_path('composer.json'));
    }

    /**
     * Get Installed packages & their Dependencies
     *
     * @param array $packagesArray
     * @return array
     */
    public static function getPackagesAndDependencies(array $packagesArray): array
    {
        $packages = [];
        foreach ($packagesArray as $key => $value) {
            $packageFile = base_path('vendor/' . $key . '/composer.json');

            if ($key !== 'php' && File::exists($packageFile)) {
                $json2 = file_get_contents($packageFile);
                $dependenciesArray = json_decode($json2, true);
                $dependencies = array_key_exists('require', $dependenciesArray) ?
                    $dependenciesArray['require'] : 'No dependencies';
                $devDependencies = array_key_exists('require-dev', $dependenciesArray) ?
                    $dependenciesArray['require-dev'] : 'No dependencies';

                $packages[] = [
                    'name'             => $key,
                    'version'          => $value,
                    'dependencies'     => $dependencies,
                    'dev-dependencies' => $devDependencies,
                ];
            }
        }

        return $packages;
    }

    /**
     * Get System environment details
     *
     * @return array
     */
    public static function getSystemEnv(): array
    {
        return [
            'version'              => App::version(),
            'timezone'             => config('app.timezone'),
            'debug_mode'           => config('app.debug'),
            'storage_dir_writable' => File::isWritable(base_path('storage')),
            'cache_dir_writable'   => File::isReadable(base_path('bootstrap/cache')),
            'app_size'             => human_file_size(self::folderSize(base_path())),
        ];
    }

    /**
     * Get the system app's size
     *
     * @param string $directory
     * @return int
     */
    protected static function folderSize($directory): int
    {
        $size = 0;
        foreach (File::glob(rtrim($directory, '/') . '/*', GLOB_NOSORT) as $each) {
            $size += File::isFile($each) ? File::size($each) : self::folderSize($each);
        }

        return $size;
    }

    /**
     * Get PHP/Server environment details
     * @return array
     */
    public static function getServerEnv(): array
    {
        return [
            'version'                  => phpversion(),
            'server_software'          => Request::server('SERVER_SOFTWARE'),
            'server_os'                => function_exists('php_uname') ? php_uname() : 'N/A',
            'database_connection_name' => config('database.default'),
            'ssl_installed'            => self::checkSslIsInstalled(),
            'cache_driver'             => config('cache.default'),
            'session_driver'           => config('session.driver'),
            'queue_connection'         => config('queue.default'),
            'mbstring'                 => extension_loaded('mbstring'),
            'openssl'                  => extension_loaded('openssl'),
            'curl'                     => extension_loaded('curl'),
            'exif'                     => extension_loaded('exif'),
            'pdo'                      => extension_loaded('pdo'),
            'fileinfo'                 => extension_loaded('fileinfo'),
            'tokenizer'                => extension_loaded('tokenizer'),
            'imagick_or_gd'            => extension_loaded('imagick') || extension_loaded('gd'),
            'zip'                      => extension_loaded('zip'),
        ];
    }

    /**
     * Check if SSL is installed or not
     * @return boolean
     */
    protected static function checkSslIsInstalled(): bool
    {
        return !empty(Request::server('HTTPS')) && Request::server('HTTPS') != 'off';
    }
}
