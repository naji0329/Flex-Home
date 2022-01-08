<?php

namespace Botble\Media\Chunks\Save;

use Botble\Media\Chunks\Exceptions\ChunkSaveException;
use Botble\Media\Chunks\FileMerger;
use Botble\Media\Chunks\Handler\AbstractHandler;
use Botble\Media\Chunks\Storage\ChunkStorage;
use Illuminate\Filesystem\FilesystemAdapter;
use Illuminate\Http\UploadedFile;

class ChunkSave extends AbstractSave
{
    /**
     * Is this the final chunk?
     *
     * @var bool
     */
    protected $isLastChunk;

    /**
     * What is the chunk file name.
     *
     * @var string
     */
    protected $chunkFileName;

    /**
     * The chunk file path.
     *
     * @var string
     */
    protected $chunkFullFilePath = null;

    /**
     * @var UploadedFile|null
     */
    protected $fullChunkFile;

    /**
     * @var ChunkStorage
     */
    protected $chunkStorage;

    /**
     * {@inheritDoc}
     * @throws ChunkSaveException
     */
    public function __construct(UploadedFile $file, AbstractHandler $handler, $chunkStorage)
    {
        parent::__construct($file, $handler);
        $this->chunkStorage = $chunkStorage;

        $this->isLastChunk = $handler->isLastChunk();
        $this->chunkFileName = $handler->getChunkFileName();

        // build the full disk path
        $this->chunkFullFilePath = $this->getChunkFilePath(true);

        $this->handleChunk();
    }

    /**
     * Returns the chunk file path in the current disk instance.
     *
     * @param bool $absolutePath
     *
     * @return string
     */
    public function getChunkFilePath($absolutePath = false)
    {
        return $this->getChunkDirectory($absolutePath) . $this->chunkFileName;
    }

    /**
     * Returns the folder for the chunks in the storage path on current disk instance.
     *
     * @param bool $absolutePath
     *
     * @return string
     */
    public function getChunkDirectory($absolutePath = false)
    {
        $paths = [];

        if ($absolutePath) {
            $paths[] = $this->chunkStorage()->getDiskPathPrefix();
        }

        $paths[] = $this->chunkStorage()->directory();

        return implode('', $paths);
    }

    /**
     * Returns the current chunk storage.
     *
     * @return ChunkStorage
     */
    public function chunkStorage()
    {
        return $this->chunkStorage;
    }

    /**
     * Appends the new uploaded data to the final file.*
     * @throws ChunkSaveException
     */
    protected function handleChunk()
    {
        // prepare the folder and file path
        $this->createChunksFolderIfNeeded();
        $file = $this->getChunkFilePath();

        $this->handleChunkFile($file)
            ->tryToBuildFullFileFromChunks();
    }

    /**
     * Creates the chunks folder if doesn't exists. Uses recursive create.
     */
    protected function createChunksFolderIfNeeded()
    {
        $path = $this->getChunkDirectory(true);

        // creates the chunks dir
        if (!file_exists($path)) {
            mkdir($path, 0777, true);
        }
    }

    /**
     * Checks if the current chunk is last.
     *
     * @return $this
     */
    protected function tryToBuildFullFileFromChunks()
    {
        // Build the last file because of the last chunk
        if ($this->isLastChunk) {
            $this->buildFullFileFromChunks();
        }

        return $this;
    }

    /**
     * Builds the final file.
     */
    protected function buildFullFileFromChunks()
    {
        // Try to get local path
        $finalPath = $this->getChunkFullFilePath();

        // Build the new UploadedFile
        $this->fullChunkFile = $this->createFullChunkFile($finalPath);
    }

    /**
     * Returns the full file path.
     *
     * @return string
     */
    public function getChunkFullFilePath()
    {
        return $this->chunkFullFilePath;
    }

    /**
     * {@inheritDoc}
     */
    protected function createFullChunkFile($finalPath)
    {
        return new UploadedFile(
            $finalPath,
            $this->file->getClientOriginalName(),
            $this->file->getClientMimeType(),
            $this->file->getError(),
            // we must pass the true as test to force the upload file
            // to use a standard copy method, not move uploaded file
            true
        );
    }

    /**
     * {@inheritDoc}
     * @throws ChunkSaveException
     */
    protected function handleChunkFile($file)
    {
        // delete the old chunk
        if ($this->handler()->isFirstChunk() && $this->chunkDisk()->exists($file)) {
            $this->chunkDisk()->delete($file);
        }

        // Append the data to the file
        (new FileMerger($this->getChunkFullFilePath()))
            ->appendFile($this->file->getPathname())
            ->close();

        return $this;
    }

    /**
     * Returns the disk adapter for the chunk.
     *
     * @return FilesystemAdapter
     */
    public function chunkDisk()
    {
        return $this->chunkStorage()->disk();
    }

    /**
     * {@inheritDoc}
     */
    public function isFinished()
    {
        return parent::isFinished() && $this->isLastChunk;
    }

    /**
     * {@inheritDoc}
     */
    public function getFile()
    {
        if ($this->isLastChunk) {
            return $this->fullChunkFile;
        }

        return parent::getFile();
    }
}
