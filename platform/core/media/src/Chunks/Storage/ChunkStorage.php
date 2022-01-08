<?php

namespace Botble\Media\Chunks\Storage;

use Botble\Media\Chunks\ChunkFile;
use Closure;
use Illuminate\Filesystem\FilesystemAdapter;
use Illuminate\Support\Collection;
use League\Flysystem\Adapter\Local;
use League\Flysystem\FilesystemInterface;
use RuntimeException;
use RvMedia;
use Storage;

class ChunkStorage
{
    const CHUNK_EXTENSION = 'part';

    /**
     * @var array
     */
    protected $config;

    /**
     * The disk that holds the chunk files.
     *
     * @var FilesystemAdapter
     */
    protected $disk;

    /**
     * @var Local
     */
    protected $diskAdapter;

    /**
     * Is provided disk a local drive.
     *
     * @var bool
     */
    protected $isLocalDisk;

    /**
     * ChunkStorage constructor.
     */
    public function __construct()
    {
        $this->config = RvMedia::getConfig('chunk');

        // Cache the storage path
        $this->disk = Storage::disk($this->config['storage']['disk']);

        $driver = $this->driver();

        // Try to get the adapter
        if (!method_exists($driver, 'getAdapter')) {
            throw new RuntimeException('FileSystem driver must have an adapter implemented');
        }

        // Get the disk adapter
        $this->diskAdapter = $driver->getAdapter();

        // Check if its local adapter
        $this->isLocalDisk = $this->diskAdapter instanceof Local;
    }

    /**
     * Returns the driver.
     *
     * @return FilesystemInterface
     */
    public function driver()
    {
        return $this->disk()->getDriver();
    }

    /**
     * @return FilesystemAdapter
     */
    public function disk()
    {
        return $this->disk;
    }

    /**
     * Returns the application instance of the chunk storage.
     *
     * @return ChunkStorage
     */
    public static function storage()
    {
        return app(self::class);
    }

    /**
     * The current path for chunks directory.
     *
     * @return string
     *
     * @throws RuntimeException when the adapter is not local
     */
    public function getDiskPathPrefix()
    {
        if ($this->isLocalDisk) {
            return $this->diskAdapter->getPathPrefix();
        }

        throw new RuntimeException('The full path is not supported on current disk - local adapter supported only');
    }

    /**
     * Returns the old chunk files.
     *
     * @return Collection<ChunkFile> collection of a ChunkFile objects
     */
    public function oldChunkFiles()
    {
        $files = $this->files();
        // If there are no files, lets return the empty collection
        if ($files->isEmpty()) {
            return $files;
        }

        // Build the timestamp
        $timeToCheck = strtotime($this->config['clear']['timestamp']);
        $collection = new Collection;

        // Filter the collection with files that are not correct chunk file
        // Loop all current files and filter them by the time
        $files->each(function ($file) use ($timeToCheck, $collection) {
            // get the last modified time to check if the chunk is not new
            $modified = $this->disk()->lastModified($file);

            // Delete only old chunk
            if ($modified < $timeToCheck) {
                $collection->push(new ChunkFile($file, $modified, $this));
            }
        });

        return $collection;
    }

    /**
     * Returns an array of files in the chunks directory.
     *
     * @param Closure|null $rejectClosure
     * @return Collection
     * @see FilesystemAdapter::files()
     */
    public function files($rejectClosure = null)
    {
        // We need to filter files we don't support, lets use the collection
        $filesCollection = new Collection($this->disk->files($this->directory(), false));

        return $filesCollection->reject(function ($file) use ($rejectClosure) {
            // Ensure the file ends with allowed extension
            $shouldReject = !preg_match('/.' . self::CHUNK_EXTENSION . '$/', $file);
            if ($shouldReject) {
                return true;
            }

            if (is_callable($rejectClosure)) {
                return $rejectClosure($file);
            }

            return false;
        });
    }

    /**
     * The current chunks directory.
     *
     * @return string
     */
    public function directory()
    {
        return $this->config['storage']['chunks'] . '/';
    }
}
