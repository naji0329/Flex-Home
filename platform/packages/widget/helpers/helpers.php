<?php

if (!function_exists('register_widget')) {
    /**
     * @param string $widgetId
     * @return \Botble\Widget\Factories\WidgetFactory
     */
    function register_widget($widgetId)
    {
        return Widget::registerWidget($widgetId);
    }
}

if (!function_exists('register_sidebar')) {
    /**
     * @param array $args
     * @return WidgetGroup
     */
    function register_sidebar($args)
    {
        return WidgetGroup::setGroup($args);
    }
}

if (!function_exists('remove_sidebar')) {
    /**
     * @param string $sidebarId
     * @return \Botble\Widget\WidgetGroupCollection
     */
    function remove_sidebar(string $sidebarId)
    {
        return WidgetGroup::removeGroup($sidebarId);
    }
}

if (!function_exists('dynamic_sidebar')) {
    /**
     * @param string $sidebarId
     * @return string
     * @throws \Illuminate\Contracts\Filesystem\FileNotFoundException
     */
    function dynamic_sidebar(string $sidebarId)
    {
        return WidgetGroup::render($sidebarId);
    }
}
