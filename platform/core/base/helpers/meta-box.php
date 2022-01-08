<?php

use Illuminate\Database\Eloquent\Model;

if (!function_exists('add_meta_box')) {
    /**
     * @param string $id
     * @param string $title
     * @param callable $callback
     * @param null $screen
     * @param string $context
     * @param string $priority
     * @param null $callbackArgs
     * @deprecated since 5.7
     */
    function add_meta_box(
        string $id,
        $title,
        $callback,
        $screen = null,
        $context = 'advanced',
        $priority = 'default',
        $callbackArgs = null
    ) {
        MetaBox::addMetaBox($id, $title, $callback, $screen, $context, $priority, $callbackArgs);
    }
}

if (!function_exists('get_meta_data')) {
    /**
     * @param Model $object
     * @param string $key
     * @param boolean $single
     * @param array $select
     * @return mixed
     * @deprecated since 5.7
     */
    function get_meta_data($object, $key, $single = false, $select = ['meta_value'])
    {
        return MetaBox::getMetaData($object, $key, $single, $select);
    }
}

if (!function_exists('get_meta')) {
    /**
     * @param Model $object
     * @param string $key
     * @param array $select
     * @return mixed
     * @deprecated since 5.7
     */
    function get_meta($object, $key, $select = ['meta_value'])
    {
        return MetaBox::getMeta($object, $key, $select);
    }
}

if (!function_exists('save_meta_data')) {
    /**
     * @param Model $object
     * @param string $key
     * @param string $value
     * @param null|array $options
     * @return mixed
     * @deprecated since 5.7
     */
    function save_meta_data($object, $key, $value, $options = null)
    {
        return MetaBox::saveMetaBoxData($object, $key, $value, $options);
    }
}

if (!function_exists('delete_meta_data')) {
    /**
     * @param Model $object
     * @param string $key
     * @return mixed
     * @deprecated since 5.7
     */
    function delete_meta_data($object, $key)
    {
        return MetaBox::deleteMetaData($object, $key);
    }
}
