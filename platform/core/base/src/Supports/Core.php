<?php

namespace Botble\Base\Supports;

use BaseHelper;
use Botble\Base\Supports\PclZip as Zip;
use Botble\Theme\Services\ThemeService;
use Exception;
use GuzzleHttp\Client;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\File;
use Menu;
use Theme;
use ZipArchive;

class Core
{

    /**
     * @var string
     */
    protected $productId;

    /**
     * @var string
     */
    protected $apiUrl;

    /**
     * @var string
     */
    protected $apiKey;

    /**
     * @var string
     */
    protected $verifyType;

    /**
     * @var int
     */
    protected $verificationPeriod;

    /**
     * @var string
     */
    protected $currentVersion;

    /**
     * @var string
     */
    protected $rootPath;

    /**
     * @var string
     */
    protected $licenseFile;

    /**
     * @var bool
     */
    protected $showUpdateProcess = true;

    /**
     * @var string
     */
    protected $sessionKey = '44622179e10cab6';

    /**
     * Core constructor.
     */
    public function __construct()
    {
        $this->apiUrl = 'https://license.botble.com';
        $this->apiKey = 'CAF4B17F6D3F656125F9';
        $this->currentVersion = get_cms_version();
        $this->verificationPeriod = 1;
        $this->rootPath = base_path();
        $this->licenseFile = storage_path('.license');

        $core = get_file_data(core_path('core.json'));

        if ($core) {
            $this->productId = Arr::get($core, 'productId');
            $this->verifyType = Arr::get($core, 'source');
            $this->apiUrl = Arr::get($core, 'apiUrl', $this->apiUrl);
            $this->apiKey = Arr::get($core, 'apiKey', $this->apiKey);
            $this->currentVersion = Arr::get($core, 'version', $this->currentVersion);
        }

        $this->apiUrl = rtrim($this->apiUrl, '/');
    }

    /**
     * @return string
     */
    public function getCurrentVersion()
    {
        return $this->currentVersion;
    }

    /**
     * @return string
     */
    public function getLicenseFilePath()
    {
        return $this->licenseFile;
    }

    /**
     * @return array
     */
    public function checkConnection()
    {
        $dataArray = [];
        $getData = $this->callApi(
            $this->apiUrl . '/api/check_connection_ext',
            $dataArray
        );

        return $getData;
    }

    /**
     * @param string $url
     * @param string $data
     * @return array
     */
    protected function callApi(string $url, array $data = [])
    {
        $client = new Client(['verify' => false]);

        try {
            $result = $client->post($url, [
                'headers' => [
                    'Content-Type' => 'application/json',
                    'Accept'       => 'application/json',
                    'LB-API-KEY'   => $this->apiKey,
                    'LB-URL'       => rtrim(url('/'), '/'),
                    'LB-IP'        => Helper::getIpFromThirdParty(),
                    'LB-LANG'      => 'english',
                ],
                'json'    => $data,
            ]);
        } catch (Exception $exception) {
            return [
                'status'  => false,
                'message' => $exception->getMessage(),
            ];
        }

        if (!$result && config('app.debug')) {
            return [
                'status'  => false,
                'message' => 'Server is unavailable at the moment, please try again.',
            ];
        }

        $result = json_decode($result->getBody(), true);

        if (!$result['status']) {
            if (config('app.debug')) {
                return $result;
            }

            return [
                'status'  => false,
                'message' => 'Server returned an invalid response, please contact support.',
            ];
        }

        return $result;
    }

    /**
     * @return array
     */
    public function getLatestVersion()
    {
        return $this->callApi(
            $this->apiUrl . '/api/latest_version',
            [
                'product_id' => $this->productId,
            ]
        );
    }

    /**
     * @param string $license
     * @param string $client
     * @param bool $createLicense
     * @return array
     */
    public function activateLicense($license, $client, $createLicense = true)
    {
        $data = [
            'product_id'   => $this->productId,
            'license_code' => $license,
            'client_name'  => $client,
            'verify_type'  => $this->verifyType,
        ];

        try {
            $response = $this->callApi($this->apiUrl . '/api/activate_license', $data);

            if (!empty($createLicense)) {
                if ($response['status']) {
                    $license = trim($response['lic_response']);
                    file_put_contents($this->licenseFile, $license, LOCK_EX);
                } else {
                    @chmod($this->licenseFile, 0777);
                    if (is_writeable($this->licenseFile)) {
                        unlink($this->licenseFile);
                    }
                }
            }

            return $response;
        } catch (Exception $exception) {
            return [
                'status' => false,
                'message' => $exception->getMessage(),
            ];
        }
    }

