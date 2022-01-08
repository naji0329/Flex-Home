<?php

namespace Botble\LanguageAdvanced\Supports;

use Botble\Base\Models\BaseModel;
use Botble\LanguageAdvanced\Models\PageTranslation;
use Botble\Page\Models\Page;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Language;

class LanguageAdvancedManager
{
    /**
     * @param BaseModel|\stdClass $object
     * @param Request $request
     * @return bool
     */
    public static function save($object, $request): bool
    {
        if (!self::isSupported($object)) {
            return false;
        }

        $language = $request->input('language');

        $condition = [
            'lang_code'                 => $language,
            $object->getTable() . '_id' => $object->id,
        ];

        $table = $object->getTable() . '_translations';

        $data = [];
        foreach (DB::getSchemaBuilder()->getColumnListing($table) as $column) {
            if (!in_array($column, array_keys($condition))) {
                $data[$column] = $request->input($column);
            }
        }

        $data = array_merge($data, $condition);

        $translate = DB::table($table)->where($condition)->first();

        if ($translate) {
            DB::table($table)->where($condition)->update($data);
        } else {
            DB::table($table)->insert($data);
        }

        if ($language != Language::getDefaultLocaleCode()) {
            $defaultTranslation = DB::table($table)
                ->where([
                    'lang_code'                 => Language::getDefaultLocaleCode(),
                    $object->getTable() . '_id' => $object->id,
                ])
                ->first();

            if ($defaultTranslation) {
                foreach (DB::getSchemaBuilder()->getColumnListing($table) as $column) {
                    if (!in_array($column, array_keys($condition))) {
                        $object->{$column} = $defaultTranslation->{$column};
                    }
                }

                $object->save();
            }
        }

        return true;
    }

    /**
     * @param string|BaseModel $model
     * @return bool
     */
    public static function isSupported($model): bool
    {
        if (!$model) {
            return false;
        }

        if (is_object($model)) {
            $model = get_class($model);
        }

        return in_array($model, self::supportedModels());
    }

    /**
     * @return int[]|string[]
     */
    public static function supportedModels(): array
    {
        return array_keys(self::getSupported());
    }

    /**
     * @return array
     */
    public static function getSupported(): array
    {
        return config('plugins.language-advanced.general.supported', []);
    }

    /**
     * @return array
     */
    public static function getConfigs(): array
    {
        return config('plugins.language-advanced.general', []);
    }

    /**
     * @param string|BaseModel $model
     * @return array
     */
    public static function getTranslatableColumns($model): array
    {
        if (!$model) {
            return [];
        }

        if (is_object($model)) {
            $model = get_class($model);
        }

        return Arr::get(LanguageAdvancedManager::getSupported(), $model, []);
    }

    /**
     * @param string|BaseModel $model
     * @return ?string
     */
    public static function getTranslationModel($model): ?string
    {
        if (!$model) {
            return null;
        }

        if (is_object($model)) {
            $model = get_class($model);
        }

        if ($model == Page::class) {
            return PageTranslation::class;
        }

        return $model . 'Translation';
    }

    /**
     * @param string $model
     * @return bool
     */
    public static function registerModule(string $model, array $columns): bool
    {
        config([
            'plugins.language-advanced.general.supported' => array_merge(self::getSupported(), [$model => $columns]),
        ]);

        return true;
    }

    /**
     * @param BaseModel|\stdClass $object
     * @return bool
     */
    public static function delete($object): bool
    {
        if (!self::isSupported($object)) {
            return false;
        }

        $table = $object->getTable() . '_translations';

        DB::table($table)->where([$object->getTable() . '_id' => $object->id])->delete();

        return true;
    }

    /**
     * @param string $metaBoxKey
     * @return bool
     */
    public static function isTranslatableMetaBox(string $metaBoxKey): bool
    {
        return in_array($metaBoxKey, Arr::get(self::getConfigs(), 'translatable_meta_boxes', []));
    }

    /**
     * @param string $model
     * @return bool
     */
    public static function addTranslatableMetaBox(string $metaBoxKey): bool
    {
        $metaBoxes = array_merge(Arr::get(self::getConfigs(), 'translatable_meta_boxes', []), [$metaBoxKey]);

        config(['plugins.language-advanced.general.translatable_meta_boxes' => $metaBoxes]);

        return true;
    }
}
