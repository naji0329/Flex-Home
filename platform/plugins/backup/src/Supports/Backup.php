<?php

namespace Botble\Backup\Supports;

use Botble\Base\Supports\PclZip as Zip;
use Exception;
use File;
use Illuminate\Filesystem\Filesystem;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Symfony\Component\Process\Process;
use ZipArchive;

class Backup
{

    /**
     * The filesystem instance.
     *
     * @var \Illuminate\Filesystem\Filesystem
     */
    protected $file;

    /**
     * @var string
     */
    protected $folder;

    /**
     * Backup constructor.
     * @param Filesystem $file
     */
    public function __construct(Filesystem $file)
    {
        $this->file = $file;
    }

    /**
     * @return array
     * @throws \Illuminate\Contracts\Filesystem\FileNotFoundException
     */
    public function createBackupFolder($name, $description = null): array
    {
        $backupFolder = $this->createFolder($this->getBackupPath());
        $now = now()->format('Y-m-d-H-i-s');
        $this->folder = $this->createFolder($backupFolder . DIRECTORY_SEPARATOR . $now);

        $file = $this->getBackupPath('backup.json');
        $data = [];

        if (file_exists($file)) {
            $data = get_file_data($file);
        }

        $data[$now] = [
            'name'        => $name,
            'description' => $description,
            'date'        => now()->toDateTimeString(),
        ];

        save_file_data($file, $data);

        return [
            'key'  => $now,
            'data' => $data[$now],
        ];
    }

    /**
     * @param string $folder
     * @return string
     */
    public function createFolder($folder): string
    {
        if (!$this->file->isDirectory($folder)) {
            $this->file->makeDirectory($folder);
            chmod($folder, 0777);
        }

        return $folder;
    }

    /**
     * @param null $path
     * @return string
     */
    public function getBackupPath($path = null): string
    {
        return storage_path('app/backup') . ($path ? '/' . $path : null);
    }

    /**
     * @param string $key
     * @return string
     */
    public function getBackupDatabasePath($key): string
    {
        return $this->getBackupPath($key . '/database-' . $key . '.zip');
    }

    /**
     * @param string $key
     * @return bool
     */
    public function isDatabaseBackupAvailable($key): bool
    {
        $file = $this->getBackupDatabasePath($key);

        return file_exists($file) && filesize($file) > 1024;
    }

    /**
     * @return array|bool|mixed
     * @throws \Illuminate\Contracts\Filesystem\FileNotFoundException
     */
    public function getBackupList()
    {
        $file = $this->getBackupPath('backup.json');
        if (file_exists($file)) {
            return get_file_data($file);
        }

        return [];
    }

    /**
     * @return bool
     * @throws Exception
     */
    public function backupDb(): bool
    {
        $file = 'database-' . now()->format('Y-m-d-H-i-s');
        $path = $this->folder . DIRECTORY_SEPARATOR . $file;

        $mysqlPath = rtrim(config('plugins.backup.general.backup_mysql_execute_path'), '/');

        if (!empty($mysqlPath)) {
            $mysqlPath = $mysqlPath . '/';
        }

        $sql = $mysqlPath . 'mysqldump --user=' . config('database.connections.mysql.username') . ' --password=' .
            config('database.connections.mysql.password');

        if (!in_array(config('database.connections.mysql.host'), ['localhost', '127.0.0.1'])) {
            $sql .= ' --host=' . config('database.connections.mysql.host');
        }

        $sql .= ' --port=' . config('database.connections.mysql.port') . ' ' . config('database.connections.mysql.database') . ' > ' . $path . '.sql';

        try {
            Process::fromShellCommandline($sql)->mustRun();
        } catch (Exception $exception) {
            system($sql);
        }

        $this->compressFileToZip($path, $file);
        if (file_exists($path . '.zip')) {
            chmod($path . '.zip', 0777);
        }

        return true;
    }

    /**
     * @param string $path
     * @param string $name
     * @throws Exception
     */
    public function compressFileToZip($path, $name): void
    {
        $filename = $path . '.zip';

        if (class_exists('ZipArchive', false)) {
            $zip = new ZipArchive;
            if ($zip->open($filename, ZipArchive::CREATE) == true) {
                $zip->addFile($path . '.sql', $name . '.sql');
                $zip->close();
            }
        } else {
            $archive = new Zip($filename);
            $archive->add($path . '.sql', PCLZIP_OPT_REMOVE_PATH, $filename);
        }
        $this->deleteFile($path . '.sql');
    }

    /**
     * @param string $file
     * @throws Exception
     */
    protected function deleteFile($file): void
    {
        if ($this->file->exists($file)) {
            $this->file->delete($file);
        }
    }

