<?php

namespace Botble\Language\Commands;

use Botble\Language\Models\LanguageMeta;
use Illuminate\Support\Facades\DB;
use Illuminate\Console\Command;
use Language;
use Illuminate\Support\Facades\Schema;

class SyncOldDataCommand extends Command
{

    /**
     * The console command signature.
     *
     * @var string
     */
    protected $signature = 'cms:language:sync {class : Model class name}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Set default language for old objects';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        if (!Language::getDefaultLanguage()) {
            $this->error('No languages in the system, please add a language!');
            return 1;
        }

        $class = $this->argument('class');
        $table = (new $class)->getTable();
        if (!Schema::hasTable($table)) {
            $this->error('That table is not existed!');
            return 1;
        }

        if (!Schema::hasColumn($table, 'id')) {
            $this->error('Table "' . $table . '" does not have ID column!');
            return 1;
        }

        $ids = LanguageMeta::where('reference_type', $this->argument('class'))
            ->pluck('reference_id')
            ->all();

        $referenceIds = DB::table($table)
            ->whereNotIn('id', $ids)
            ->pluck('id')
            ->all();

        $data = [];
        foreach ($referenceIds as $referenceId) {
            $data[] = [
                'reference_id'     => $referenceId,
                'reference_type'   => $class,
                'lang_meta_code'   => Language::getDefaultLocaleCode(),
                'lang_meta_origin' => md5($referenceId . $class . time()),
            ];
        }

        LanguageMeta::insert($data);

        $this->info('Processed ' . count($data) . ' item(s)!');

        return 0;
    }
}
