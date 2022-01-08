<?php

use Botble\Page\Repositories\Interfaces\PageInterface;
use Botble\Page\Supports\Template;

if (!function_exists('get_featured_pages')) {
    /**
     * @param int $limit
     * @return mixed
     */
    function get_featured_pages($limit)
    {
        return app(PageInterface::class)->getFeaturedPages($limit);
    }
}

if (!function_exists('get_page_by_slug')) {
    /**
     * @param string $slug
     * @return mixed
     */
    function get_page_by_slug($slug)
    {
        return app(PageInterface::class)->getBySlug($slug, true);
    }
}

if (!function_exists('get_all_pages')) {
    /**
     * @param boolean $active
     * @return mixed
     */
    function get_all_pages($active = true)
    {
        return app(PageInterface::class)->getAllPages($active);
    }
}

if (!function_exists('register_page_template')) {
    /**
     * @param array $templates
     * @return void
     */
    function register_page_template(array $templates)
    {
        Template::registerPageTemplate($templates);
    }
}

if (!function_exists('get_page_templates')) {
    /**
     * @return array
     */
    function get_page_templates()
    {
        return Template::getPageTemplates();
    }
}
