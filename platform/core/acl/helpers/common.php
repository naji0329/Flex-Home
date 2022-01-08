<?php

if (!function_exists('get_login_background')) {
    /**
     * @return string
     */
    function get_login_background(): string
    {
        $default = url(Arr::random(config('core.acl.general.backgrounds', [])));

        $images = setting('login_screen_backgrounds', []);

        if (!$images) {
            return $default;
        }

        $images = is_array($images) ? $images : json_decode($images, true);

        $images = array_filter($images);

        if (empty($images) || !is_array($images)) {
            return $default;
        }

        $image = Arr::random($images);

        if (!$image) {
            return $default;
        }

        return RvMedia::getImageUrl($image);
    }
}
