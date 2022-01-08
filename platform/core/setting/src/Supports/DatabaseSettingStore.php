<?php

namespace Botble\Setting\Supports;

use Botble\Base\Supports\Helper;
use Botble\Setting\Models\Setting;
use Exception;
use File;
use Illuminate\Contracts\Filesystem\FileNotFoundException;
use Illuminate\Filesystem\Filesystem;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;
use UnexpectedValueException;

class DatabaseSettingStore extends SettingStore
{
    /**
     * @var bool
     */
    protected $connectedDatabase = false;

    /**
     * {@inheritDoc}
     */
    public function forget($key): SettingStore
    {
        parent::forget($key);

        // because the database store cannot store empty arrays, remove empty
        // arrays to keep data consistent before and after saving
        $segments = explode('.', $key);
        array_pop($segments);

        while ($segments) {
            $segment = implode('.', $segments);

            // non-empty array - exit out of the loop
            if ($this->get($segment)) {
                break;
            }

            // remove the empty array and move on to the next segment
            $this->forget($segment);
            array_pop($segments);
        }

        return $this;
    }

    /**
     * {@inheritDoc}
     */
    protected function write(array $data)
    {
        $keys = Setting::pluck('key');

        $insertData = Arr::dot($data);
        $updateData = [];
        $deleteKeys = [];

        foreach ($keys as $key) {
            if (isset($insertData[$key])) {
                $updateData[$key] = $insertData[$key];
            } else {
                $deleteKeys[] = $key;
            }
            unset($insertData[$key]);
        }

        foreach ($updateData as $key => $value) {
            Setting::where('key', $key)
                ->update(['value' => $value]);
        }

        if ($insertData) {
            Setting::insert($this->prepareInsertData($insertData));
        }

        // if ($deleteKeys) {
            // Setting::whereIn('key', $deleteKeys)->delete();
        // }

        if (config('core.setting.general.cache.enabled')) {
            try {
                $jsonSettingStore = new JsonSettingStore(new Filesystem);
                $jsonSettingStore->write($data);
            } catch (Exception $exception) {
                info($exception->getMessage());
            }
        }
    }

    /**
     * Transforms settings data into an array ready to be inserted into the
     * database. Call array_dot on a multidimensional array before passing it
     * into this method!
     *
     * @param array $data Call array_dot on a multidimensional array before passing it into this method!
     *
     * @return array
     */
    protected function prepareInsertData(array $data)
    {
        $dbData = [];

        foreach ($data as $key => $value) {
            $dbData[] = compact('key', 'value');
        }

        return apply_filters(SETTINGS_PREPARE_INSERT_DATA, $dbData);
    }

    /**
     * {@inheritDoc}
     * @throws FileNotFoundException
     */
    protected function read()
    {
        if (!$this->connectedDatabase) {
            $this->connectedDatabase = Helper::isConnectedDatabase();
        }

        if (!$this->connectedDatabase) {
            return [];
        }

        if (config('core.setting.general.cache.enabled')) {
            $jsonSettingStore = new JsonSettingStore(new Filesystem);
            if (File::exists($jsonSettingStore->getPath())) {
                $data = $jsonSettingStore->read();
                if (!empty($data)) {
                    return $data;
                }
            }
        }

        $data = $this->parseReadData(Setting::get());

        if (config('core.setting.general.cache.enabled')) {
            if (!isset($jsonSettingStore)) {
                $jsonSettingStore = new JsonSettingStore(new Filesystem);
            }

            $jsonSettingStore->write($data);
        }

        return $data;
    }

    /**
     * Parse data coming from the database.
     *
     * @param Collection $data
     *
     * @return array
     */
    public function parseReadData($data)
    {
        $results = [];

        foreach ($data as $row) {
            if (is_array($row)) {
                $key = $row['key'];
                $value = $row['value'];
            } elseif (is_object($row)) {
                $key = $row->key;
                $value = $row->value;
            } else {
                $msg = 'Expected array or object, got ' . gettype($row);
                throw new UnexpectedValueException($msg);
            }

            Arr::set($results, $key, $value);
        }

        return $results;
    }
}
