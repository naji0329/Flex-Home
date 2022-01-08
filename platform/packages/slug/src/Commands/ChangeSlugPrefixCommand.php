<?php

namespace Botble\Slug\Commands;

use Botble\Slug\Repositories\Interfaces\SlugInterface;
use Illuminate\Console\Command;

class ChangeSlugPrefixCommand extends Command
{

    /**
     * The console command signature.
     *
     * @var string
     */
    protected $signature = 'cms:slug:prefix {class : model class} {--prefix= : The prefix of slugs}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Change/set prefix for slugs';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $data = app(SlugInterface::class)->update(
            [
                'reference_type' => $this->argument('class'),
            ],
            [
                'prefix' => $this->option('prefix') ?? '',
            ]
        );

        $this->info('Processed ' . $data . ' item(s)!');

        return 0;
    }
}
