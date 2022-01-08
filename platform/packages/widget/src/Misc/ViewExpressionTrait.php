<?php

namespace Botble\Widget\Misc;

use Illuminate\Support\HtmlString;

trait ViewExpressionTrait
{
    /**
     * Convert a given html to HtmlString object that was introduced in Laravel 5.1.
     *
     * @param string $html
     * @return HtmlString|string
     */
    protected function convertToViewExpression($html)
    {
        return new HtmlString($html);
    }
}