    /**
     * @param bool $timeBasedCheck
     * @param bool $license
     * @param bool $client
     * @return array
     */
    public function verifyLicense($timeBasedCheck = false, $license = false, $client = false)
    {
        $data = [
            'product_id'   => $this->productId,
            'license_file' => null,
            'license_code' => null,
            'client_name'  => null,
        ];

        if (!empty($license) && !empty($client)) {
            $data = [
                'product_id'   => $this->productId,
                'license_file' => null,
                'license_code' => $license,
                'client_name'  => $client,
            ];
        } elseif ($this->checkLocalLicenseExist()) {
            $data = [
                'product_id'   => $this->productId,
                'license_file' => file_get_contents($this->licenseFile),
                'license_code' => null,
                'client_name'  => null,
            ];
        }

        $response = [
            'status'  => true,
            'message' => 'Verified! Thanks for purchasing our product.',
        ];

        if ($timeBasedCheck && $this->verificationPeriod > 0) {
            $type = $this->verificationPeriod;
            $today = date('d-m-Y');
            if (!session($this->sessionKey)) {
                session([$this->sessionKey => '00-00-0000']);
            }
            $typeText = $type . ' days';

            if ($type == 1) {
                $typeText = '1 day';
            } elseif ($type == 3) {
                $typeText = '3 days';
            } elseif ($type == 7) {
                $typeText = '1 week';
            }

            if (strtotime($today) >= strtotime(session($this->sessionKey))) {
                $response = $this->callApi($this->apiUrl . '/api/verify_license', $data);
                if ($response['status'] == true) {
                    $tomorrow = date('d-m-Y', strtotime($today . ' + ' . $typeText));
                    session([$this->sessionKey => $tomorrow]);
                }
            }

            return $response;
        }

        return $this->callApi($this->apiUrl . '/api/verify_license', $data);
    }

    /**
     * @return bool
     */
    public function checkLocalLicenseExist()
    {
        return is_file($this->licenseFile);
    }

    /**
     * @param bool $license
     * @param bool $client
     * @return array
     */
    public function deactivateLicense($license = false, $client = false)
    {
        $data = [];

        if (!empty($license) && !empty($client)) {
            $data = [
                'product_id'   => $this->productId,
                'license_file' => null,
                'license_code' => $license,
                'client_name'  => $client,
            ];
        } elseif (is_file($this->licenseFile)) {
            $data = [
                'product_id'   => $this->productId,
                'license_file' => file_get_contents($this->licenseFile),
                'license_code' => null,
                'client_name'  => null,
            ];
        }

        $response = $this->callApi($this->apiUrl . '/api/deactivate_license', $data);

        if ($response['status']) {
            session()->forget($this->sessionKey);
            @chmod($this->licenseFile, 0777);
            if (is_writeable($this->licenseFile)) {
                unlink($this->licenseFile);
            }
        }

        return $response;
    }

    /**
     * @return array
     */
    public function checkUpdate()
    {
        return $this->callApi(
            $this->apiUrl . '/api/check_update',
            [
                'product_id'      => $this->productId,
                'current_version' => $this->currentVersion,
            ]
        );
    }

