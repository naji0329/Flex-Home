<?php

namespace Botble\Theme\Http\Controllers;

use Assets;
use Botble\Base\Forms\FormBuilder;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Theme\Forms\CustomCSSForm;
use Botble\Theme\Forms\CustomJSForm;
use Botble\Theme\Http\Requests\CustomCssRequest;
use Botble\Theme\Http\Requests\CustomJsRequest;
use Botble\Theme\Services\ThemeService;
use Exception;
use File;
use Illuminate\Contracts\Filesystem\FileNotFoundException;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\View\View;
use Theme;
use ThemeOption;

class ThemeController extends BaseController
{
    /**
     * @return Factory|View
     */
    public function index()
    {
        if (!config('packages.theme.general.display_theme_manager_in_admin_panel', true)) {
            abort(404);
        }

        page_title()->setTitle(trans('packages/theme::theme.name'));

        if (File::exists(theme_path('.DS_Store'))) {
            File::delete(theme_path('.DS_Store'));
        }

        Assets::addScriptsDirectly('vendor/core/packages/theme/js/theme.js');

        return view('packages/theme::list');
    }

    /**
     * @return Factory|View
     */
    public function getOptions()
    {
        page_title()->setTitle(trans('packages/theme::theme.theme_options'));

        Assets::addScripts(['are-you-sure', 'colorpicker', 'jquery-ui'])
            ->addStyles(['colorpicker'])
            ->addStylesDirectly([
                'vendor/core/packages/theme/css/theme-options.css',
            ])
            ->addScriptsDirectly([
                'vendor/core/packages/theme/js/theme-options.js',
            ]);

        do_action(RENDERING_THEME_OPTIONS_PAGE);

        return view('packages/theme::options');
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function postUpdate(Request $request, BaseHttpResponse $response)
    {
        foreach ($request->except(['_token', 'ref_lang']) as $key => $value) {
            if (is_array($value)) {
                $value = json_encode($value);

                $field = ThemeOption::getField($key);

                if ($field && Arr::get($field, 'clean_tags', true)) {
                    $value = clean(strip_tags($value));
                }
            }

            ThemeOption::setOption($key, $value);
        }

        ThemeOption::saveOptions();

        return $response->setMessage(trans('core/base::notices.update_success_message'));
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @param ThemeService $themeService
     * @return BaseHttpResponse
     * @throws FileNotFoundException
     */
    public function postActivateTheme(Request $request, BaseHttpResponse $response, ThemeService $themeService)
    {
        if (!config('packages.theme.general.display_theme_manager_in_admin_panel', true)) {
            abort(404);
        }

        $result = $themeService->activate($request->input('theme'));

        if ($result['error']) {
            return $response->setError()->setMessage($result['message']);
        }

        return $response
            ->setMessage(trans('packages/theme::theme.active_success'));
    }

    /**
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function getCustomCss(FormBuilder $formBuilder)
    {
        page_title()->setTitle(trans('packages/theme::theme.custom_css'));

        Assets::addStylesDirectly([
            'vendor/core/core/base/libraries/codemirror/lib/codemirror.css',
            'vendor/core/core/base/libraries/codemirror/addon/hint/show-hint.css',
            'vendor/core/packages/theme/css/custom-css.css',
        ])
            ->addScriptsDirectly([
                'vendor/core/core/base/libraries/codemirror/lib/codemirror.js',
                'vendor/core/core/base/libraries/codemirror/lib/css.js',
                'vendor/core/core/base/libraries/codemirror/addon/hint/show-hint.js',
                'vendor/core/core/base/libraries/codemirror/addon/hint/anyword-hint.js',
                'vendor/core/core/base/libraries/codemirror/addon/hint/css-hint.js',
                'vendor/core/packages/theme/js/custom-css.js',
            ]);

        return $formBuilder->create(CustomCSSForm::class)->renderForm();
    }

    /**
     * @param CustomCssRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function postCustomCss(CustomCssRequest $request, BaseHttpResponse $response)
    {
        File::delete(theme_path(Theme::getThemeName() . '/public/css/style.integration.css'));

        $file = Theme::getStyleIntegrationPath();
        $css = $request->input('custom_css');
        $css = strip_tags($css);

        if (empty($css)) {
            File::delete($file);
        } else {
            $saved = save_file_data($file, $css, false);

            if (!$saved) {
                return $response
                    ->setError()
                    ->setMessage(
                        trans('packages/theme::theme.folder_is_not_writeable', ['name' => File::dirname($file)])
                    );
            }
        }

        return $response->setMessage(trans('packages/theme::theme.update_custom_css_success'));
    }

    /**
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function getCustomJs(FormBuilder $formBuilder)
    {
        if (!config('packages.theme.general.enable_custom_js')) {
            abort(404);
        }

        page_title()->setTitle(trans('packages/theme::theme.custom_js'));

        Assets::addStylesDirectly([
            'vendor/core/core/base/libraries/codemirror/lib/codemirror.css',
            'vendor/core/core/base/libraries/codemirror/addon/hint/show-hint.css',
            'vendor/core/packages/theme/css/custom-css.css',
        ])
            ->addScriptsDirectly([
                'vendor/core/core/base/libraries/codemirror/lib/codemirror.js',
                'vendor/core/core/base/libraries/codemirror/lib/javascript.js',
                'vendor/core/core/base/libraries/codemirror/addon/hint/show-hint.js',
                'vendor/core/core/base/libraries/codemirror/addon/hint/anyword-hint.js',
                'vendor/core/core/base/libraries/codemirror/addon/hint/javascript-hint.js',
                'vendor/core/packages/theme/js/custom-js.js',
            ]);

        return $formBuilder->create(CustomJSForm::class)->renderForm();
    }

    /**
     * @param CustomJsRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function postCustomJs(CustomJsRequest $request, BaseHttpResponse $response)
    {
        if (!config('packages.theme.general.enable_custom_js')) {
            abort(404);
        }

        setting()
            ->set('custom_header_js', $request->input('header_js') ?: '')
            ->set('custom_body_js', $request->input('body_js') ?: '')
            ->set('custom_footer_js', $request->input('footer_js') ?: '')
            ->save();

        return $response->setMessage(trans('packages/theme::theme.update_custom_js_success'));
    }

    /**
     * Remove theme
     *
     * @param Request $request
     * @param BaseHttpResponse $response
     * @param ThemeService $themeService
     * @return mixed
     */
    public function postRemoveTheme(Request $request, BaseHttpResponse $response, ThemeService $themeService)
    {
        if (!config('packages.theme.general.display_theme_manager_in_admin_panel', true)) {
            abort(404);
        }

        $theme = strtolower($request->input('theme'));

        if (in_array($theme, scan_folder(theme_path()))) {
            try {
                $result = $themeService->remove($theme);

                if ($result['error']) {
                    return $response->setError()->setMessage($result['message']);
                }

                return $response->setMessage(trans('packages/theme::theme.remove_theme_success'));
            } catch (Exception $exception) {
                return $response
                    ->setError()
                    ->setMessage($exception->getMessage());
            }
        }

        return $response
            ->setError()
            ->setMessage(trans('packages/theme::theme.theme_is_not_existed'));
    }
}
