<?php

namespace Botble\Media\Commands;

use Botble\Media\Repositories\Interfaces\MediaFileInterface;
use Exception;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;
use RvMedia;

class InsertWatermarkCommand extends Command
{
    /**
     * The console command signature.
     *
     * @var string
     */
    protected $signature = 'cms:media:insert-watermark {--folder= : Folder ID}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Insert watermark for existing images';

    /**
     * @var MediaFileInterface
     */
    protected $fileRepository;

    /**
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
        $this->info('Starting to insert watermark...');

        if (!setting('media_watermark_enabled', RvMedia::getConfig('watermark.enabled'))) {
            $this->error('Watermark is not enabled!');
            return 1;
        }

        $watermarkImage = setting('media_watermark_source', RvMedia::getConfig('watermark.source'));

        if (!$watermarkImage) {
            $this->error('Path to watermark image is not correct!');
            return 1;
        }

        $watermarkPath = RvMedia::getRealPath($watermarkImage);

        if (!File::exists($watermarkPath)) {
            $this->error('Path to watermark image is not correct!');
            return 1;
        }

        if ($this->option('folder')) {
            $files = $this->fileRepository->allBy(['folder_id' => $this->option('folder')], [], ['url', 'mime_type']);
        } else {
            $files = $this->fileRepository->allBy([], [], ['url', 'mime_type']);
        }

        $this->info('Processing ' . $files->count() . ' ' . Str::plural('file', $files->count()) . '...');

        $errors = [];

        $watermarkImage = setting('media_watermark_source', RvMedia::getConfig('watermark.source'));

        foreach ($files as $file) {
            try {
                if (!$file->canGenerateThumbnails()) {
                    continue;
                }

                if ($file->url == $watermarkImage) {
                    continue;
                }

                RvMedia::insertWatermark($file->url);

            } catch (Exception $exception) {
                $errors[] = $file->url;
                $this->error($exception->getMessage());
            }
        }

        $this->info('Inserted watermark successfully!');

        $errors = array_unique($errors);

        $errors = array_map(function ($item) {
            return [$item];
        }, $errors);

        if ($errors) {
            $this->info('We are unable to insert watermark for these files:');

            $this->table(['File directory'], $errors);

            return 1;
        }

        return 0;
    }
}
