<?php

if (!function_exists('get_backup_size')) {
    /**
     * @param string $key
     * @return int
     */
    function get_backup_size($key)
    {
        $size = 0;

        foreach (File::allFiles(storage_path('app/backup/' . $key)) as $file) {
            $size += $file->getSize();
        }

        return $size;
    }
}
