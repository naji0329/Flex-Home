<?php

namespace Botble\Shortcode\Http\Controllers;

use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;

class ShortcodeController extends BaseController
{
    /**
     * @param string $key
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function ajaxGetAdminConfig($key, Request $request, BaseHttpResponse $response)
    {
        $registered = shortcode()->getAll();

        $data = Arr::get($registered, $key . '.admin_config');

        $code = $request->input('code');

        $attributes = [];
        $content = null;

        if ($code) {
            $compiler = shortcode()->getCompiler();
            $attributes = $compiler->getAttributes(html_entity_decode($code));
            $content = $compiler->getContent();
        }

        if ($data instanceof Closure) {
            $data = call_user_func($data, $attributes, $content);
        }

        $data = apply_filters(SHORTCODE_REGISTER_CONTENT_IN_ADMIN, $data, $key, $attributes);

        return $response->setData($data);
    }
}
