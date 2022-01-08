<?php

namespace Botble\Media\Commands;

use Botble\Media\Chunks\ChunkFile;
use Botble\Media\Chunks\Storage\ChunkStorage;
use Illuminate\Console\Command;
use Illuminate\Support\Str;
use Symfony\Component\Console\Output\OutputInterface;

class ClearChunksCommand extends Command
{
    /**
     * @var ChunkStorage
     */
    public $storage;

    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'cms:media:chunks:clear';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Clears the chunks upload directory. Deletes only .part objects.';

    /**
     * ClearChunksCommand constructor.
     * @param ChunkStorage $storage
     */
    public function __construct(ChunkStorage $storage)
    {
        parent::__construct();
        $this->storage = $storage;
    }

    /**
     * Clears the chunks upload directory.
     */
    public function handle()
    {
        $verbose = OutputInterface::VERBOSITY_VERBOSE;

        // Try to get the old chunk files
        $oldFiles = $this->storage->oldChunkFiles();

        if ($oldFiles->isEmpty()) {
            $this->warn('Chunks: no old files');

            return;
        }

        $this->info(sprintf('Found %d chunk files', $oldFiles->count()), $verbose);
        $deleted = 0;

        /**
         * @var ChunkFile $file
         */
        foreach ($oldFiles as $file) {
            $this->comment('> ' . $file, $verbose);

            if ($file->delete()) {
                ++$deleted;
            } else {
                $this->error('> chunk not deleted: ' . $file);
            }
        }

        $this->info('Chunks: cleared ' . $deleted . ' ' . Str::plural('file', $deleted));
    }
}
