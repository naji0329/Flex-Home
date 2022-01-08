<?php

namespace Botble\Language\Http\Controllers;

use Assets;
use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Base\Supports\Language;
use Botble\Language\Http\Requests\LanguageRequest;
use Botble\Language\LanguageManager;
use Botble\Language\Models\LanguageMeta;
use Botble\Language\Repositories\Interfaces\LanguageInterface;
use Botble\Language\Repositories\Interfaces\LanguageMetaInterface;
use Botble\Setting\Models\Setting;
use Botble\Setting\Supports\SettingStore;
use Botble\Widget\Models\Widget;
use Illuminate\Support\Facades\DB;
use Exception;
use File;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\View\View;
use Language as LanguageFacade;
use Theme;
use Throwable;

class LanguageController extends BaseController
{
    /**
     * @var LanguageInterface
     */
    protected $languageRepository;

    /**
     * @var LanguageMetaInterface
     */
    protected $languageMetaRepository;

    /**
     * LanguageController constructor.
     * @param LanguageInterface $languageRepository
     * @param LanguageMetaInterface $languageMetaRepository
     */
    public function __construct(LanguageInterface $languageRepository, LanguageMetaInterface $languageMetaRepository)
    {
        $this->languageRepository = $languageRepository;
        $this->languageMetaRepository = $languageMetaRepository;
    }

    /**
     * @return Factory|View
     */
    public function index()
    {
        page_title()->setTitle(trans('plugins/language::language.name'));

        Assets::addScriptsDirectly(['vendor/core/plugins/language/js/language.js']);

        $languages = Language::getListLanguages();
        $flags = Language::getListLanguageFlags();
        $activeLanguages = $this->languageRepository->all();

        return view('plugins/language::index', compact('languages', 'flags', 'activeLanguages'));
    }

