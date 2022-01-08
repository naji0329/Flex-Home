<?php

namespace Botble\Media\Chunks\Handler;

use Botble\Media\Chunks\Save\ParallelSave;
use Illuminate\Http\Request;

class DropZoneUploadHandler extends AbstractHandler
{
    const CHUNK_UUID_INDEX = 'dzuuid';
    const CHUNK_INDEX = 'dzchunkindex';
    const CHUNK_TOTAL_INDEX = 'dztotalchunkcount';

    /**
     * The DropZone file uuid.
     *
     * @var string|null
     */
    protected $fileUuid = null;

    /**
     * The current chunk progress.
     *
     * @var int
     */
    protected $currentChunk = 0;

    /**
     * The total of chunks.
     *
     * @var int
     */
    protected $chunksTotal = 0;

    /**
     * {@inheritDoc}
     */
    public function __construct(Request $request, $file)
    {
        parent::__construct($request, $file);

        $this->currentChunk = intval($request->input(self::CHUNK_INDEX, 0)) + 1;
        $this->chunksTotal = intval($request->input(self::CHUNK_TOTAL_INDEX, 1));
        $this->fileUuid = $request->input(self::CHUNK_UUID_INDEX);
    }

    /**
     * {@inheritDoc}
     */
    public function getChunkFileName()
    {
        return $this->createChunkFileName($this->fileUuid, $this->currentChunk);
    }

    /**
     * {@inheritDoc}
     */
    public function startSaving($chunkStorage)
    {
        // Build the parallel save
        return new ParallelSave($this->file, $this, $chunkStorage);
    }

    /**
     * {@inheritDoc}
     */
    public function isFirstChunk()
    {
        return 1 == $this->currentChunk;
    }

    /**
     * {@inheritDoc}
     */
    public function isLastChunk()
    {
        // the bytes starts from zero, remove 1 byte from total
        return $this->currentChunk == $this->chunksTotal;
    }

    /**
     * {@inheritDoc}
     */
    public function isChunkedUpload()
    {
        return $this->chunksTotal > 1;
    }

    /**
     * {@inheritDoc}
     */
    public function getPercentageDone()
    {
        return ceil($this->currentChunk / $this->chunksTotal * 100);
    }
}
