<?php

namespace Botble\Theme\Supports;

class Vimeo
{
    /**
     * @param string $url
     * @return null|string
     */
    public static function getVimeoID(string $url): ?string
    {
        $regExp = '/(https?:\/\/)?(www\.)?(player\.)?vimeo\.com\/([a-z]*\/)*([0-9]{6,11})[?]?.*/';

        preg_match($regExp, $url, $matches);

        if (isset($matches[5])) {
            return $matches[5];
        }

        return null;
    }

    /**
     * @param string $url
     * @return bool
     */
    public static function isVimeoURL(string $url): bool
    {
        $regExp = '/(https?:\/\/)?(www\.)?(player\.)?vimeo\.com\/([a-z]*\/)*([0-9]{6,11})[?]?.*/';

        return preg_match($regExp, $url);
    }
}
