<?php

namespace Botble\Blog\Supports;

class PostFormat
{
    /**
     * @var array
     */
    protected static $formats = [
        '' => [
            'key'  => '',
            'icon' => null,
            'name' => 'Default',
        ],
    ];

    /**
     * @param array $formats
     * @return void
     * @since 16-09-2016
     */
    public static function registerPostFormat(array $formats = [])
    {
        foreach ($formats as $key => $format) {
            self::$formats[$key] = $format;
        }
    }

    /**
     * @param bool $isConvertToList
     * @return array
     * @since 16-09-2016
     */
    public static function getPostFormats($isConvertToList = false)
    {
        if ($isConvertToList) {
            $results = [];
            foreach (self::$formats as $key => $item) {
                $results[$key] = [
                    $key,
                    $item['name'],
                ];
            }
            return $results;
        }

        return self::$formats;
    }
}
