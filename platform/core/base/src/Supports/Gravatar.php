<?php

namespace Botble\Base\Supports;

class Gravatar
{
    /**
     * Get Gravatar image by email.
     *
     * @param string $email
     * @param int $size
     * @param string $rating [g|pg|r|x]
     * @param string $default
     * @return string
     */
    public static function image($email, $size = 200, $rating = 'g', $default = 'monsterid'): string
    {
        $id = md5(strtolower(trim($email)));

        return 'https://www.gravatar.com/avatar/' . $id . '/?d=' . $default . '&s=' . $size . '&r=' . $rating;
    }
}
