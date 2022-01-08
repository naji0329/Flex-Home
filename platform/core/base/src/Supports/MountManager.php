<?php

namespace Botble\Base\Supports;

use InvalidArgumentException;
use League\Flysystem\FileNotFoundException;
use League\Flysystem\FilesystemInterface;
use League\Flysystem\FilesystemNotFoundException;

class MountManager
{
    /**
     * @var FilesystemInterface[]
     */
    protected $filesystems = [];

    /**
     * Constructor.
     *
     * @param FilesystemInterface[] $filesystems [:prefix => Filesystem,]
     * @throws InvalidArgumentException
     */
    public function __construct(array $filesystems = [])
    {
        $this->mountFilesystems($filesystems);
    }

    /**
     * Mount filesystems.
     *
     * @param FilesystemInterface[] $filesystems [:prefix => Filesystem,]
     * @return $this
     * @throws InvalidArgumentException
     */
    public function mountFilesystems(array $filesystems)
    {
        foreach ($filesystems as $prefix => $filesystem) {
            $this->mountFilesystem($prefix, $filesystem);
        }

        return $this;
    }

    /**
     * Mount filesystems.
     *
     * @param string $prefix
     * @param FilesystemInterface $filesystem
     * @return $this
     * @throws InvalidArgumentException
     */
    public function mountFilesystem($prefix, FilesystemInterface $filesystem)
    {
        if (!is_string($prefix)) {
            throw new InvalidArgumentException(__METHOD__ . ' expects argument #1 to be a string.');
        }

        $this->filesystems[$prefix] = $filesystem;

        return $this;
    }

    /**
     * @param string $directory
     * @param bool $recursive
     * @return array
     * @throws FilesystemNotFoundException
     * @throws InvalidArgumentException
     */
    public function listContents($directory = '', $recursive = false)
    {
        [$prefix, $directory] = $this->getPrefixAndPath($directory);
        $filesystem = $this->getFilesystem($prefix);
        $result = $filesystem->listContents($directory, $recursive);

        foreach ($result as &$file) {
            $file['filesystem'] = $prefix;
        }

        return $result;
    }

    /**
     * @param string $path
     * @return string[] [:prefix, :path]
     * @throws InvalidArgumentException
     */
    protected function getPrefixAndPath($path)
    {
        if (strpos($path, '://') < 1) {
            throw new InvalidArgumentException('No prefix detected in path: ' . $path);
        }

        return explode('://', $path, 2);
    }

    /**
     * Get the filesystem with the corresponding prefix.
     *
     * @param string $prefix
     * @return FilesystemInterface
     * @throws FilesystemNotFoundException
     */
    public function getFilesystem($prefix)
    {
        if (!isset($this->filesystems[$prefix])) {
            throw new FilesystemNotFoundException('No filesystem mounted with prefix ' . $prefix);
        }

        return $this->filesystems[$prefix];
    }

    /**
     * Check whether a file exists.
     *
     * @param string $path
     * @return bool
     */
    public function has($path)
    {
        [$prefix, $path] = $this->getPrefixAndPath($path);

        return $this->getFilesystem($prefix)->has($path);
    }

    /**
     * Read a file.
     *
     * @param string $path The path to the file.
     * @return string|false The file contents or false on failure.
     * @throws FileNotFoundException
     */
    public function read($path)
    {
        [$prefix, $path] = $this->getPrefixAndPath($path);

        return $this->getFilesystem($prefix)->read($path);
    }

    /**
     * Create a file or update if exists.
     *
     * @param string $path The path to the file.
     * @param string $contents The file contents.
     * @param array $config An optional configuration array.
     * @return bool True on success, false on failure.
     */
    public function put($path, $contents, array $config = [])
    {
        [$prefix, $path] = $this->getPrefixAndPath($path);

        return $this->getFilesystem($prefix)->put($path, $contents, $config);
    }
}
