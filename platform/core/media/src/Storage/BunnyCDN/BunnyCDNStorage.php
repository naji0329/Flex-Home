<?php

namespace Botble\Media\Storage\BunnyCDN;

use Botble\Media\Storage\BunnyCDN\Exceptions\BunnyCDNStorageAuthenticationException;
use Botble\Media\Storage\BunnyCDN\Exceptions\BunnyCDNStorageException;
use Botble\Media\Storage\BunnyCDN\Exceptions\BunnyCDNStorageFileNotFoundException;

class BunnyCDNStorage
{
    /**
     * @var string The name of the storage zone we are working on
     */
    public $storageZoneName = '';

    /**
     * @var string The API access key used for authentication
     */
    public $apiAccessKey = '';

    /**
     * @var string The region used for the request
     */
    public $storageZoneRegion = 'de';

    /**
     * Initializes a new instance of the BunnyCDNStorage class
     *
     * @param $storageZoneName
     * @param $apiAccessKey
     * @param $storageZoneRegion
     */
    public function __construct($storageZoneName, $apiAccessKey, $storageZoneRegion)
    {
        $this->storageZoneName = $storageZoneName;
        $this->apiAccessKey = $apiAccessKey;
        $this->storageZoneRegion = $storageZoneRegion;
    }

    /**
     * Get the list of storage objects on the given path
     *
     * @param $path
     * @return mixed
     * @throws BunnyCDNStorageException
     */
    public function getStorageObjects($path)
    {
        $normalizedPath = $this->normalizePath($path, true);

        return json_decode($this->sendHttpRequest($normalizedPath));
    }

    /**
     * Normalize a path string
     *
     * @param $path
     * @param null $isDirectory
     * @return false|string|string[]
     * @throws BunnyCDNStorageException
     */
    protected function normalizePath($path, $isDirectory = null)
    {
        if (!Util::startsWith($path, '/' . $this->storageZoneName . '/') && !Util::startsWith($path,
                $this->storageZoneName . '/')) {
            throw new BunnyCDNStorageException('Path validation failed. File path must begin with ' . '/' . $this->storageZoneName . '/');
        }

        $path = str_replace('\\', '/', $path);
        if ($isDirectory !== null) {
            if ($isDirectory) {
                if (!Util::endsWith($path, '/')) {
                    $path = $path . '/';
                }
            } else {
                if (Util::endsWith($path, '/') && $path !== '/') {
                    throw new BunnyCDNStorageException('The requested path is invalid.');
                }
            }
        }

        // Remove double slashes
        while (strpos($path, '//') !== false) {
            $path = str_replace('//', '/', $path);
        }

        // Remove the starting slash
        if (strpos($path, '/') === 0) {
            $path = substr($path, 1);
        }

        return $path;
    }

    /**
     * Sends a HTTP Request using cURL
     *
     * @param string $url
     * @param string $method
     * @param null $uploadFile
     * @param null $uploadFileSize
     * @param null $downloadFileHandler
     * @return bool|string
     * @throws BunnyCDNStorageException
     */
    public function sendHttpRequest(
        $url,
        $method = 'GET',
        $uploadFile = null,
        $uploadFileSize = null,
        $downloadFileHandler = null
    ) {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->getBaseUrl() . $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 0);
        curl_setopt($ch, CURLOPT_FAILONERROR, 0);

        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'AccessKey: ' . $this->apiAccessKey,
        ]);

        if ($method === 'PUT' && $uploadFile != null) {
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_UPLOAD, 1);
            curl_setopt($ch, CURLOPT_INFILE, $uploadFile);
            curl_setopt($ch, CURLOPT_INFILESIZE, $uploadFileSize);
        } elseif ($method !== 'GET') {
            curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $method);
        }

        if ($method === 'GET' && $downloadFileHandler != null) {
            curl_setopt($ch, CURLOPT_FILE, $downloadFileHandler);
        }

        $output = curl_exec($ch);
        $curlError = curl_errno($ch);
        $responseCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        if ($curlError) {
            throw new BunnyCDNStorageException('An unknown error has occurred during the request. Status code: ' . $curlError);
        }

        if ($responseCode === 404) {
            throw new BunnyCDNStorageFileNotFoundException($url);
        } elseif ($responseCode === 401) {
            throw new BunnyCDNStorageAuthenticationException($this->storageZoneName, $this->apiAccessKey);
        } elseif ($responseCode < 200 || $responseCode > 299) {
            throw new BunnyCDNStorageException('An unknown error has occurred during the request. Status code: ' . $responseCode);
        }

        return $output;
    }

    /**
     * Returns the base URL with the endpoint based on the current storage zone region
     *
     * @return string
     */
    public function getBaseUrl()
    {
        return $this->storageZoneRegion === 'de' || !$this->storageZoneRegion
            ? 'https://storage.bunnycdn.com/'
            : 'https://' . $this->storageZoneRegion . '.storage.bunnycdn.com/';
    }

    /**
     * Delete an object at the given path. If the object is a directory, the contents will also be deleted.
     *
     * @param $path
     * @return bool|string
     * @throws BunnyCDNStorageException
     */
    public function deleteObject($path)
    {
        $normalizedPath = $this->normalizePath($path);

        return $this->sendHttpRequest($normalizedPath, 'DELETE');
    }

    /**
     * Upload a local file to the storage
     *
     * @param $localPath
     * @param $path
     * @return bool|string
     * @throws BunnyCDNStorageException
     */
    public function uploadFile($localPath, $path)
    {
        // Open the local file
        $fileStream = fopen($localPath, 'r');
        if ($fileStream === false) {
            throw new BunnyCDNStorageException('The local file could not be opened.');
        }

        $dataLength = filesize($localPath);
        $normalizedPath = $this->normalizePath($path);

        return $this->sendHttpRequest($normalizedPath, 'PUT', $fileStream, $dataLength);
    }

    /**
     * Download the object to a local file
     *
     * @param $path
     * @param $localPath
     * @return bool|string
     * @throws BunnyCDNStorageException
     */
    public function downloadFile($path, $localPath)
    {
        // Open the local file
        $fileStream = fopen($localPath, 'w+');
        if ($fileStream === false) {
            throw new BunnyCDNStorageException('The local file could not be opened for writing.');
        }

        $normalizedPath = $this->normalizePath($path);

        return $this->sendHttpRequest($normalizedPath, 'GET', null, null, $fileStream);
    }
}
