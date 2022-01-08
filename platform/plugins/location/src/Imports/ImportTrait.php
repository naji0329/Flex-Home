<?php

namespace Botble\Location\Imports;

use Carbon\Carbon;
use Exception;
use Illuminate\Support\Collection;
use PhpOffice\PhpSpreadsheet\Shared\Date;
use DateTime;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;

trait ImportTrait
{
    /**
     * @var int
     */
    protected $totalImported = 0;

    /**
     * @var array
     */
    protected $successes = [];

    /**
     * @return int
     */
    public function getTotalImported()
    {
        return $this->totalImported;
    }

    /**
     * @return self
     */
    public function setTotalImported()
    {
        ++$this->totalImported;

        return $this;
    }

    /**
     * @param mixed $item
     */
    public function onSuccess($item)
    {
        $this->successes[] = $item;
    }

    /**
     * @return Collection
     */
    public function successes(): Collection
    {
        return collect($this->successes);
    }

    /**
     * Transform a date value into a Carbon object.
     *
     * @return string
     */
    public function transformDate($value, $format = '')
    {
        $format = $format ?: config('core.base.general.date_format.date_time');

        try {
            return Carbon::instance(Date::excelToDateTimeObject($value))->format($format);
        } catch (Exception $exception) {
            return Carbon::createFromFormat($format, $value);
        }
    }

    /**
     * Transform a date value into a Carbon object.
     *
     * @return string
     */
    public function getDate($value, $format = 'Y-m-d H:i:s', $default = null)
    {
        try {
            $date = DateTime::createFromFormat('!' . $format, $value);

            return $date ? $date->format(config('core.base.general.date_format.date_time')) : $value;

        } catch (Exception $exception) {
            return $default;
        }
    }

    /**
     * @param array $row
     * @param array $attributes
     * @return $this
     */
    public function setValues(&$row, $attributes = [])
    {
        foreach ($attributes as $attribute) {
            $this->setValue($row,
                Arr::get($attribute, 'key'),
                Arr::get($attribute, 'type', 'array'),
                Arr::get($attribute, 'default'),
                Arr::get($attribute, 'from'));
        }

        return $this;
    }

    /**
     * @param array $row
     * @param string $key
     * @param string $type
     * @param null $default
     * @return $this
     */
    public function setValue(&$row, $key, $type = 'array', $default = null, $from = null)
    {
        $value = Arr::get($row, $from ?: $key, $default);

        switch ($type) {
            case 'array':
                $value = $value ? explode(',', $value) : [];
                break;
            case 'bool':
                if (Str::lower($value) == 'false' || $value == '0' || Str::lower($value) == 'no'){
                    $value = false;
                }
                $value = (bool) $value;
                break;
            case 'datetime':
                if ($value){
                    if (in_array(gettype($value), ['integer', 'double'])){
                        $value = $this->transformDate($value);
                    } else {
                        $value = $this->getDate($value);
                    }
                }
                break;
            case 'integer':
                $value = (int) $value;
                break;
        }

        Arr::set($row, $key, $value);

        return $this;
    }
}