    /**
     * @param string $updateId
     * @param string $version
     * @param bool $license
     * @param bool $client
     */
    public function downloadUpdate($updateId, $version, $license = false, $client = false)
    {
        if (!empty($license) && !empty($client)) {
            $dataArray = [
                'license_file' => null,
                'license_code' => $license,
                'client_name'  => $client,
            ];
        } elseif (is_file($this->licenseFile)) {
            $dataArray = [
                'license_file' => file_get_contents($this->licenseFile),
                'license_code' => null,
                'client_name'  => null,
            ];
        } else {
            $dataArray = [];
        }

        ob_end_flush();
        ob_implicit_flush(true);
        $version = str_replace('.', '_', $version);
        ob_start();
        $sourceSize = $this->apiUrl . '/api/get_update_size/main/' . $updateId;
        echo 'Preparing to download main update...' . '<br>';

        if ($this->showUpdateProcess) {
            echo '<script>document.getElementById(\'prog\').value = 1;</script>';
        }

        ob_flush();
        echo 'Main Update size: ' . $this->getRemoteFileSize($sourceSize) . ' (Please do not refresh the page).<br>';
        if ($this->showUpdateProcess) {
            echo '<script>document.getElementById(\'prog\').value = 5;</script>';
        }

        ob_flush();
        $ch = curl_init();
        $source = $this->apiUrl . '/api/download_update/main/' . $updateId;
        curl_setopt($ch, CURLOPT_URL, $source);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $dataArray);

        $thisServerSame = request()->server('SERVER_NAME') ?: request()->server('HTTP_HOST');

        $thisHttpOrHttps = request()->server('HTTPS') == 'on' || request()->server('HTTP_X_FORWARDED_PROTO') == 'https'
            ? 'https://' : 'http://';

        $thisUrl = $thisHttpOrHttps . $thisServerSame . request()->server('REQUEST_URI');
        $thisIp = request()->server('SERVER_ADDR') ?: Helper::getIpFromThirdParty() ?: gethostbyname(gethostname());

        curl_setopt($ch, CURLOPT_HTTPHEADER, [
                'LB-API-KEY: ' . $this->apiKey,
                'LB-URL: ' . $thisUrl,
                'LB-IP: ' . $thisIp,
                'LB-LANG: ' . 'english',
            ]
        );

        if ($this->showUpdateProcess) {
            curl_setopt($ch, CURLOPT_PROGRESSFUNCTION, [$this, 'progress']);
        }