    /**
     * @param string $source
     * @return bool
     * @throws \Illuminate\Contracts\Filesystem\FileNotFoundException
     */
    public function backupFolder($source): bool
    {
        $file = $this->folder . DIRECTORY_SEPARATOR . 'storage-' . now()->format('Y-m-d-H-i-s') . '.zip';

        @ini_set('max_execution_time', -1);

        if (class_exists('ZipArchive', false)) {
            $zip = new ZipArchive;
            if ($zip->open($file, ZipArchive::CREATE) !== true) {
                $this->deleteFolderBackup($this->folder);
            }
        } else {
            $zip = new Zip($file);
        }
        $arrSource = explode(DIRECTORY_SEPARATOR, $source);
        $pathLength = strlen(implode(DIRECTORY_SEPARATOR, $arrSource) . DIRECTORY_SEPARATOR);
        // add each file in the file list to the archive
        $this->recurseZip($source, $zip, $pathLength);
        if (class_exists('ZipArchive', false)) {
            $zip->close();
        }
        if (file_exists($file)) {
            chmod($file, 0777);
        }

        return true;
    }

    /**
     * @param string $path
     * @throws \Illuminate\Contracts\Filesystem\FileNotFoundException
     */
    public function deleteFolderBackup($path): void
    {
        $backupFolder = $this->getBackupPath();
        if ($this->file->isDirectory($backupFolder) && $this->file->isDirectory($path)) {
            foreach (scan_folder($path) as $item) {
                $this->file->delete($path . DIRECTORY_SEPARATOR . $item);
            }
            $this->file->deleteDirectory($path);

            if (empty($this->file->directories($backupFolder))) {
                $this->file->deleteDirectory($backupFolder);
            }
        }

        $file = $this->getBackupPath('backup.json');
        $data = [];
        if (file_exists($file)) {
            $data = get_file_data($file);
        }
        if (!empty($data)) {
            unset($data[Arr::last(explode('/', $path))]);
            save_file_data($file, $data);
        }
    }

    /**
     * @param string $src
     * @param ZipArchive $zip
     * @param string $pathLength
     */
    public function recurseZip($src, &$zip, $pathLength): void
    {
        foreach (scan_folder($src) as $file) {
            if ($this->file->isDirectory($src . DIRECTORY_SEPARATOR . $file)) {
                $this->recurseZip($src . DIRECTORY_SEPARATOR . $file, $zip, $pathLength);
            } else {
                if (class_exists('ZipArchive', false)) {
                    /**
                     * @var ZipArchive $zip
                     */
                    $zip->addFile($src . DIRECTORY_SEPARATOR . $file,
                        substr($src . DIRECTORY_SEPARATOR . $file, $pathLength));
                } else {
                    /**
                     * @var Zip $zip
                     */
                    $zip->add($src . DIRECTORY_SEPARATOR . $file, PCLZIP_OPT_REMOVE_PATH,
                        substr($src . DIRECTORY_SEPARATOR . $file, $pathLength));
                }
            }
        }
    }

    /**
     * @param string $path
     * @param string $file
     * @return bool
     * @throws Exception
     */
    public function restoreDatabase($file, $path): bool
    {
        $this->extractFileTo($file, $path);
        $file = $path . DIRECTORY_SEPARATOR . $this->file->name($file) . '.sql';

        if (!file_exists($file)) {
            return false;
        }
        // Force the new login to be used
        DB::purge();
        DB::unprepared('USE `' . config('database.connections.mysql.database') . '`');
        DB::connection()->setDatabaseName(config('database.connections.mysql.database'));
        DB::unprepared(file_get_contents($file));

        $this->deleteFile($file);

        return true;
    }

    /**
     * @param string $fileName
     * @param string $pathTo
     * @return bool
     */
    public function extractFileTo(string $fileName, string $pathTo): bool
    {
        if (class_exists('ZipArchive', false)) {
            $zip = new ZipArchive;
            if ($zip->open($fileName) === true) {
                $zip->extractTo($pathTo);
                $zip->close();

                return true;
            }

            return false;
        }

        $archive = new Zip($fileName);
        $archive->extract(PCLZIP_OPT_PATH, $pathTo);

        return true;
    }

    /**
     * @param string $directory
     * @return bool
     */
    public function cleanDirectory(string $directory): bool
    {
        foreach (File::glob(rtrim($directory, '/') . '/*') as $item) {
            if (File::isDirectory($item)) {
                File::deleteDirectory($item);
            } elseif (!in_array(File::basename($item), ['.htaccess', '.gitignore'])) {
                File::delete($item);
            }
        }

        return true;
    }
}