    /**
     * @param LanguageRequest $request
     * @param BaseHttpResponse $response
     * @param LanguageManager $languageManager
     * @return BaseHttpResponse
     * @throws Throwable
     */
    public function postStore(LanguageRequest $request, BaseHttpResponse $response, LanguageManager $languageManager)
    {
        try {
            $language = $this->languageRepository->getFirstBy([
                'lang_code' => $request->input('lang_code'),
            ]);

            if ($language) {
                return $response
                    ->setError()
                    ->setMessage(trans('plugins/language::language.added_already'));
            }

            if ($this->languageRepository->count() == 0) {
                $request->merge(['lang_is_default' => 1]);
            }

            if (!File::isWritable(resource_path('lang')) || !File::isWritable(resource_path('lang/vendor'))) {
                return $response
                    ->setError(true)
                    ->setMessage(trans('plugins/translation::translation.folder_is_not_writeable'));
            }

            $locale = $request->input('lang_locale');

            if (!File::isDirectory(resource_path('lang/' . $locale))) {
                $defaultLocale = resource_path('lang/en');
                if (File::exists($defaultLocale)) {
                    File::copyDirectory($defaultLocale, resource_path('lang/' . $locale));
                }

                $this->createLocaleInPath(resource_path('lang/vendor/core'), $locale);
                $this->createLocaleInPath(resource_path('lang/vendor/packages'), $locale);
                $this->createLocaleInPath(resource_path('lang/vendor/plugins'), $locale);

                $themeLocale = Arr::first(scan_folder(theme_path(Theme::getThemeName() . '/lang')));

                if ($themeLocale) {
                    File::copy(theme_path(Theme::getThemeName() . '/lang/' . $themeLocale), resource_path('lang/' . $locale . '.json'));
                }
            }

            $language = $this->languageRepository->createOrUpdate($request->except('lang_id'));

            $this->clearRoutesCache();

            event(new CreatedContentEvent(LANGUAGE_MODULE_SCREEN_NAME, $request, $language));

            try {
                $models = $languageManager->supportedModels();

                if ($this->languageRepository->count() == 1) {
                    foreach ($models as $model) {

                        if (!class_exists($model)) {
                            continue;
                        }

                        $ids = LanguageMeta::where('reference_type', $model)
                            ->pluck('reference_id')
                            ->all();

                        $table = (new $model)->getTable();

                        $referenceIds = DB::table($table)
                            ->whereNotIn('id', $ids)
                            ->pluck('id')
                            ->all();

                        $data = [];
                        foreach ($referenceIds as $referenceId) {
                            $data[] = [
                                'reference_id'     => $referenceId,
                                'reference_type'   => $model,
                                'lang_meta_code'   => $language->lang_code,
                                'lang_meta_origin' => md5($referenceId . $model . time()),
                            ];
                        }

                        LanguageMeta::insert($data);
                    }
                }
            } catch (Exception $exception) {
                return $response
                    ->setData(view('plugins/language::partials.language-item', ['item' => $language])->render())
                    ->setMessage($exception->getMessage());
            }

            return $response
                ->setData(view('plugins/language::partials.language-item', ['item' => $language])->render())
                ->setMessage(trans('core/base::notices.create_success_message'));
        } catch (Exception $exception) {
            return $response
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     * @throws Throwable
     */
    public function update(Request $request, BaseHttpResponse $response)
    {
        try {
            $language = $this->languageRepository->getFirstBy(['lang_id' => $request->input('lang_id')]);
            if (empty($language)) {
                abort(404);
            }

            $language->fill($request->input());
            $language = $this->languageRepository->createOrUpdate($language);

            $this->clearRoutesCache();

            event(new UpdatedContentEvent(LANGUAGE_MODULE_SCREEN_NAME, $request, $language));

            return $response
                ->setData(view('plugins/language::partials.language-item', ['item' => $language])->render())
                ->setMessage(trans('core/base::notices.update_success_message'));
        } catch (Exception $exception) {
            return $response
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function postChangeItemLanguage(Request $request, BaseHttpResponse $response)
    {
        $referenceId = $request->input('reference_id') ?: $request->input('lang_meta_created_from');
        $currentLanguage = $this->languageMetaRepository->getFirstBy([
            'reference_id'   => $referenceId,
            'reference_type' => $request->input('reference_type'),
        ]);

        $others = $this->languageMetaRepository->getModel();

        if ($currentLanguage) {
            $others = $others->where('lang_meta_code', '!=', $request->input('lang_meta_current_language'))
                ->where('lang_meta_origin', $currentLanguage->origin);
        }

        $others = $others->select(['reference_id', 'lang_meta_code'])->get();

        $data = [];
        foreach ($others as $other) {
            $language = $this->languageRepository->getFirstBy(['lang_code' => $other->lang_code], [
                'lang_flag',
                'lang_name',
                'lang_code',
            ]);

            if (!empty($language) && !empty($currentLanguage) && $language->lang_code != $currentLanguage->lang_meta_code) {
                $data[$language->lang_code]['lang_flag'] = $language->lang_flag;
                $data[$language->lang_code]['lang_name'] = $language->lang_name;
                $data[$language->lang_code]['reference_id'] = $other->reference_id;
            }
        }

        $languages = $this->languageRepository->all();
        foreach ($languages as $language) {
            if (!array_key_exists($language->lang_code,
                    $data) && $language->lang_code != $request->input('lang_meta_current_language')) {
                $data[$language->lang_code]['lang_flag'] = $language->lang_flag;
                $data[$language->lang_code]['lang_name'] = $language->lang_name;
                $data[$language->lang_code]['reference_id'] = null;
            }
        }

        return $response->setData($data);
    }

    /**
     * @param Request $request
     * @param int $id
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function destroy(Request $request, $id, BaseHttpResponse $response)
    {
        try {
            $language = $this->languageRepository->getFirstBy(['lang_id' => $id]);
            $this->languageRepository->delete($language);
            $deleteDefaultLanguage = false;

            if ($language->lang_is_default) {
                $default = $this->languageRepository->getFirstBy([
                    'lang_is_default' => 0,
                ]);

                if ($default) {
                    $default->lang_is_default = 1;
                    $this->languageRepository->createOrUpdate($default);
                    $deleteDefaultLanguage = $default->lang_id;
                }
            }

            $this->clearRoutesCache();

            event(new DeletedContentEvent(LANGUAGE_MODULE_SCREEN_NAME, $request, $language));

            return $response
                ->setData($deleteDefaultLanguage)
                ->setMessage(trans('core/base::notices.delete_success_message'));
        } catch (Exception $exception) {
            return $response
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function getSetDefault(Request $request, BaseHttpResponse $response)
    {
        $defaultLanguage = LanguageFacade::getDefaultLanguage(['lang_id', 'lang_code']);

        $this->languageRepository->update(['lang_is_default' => 1], ['lang_is_default' => 0]);

        $language = $this->languageRepository->getFirstBy(['lang_id' => $request->input('lang_id')]);
        if ($language) {
            $language->lang_is_default = 1;
            $this->languageRepository->createOrUpdate($language);
        }

        try {
            if ($defaultLanguage->lang_id != $request->input('lang_id')) {
                $widgets = Widget::where('theme', 'NOT LIKE', '%-' . $language->lang_code)->get();

                foreach ($widgets as $widget) {
                    $widget->theme = $widget->theme . '-' . $defaultLanguage->lang_code;
                    $widget->save();
                }

                $widgets = Widget::where('theme', 'LIKE', '%-' . $language->lang_code)->get();

                foreach ($widgets as $widget) {
                    $widget->theme = str_replace('-' . $language->lang_code, '', $widget->theme);
                    $widget->save();
                }

                $themeName = Theme::getThemeName();

                $themeOptions = Setting::where('key', 'NOT LIKE', 'theme-' . $themeName . '-' . $language->lang_code . '-%')->get();

                foreach ($themeOptions as $themeOption) {
                    $themeOption->key = str_replace('theme-' . $themeName . '-', 'theme-' . $themeName . '-' . $defaultLanguage->lang_code . '-', $themeOption->key);
                    if (!Setting::where('key', $themeOption->key)->count()) {
                        $themeOption->save();
                    }
                }

                $themeOptions = Setting::where('key', 'LIKE', 'theme-' . $themeName . '-' . $language->lang_code . '-%')->get();

                foreach ($themeOptions as $themeOption) {
                    $themeOption->key = str_replace('theme-' . $themeName . '-' . $language->lang_code . '-', 'theme-' . $themeName . '-', $themeOption->key);

                    if (!Setting::where('key', $themeOption->key)->count()) {
                        $themeOption->save();
                    }
                }
            }
        } catch (Exception $exception) {
            info($exception->getMessage());
        }

        $this->clearRoutesCache();

        event(new UpdatedContentEvent(LANGUAGE_MODULE_SCREEN_NAME, $request, $language));

        return $response->setMessage(trans('core/base::notices.update_success_message'));
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function getLanguage(Request $request, BaseHttpResponse $response)
    {
        $language = $this->languageRepository->getFirstBy(['lang_id' => $request->input('lang_id')]);

        return $response->setData($language);
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @param SettingStore $settingStore
     * @return BaseHttpResponse
     */
    public function postEditSettings(Request $request, BaseHttpResponse $response, SettingStore $settingStore)
    {
        $settingStore
            ->set('language_hide_default', $request->input('language_hide_default', false))
            ->set('language_display', $request->input('language_display'))
            ->set('language_switcher_display', $request->input('language_switcher_display'))
            ->set('language_hide_languages', json_encode($request->input('language_hide_languages', [])))
            ->set('language_auto_detect_user_language', $request->input('language_auto_detect_user_language'))
            ->set('language_show_default_item_if_current_version_not_existed',
                $request->input('language_show_default_item_if_current_version_not_existed'))
            ->save();

        return $response->setMessage(trans('core/base::notices.update_success_message'));
    }

    /**
     * @param string $code
     * @param LanguageManager $language
     * @return RedirectResponse
     * @since 2.2
     */
    public function getChangeDataLanguage($code, LanguageManager $language)
    {
        $previousUrl = strtok(app('url')->previous(), '?');

        $queryString = null;
        if ($code !== $language->getDefaultLocaleCode()) {
            $queryString = '?' . http_build_query(['ref_lang' => $code]);
        }

        return redirect()->to($previousUrl . $queryString);
    }

    /**
     * @param string $path
     * @param string $locale
     * @return int|void
     */
    protected function createLocaleInPath(string $path, $locale)
    {
        $folders = File::directories($path);

        foreach ($folders as $module) {
            foreach (File::directories($module) as $item) {
                if (File::name($item) == 'en') {
                    File::copyDirectory($item, $module . '/' . $locale);
                }
            }
        }

        return count($folders);
    }

    /**
     * @return bool
     */
    public function clearRoutesCache()
    {
        foreach (LanguageFacade::getSupportedLanguagesKeys() as $locale) {

            $path = app()->getCachedRoutesPath();

            if (!$locale) {
                $locale = LanguageFacade::getDefaultLocale();
            }

            $path = substr($path, 0, -4) . '_' . $locale . '.php';

            if (File::exists($path)) {
                File::delete($path);
            }
        }

        return true;
    }
}