        if ($this->showUpdateProcess) {
            curl_setopt($ch, CURLOPT_NOPROGRESS, false);
        }

        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30);
        echo 'Downloading main update...<br>';

        if ($this->showUpdateProcess) {
            echo '<script>document.getElementById(\'prog\').value = 10;</script>';
        }

        ob_flush();
        $data = curl_exec($ch);
        $httpStatus = curl_getinfo($ch, CURLINFO_HTTP_CODE);

        $error = false;
        if ($httpStatus != 200) {
            if ($httpStatus == 401) {
                curl_close($ch);
                echo '<br><span class="text-danger">Your update period has ended or your license is invalid, please contact support.</span>';
                $error = true;
            } else {
                curl_close($ch);
                echo '<br><span class="text-danger">Server returned an invalid response, please contact support.</span>';
                $error = true;
            }
        }

        if ($error) {
            ob_flush();
            ob_end_flush();
        } else {
            curl_close($ch);
            $destination = $this->rootPath . '/update_main_' . $version . '.zip';
            $file = fopen($destination, 'w+');

            if (!$file) {
                echo '<br><span class="text-danger">Folder does not have write permission or the update file path could not be resolved, please contact support.</span>';
                ob_flush();
                ob_end_flush();
            } else {
                fputs($file, $data);
                fclose($file);

                if ($this->showUpdateProcess) {
                    echo '<script>document.getElementById(\'prog\').value = 65;</script>';
                }

                ob_flush();
                if (class_exists('ZipArchive', false)) {
                    $zip = new ZipArchive;
                    $res = $zip->open($destination);
                    if ($res === true) {
                        $zip->extractTo($this->rootPath . '/');
                        $zip->close();
                        unlink($destination);
                        echo 'Main update files downloaded and extracted.<br><br>';
                        if ($this->showUpdateProcess) {
                            echo '<script>document.getElementById(\'prog\').value = 75;</script>';
                        }
                        ob_flush();
                    } else {
                        echo 'Update zip extraction failed.<br><br>';
                        ob_flush();
                    }
                } else {
                    $archive = new Zip($destination);
                    $archive->extract(PCLZIP_OPT_PATH, $this->rootPath . '/');

                    unlink($destination);
                    echo 'Main update files downloaded and extracted.<br><br>';
                    if ($this->showUpdateProcess) {
                        echo '<script>document.getElementById(\'prog\').value = 75;</script>';
                    }
                    ob_flush();
                }

                $migrator = app('migrator');

                $migrator->run(database_path('migrations'));

                $paths = [
                    core_path(),
                    package_path(),
                    plugin_path(),
                ];

                foreach ($paths as $path) {
                    foreach (scan_folder($path) as $module) {

                        if ($path == plugin_path() && !is_plugin_active($module)) {
                            continue;
                        }

                        $modulePath = $path . '/' . $module;

                        if (!File::isDirectory($modulePath)) {
                            continue;
                        }

                        $publishedPath = 'vendor/core/' . File::basename($path);

                        if (!File::isDirectory($publishedPath)) {
                            File::makeDirectory($publishedPath, 0755, true);
                        }

                        if (File::isDirectory($modulePath . '/public')) {
                            File::copyDirectory($modulePath . '/public', $publishedPath . '/' . $module);
                        }

                        if (File::isDirectory($modulePath . '/database/migrations')) {
                            $migrator->run($modulePath . '/database/migrations');
                        }
                    }
                }

                File::delete(theme_path(Theme::getThemeName() . '/public/css/style.integration.css'));

                $customCSS = Theme::getStyleIntegrationPath();

                if (File::exists($customCSS)) {
                    File::copy($customCSS, storage_path('app/style.integration.css.' . time()));
                }

                app(ThemeService::class)->publishAssets();

                Helper::clearCache();
                Menu::clearCacheMenuItems();

                foreach (File::glob(config('view.compiled') . '/*') as $view) {
                    File::delete($view);
                }

                File::delete(app()->getCachedConfigPath());
                File::delete(app()->getCachedRoutesPath());
                File::delete(base_path('bootstrap/cache/packages.php'));
                File::delete(base_path('bootstrap/cache/services.php'));
                File::deleteDirectory(storage_path('app/purifier'));

                if ($this->showUpdateProcess) {
                    echo '<script>document.getElementById(\'prog\').value = 100;</script>';
                }

                echo 'Update database successfully!';
                ob_flush();
                ob_end_flush();
            }
        }
    }

    /**
     * @param string $url
     * @return string
     */
    protected function getRemoteFileSize($url)
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_HEADER, true);
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_NOBODY, true);

        $thisServerSame = request()->server('SERVER_NAME') ?: request()->server('HTTP_HOST');

        $thisHttpOrHttps = request()->server('HTTPS') == 'on' || request()->server('HTTP_X_FORWARDED_PROTO') == 'https'
            ? 'https://' : 'http://';

        $thisUrl = $thisHttpOrHttps . $thisServerSame . request()->server('REQUEST_URI');
        $thisIp = request()->server('SERVER_ADDR') ?: Helper::getIpFromThirdParty() ?: gethostbyname(gethostname());

        curl_setopt($curl, CURLOPT_HTTPHEADER, [
                'LB-API-KEY: ' . $this->apiKey,
                'LB-URL: ' . $thisUrl,
                'LB-IP: ' . $thisIp,
                'LB-LANG: ' . 'english',
            ]
        );
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 30);
        curl_exec($curl);

        $filesize = curl_getinfo($curl, CURLINFO_CONTENT_LENGTH_DOWNLOAD);

        if ($filesize) {
            return BaseHelper::humanFilesize($filesize);
        }

        return -1;
    }

    protected function progress($resource, $downloadSize, $downloaded)
    {
        static $prev = 0;
        if ($downloadSize == 0) {
            $progress = 0;
        } else {
            $progress = round($downloaded * 100 / $downloadSize);
        }

        if (($progress != $prev) && ($progress == 25)) {
            $prev = $progress;
            echo '<script>document.getElementById(\'prog\').value = 22.5;</script>';
            ob_flush();
        }

        if (($progress != $prev) && ($progress == 50)) {
            $prev = $progress;
            echo '<script>document.getElementById(\'prog\').value = 35;</script>';
            ob_flush();
        }

        if (($progress != $prev) && ($progress == 75)) {
            $prev = $progress;
            echo '<script>document.getElementById(\'prog\').value = 47.5;</script>';
            ob_flush();
        }

        if (($progress != $prev) && ($progress == 100)) {
            $prev = $progress;
            echo '<script>document.getElementById(\'prog\').value = 60;</script>';
            ob_flush();
        }
    }
}
