<?php

namespace Botble\Media\Commands;

use Botble\Media\Repositories\Eloquent\MediaFileRepository;
use Botble\Media\Repositories\Interfaces\MediaFileInterface;
use Exception;
use Illuminate\Console\Command;
use Illuminate\Support\Str;
use RvMedia;

class DeleteThumbnailCommand extends Command
{
    /**
     * The console command signature.
     *
     * @var string
     */
    protected $signature = 'cms:media:thumbnail:delete';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Delete thumbnails for all images';

    /**
     * @var MediaFileRepository
     */
    protected $fileRepository;

    /**
     * DeleteThumbnailCommand constructor.
     * @param MediaFileInterface $fileRepository
     */
    public function __construct(MediaFileInterface $fileRepository)
    {
        parent::__construct();
        $this->fileRepository = $fileRepository;
    }

    /**
     * @return int
     */
    public function handle()
    {
        $files = $this->fileRepository->allBy([], [], ['url', 'mime_type']);

        $this->info('Processing ' . $files->count() . ' ' . Str::plural('file', $files->count()) . '...');

        $errors = [];

        foreach ($files as $file) {
            if (!$file->canGenerateThumbnails()) {
                continue;
            }

            $this->info('Processing ' . $file->url);

            try {
                RvMedia::deleteThumbnails($file);
            } catch (Exception $exception) {
                $errors[] = $file->url;
                $this->error($exception->getMessage());
            }
        }

        $this->info('Thumbnails deleted');

        $errors = array_unique($errors);

        $errors = array_map(function ($item) {
            return [$item];
        }, $errors);

        if ($errors) {
            $this->info('We are unable to regenerate thumbnail for these files:');

            $this->table(['File directory'], $errors);

            return 1;
        }

        return 0;
    }
}
