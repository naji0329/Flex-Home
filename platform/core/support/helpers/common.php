<?php

use Carbon\Carbon;

if (!function_exists('format_time')) {
    /**
     * @param Carbon $timestamp
     * @param string $format
     * @return string
     */
    function format_time(Carbon $timestamp, $format = 'j M Y H:i')
    {
        return BaseHelper::formatTime($timestamp, $format);
    }
}

if (!function_exists('date_from_database')) {
    /**
     * @param string $time
     * @param string $format
     * @return string
     * @deprecated
     */
    function date_from_database($time, $format = 'Y-m-d')
    {
        return BaseHelper::formatDate($time, $format);
    }
}

if (!function_exists('human_file_size')) {
    /**
     * @param int $bytes
     * @param int $precision
     * @return string
     */
    function human_file_size($bytes, $precision = 2): string
    {
        return BaseHelper::humanFilesize($bytes, $precision);
    }
}

if (!function_exists('get_file_data')) {
    /**
     * @param string $file
     * @param bool $toArray
     * @return bool|mixed
     */
    function get_file_data($file, $toArray = true)
    {
        return BaseHelper::getFileData($file, $toArray);
    }
}

if (!function_exists('json_encode_prettify')) {
    /**
     * @param array $data
     * @return string
     */
    function json_encode_prettify($data)
    {
        return BaseHelper::jsonEncodePrettify($data);
    }
}

if (!function_exists('save_file_data')) {
    /**
     * @param string $path
     * @param array|string $data
     * @param bool $json
     * @return bool|mixed
     */
    function save_file_data($path, $data, $json = true)
    {
        return BaseHelper::saveFileData($path, $data, $json);
    }
}

if (!function_exists('scan_folder')) {
    /**
     * @param string $path
     * @param array $ignoreFiles
     * @return array
     */
    function scan_folder($path, $ignoreFiles = [])
    {
        return BaseHelper::scanFolder($path, $ignoreFiles);
    }
}
