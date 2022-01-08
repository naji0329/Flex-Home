<?php

namespace Botble\Language;

use Botble\Language\Models\Language;
use Botble\Language\Repositories\Interfaces\LanguageInterface;
use Botble\Language\Repositories\Interfaces\LanguageMetaInterface;
use Eloquent;
use Exception;
use Illuminate\Contracts\Routing\UrlRoutable;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Foundation\Application;
use Illuminate\Http\Request as HttpRequest;
use Illuminate\Routing\Router;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;
use Illuminate\Support\Str;
use Illuminate\Translation\Translator;
use Request;

class LanguageManager
{
    /**
     * The env key that the forced locale for routing is stored in.
     */
    protected $envRoutingKey = 'ROUTING_LOCALE';

    /**
     * @var LanguageInterface
     */
    protected $languageRepository;

    /**
     * Illuminate translator class.
     *
     * @var Translator
     */
    protected $translator;

    /**
     * Illuminate router class.
     *
     * @var Router
     */
    protected $router;

    /**
     * @var Application|mixed
     */
    protected $app;

    /**
     * @var
     */
    protected $baseUrl;

    /**
     * Default locale
     *
     * @var string
     */
    protected $defaultLocale;

    /**
     * Supported Locales
     *
     * @var array
     */
    protected $supportedLocales;

    /**
     * Current locale
     *
     * @var string
     */
    protected $currentLocale = false;

    /**
     * An array that contains all routes that should be translated
     *
     * @var array
     */
    protected $translatedRoutes = [];

    /**
     * Name of the translation key of the current route, it is used for url translations
     *
     * @var string
     */
    protected $routeName;

    /**
     * @var LanguageMetaInterface
     */
    protected $languageMetaRepository;

    /**
     * @var string
     */
    protected $currentAdminLocaleCode;

    /**
     * @var array
     */
    protected $activeLanguages = [];

    /**
     * @var array
     */
    protected $activeLanguageSelect = ['*'];

    /**
     * @var Language
     */
    protected $defaultLanguage;

    /**
     * @var array
     */
    protected $defaultLanguageSelect = ['*'];

    /**
     * @var array
     */
    protected $switcherURLs = [];

    /**
     * Language constructor.
     * @param LanguageInterface $languageRepository
     * @param LanguageMetaInterface $languageMetaRepository
     * @param HttpRequest $request
     *
     * @since 2.0
     */
    public function __construct(
        LanguageInterface $languageRepository,
        LanguageMetaInterface $languageMetaRepository,
        HttpRequest $request
    ) {
        $this->languageRepository = $languageRepository;

        $this->app = app();

        $this->translator = $this->app['translator'];
        $this->router = $this->app['router'];
        $this->request = $this->app['request'];
        $this->url = $this->app['url'];

        $this->supportedLocales = $this->getSupportedLocales();

        $this->setDefaultLocale();

        $this->defaultLocale = $this->getDefaultLocale();

        $this->languageMetaRepository = $languageMetaRepository;

        if ($request->has('ref_lang')) {
            $this->currentAdminLocaleCode = $request->input('ref_lang');
        }
    }

    /**
     * Return an array of all supported Locales
     *
     * @return array
     */
    public function getSupportedLocales()
    {
        if (!empty($this->supportedLocales)) {
            return $this->supportedLocales;
        }

        $languages = $this->getActiveLanguage();

        $locales = [];
        foreach ($languages as $language) {
            if (!in_array($language->lang_id, json_decode(setting('language_hide_languages', '[]'), true))) {
                $locales[$language->lang_locale] = [
                    'lang_name'       => $language->lang_name,
                    'lang_locale'     => $language->lang_locale,
                    'lang_code'       => $language->lang_code,
                    'lang_flag'       => $language->lang_flag,
                    'lang_is_rtl'     => $language->lang_is_rtl,
                    'lang_is_default' => $language->lang_is_default,
                ];
            }
        }

        $this->supportedLocales = $locales;

        return $locales;
    }

    /**
     * Set and return supported locales
     *
     * @param array $locales Locales that the App supports
     */
    public function setSupportedLocales($locales)
    {
        $this->supportedLocales = $locales;
    }

    /**
     * @param array $select
     * @return array|Collection
     * @since 2.0
     */
    public function getActiveLanguage($select = ['*'])
    {
        if ($this->activeLanguages && $this->activeLanguageSelect === $select) {
            return $this->activeLanguages;
        }

        $this->activeLanguages = $this->languageRepository->getActiveLanguage($select);
        $this->activeLanguageSelect = $select;

        return $this->activeLanguages;
    }

    /**
     * Returns default locale
     *
     * @return string
     */
    public function getDefaultLocale()
    {
        return $this->defaultLocale;
    }

    /**
     * @return void
     */
    public function setDefaultLocale()
    {
        foreach ($this->supportedLocales as $key => $language) {
            if ($language['lang_is_default']) {
                $this->defaultLocale = $key;
            }
        }

        if (empty($this->defaultLocale)) {
            $this->defaultLocale = config('app.locale');
        }
    }

    /**
     * @return string
     * @since 2.1
     */
    public function getHiddenLanguageText()
    {
        $hidden = json_decode(setting('language_hide_languages', '[]'), true);
        $text = '';
        $languages = $this->getActiveLanguage();

        if (!empty($languages)) {
            $languages = $languages->pluck('lang_name', 'lang_id')->all();
        } else {
            $languages = [];
        }

        foreach ($hidden as $item) {
            if (array_key_exists($item, $languages)) {
                if (!empty($text)) {
                    $text .= ', ';
                }
                $text .= $languages[$item];
            }
        }

        return $text;
    }

    /**
     * @param int $id
     * @param string $uniqueKey
     * @return array
     * @since 2.0
     */
    public function getRelatedLanguageItem($id, $uniqueKey)
    {
        /**
         * @var Builder $meta
         */
        $meta = $this->languageMetaRepository->getModel()->where('lang_meta_origin', $uniqueKey);

        if ($id != Request::input('ref_from')) {
            $meta = $meta->where('reference_id', '!=', $id);
        }

        return $meta->pluck('reference_id', 'lang_meta_code')->all();
    }

    /**
     * Returns a URL adapted to $locale or current locale
     *
     * @param string $url URL to adapt. If not passed, the current url would be taken.
     * @param string|boolean $locale Locale to adapt, false to remove locale
     * @return string URL translated
     */
    public function localizeURL($url = null, $locale = null)
    {
        return $this->getLocalizedURL($locale, $url, [], false);
    }

    /**
     * Returns a URL adapted to $locale
     *
     * @param string|boolean $locale Locale to adapt, false to remove locale
     * @param string|false $url URL to adapt in the current language. If not passed, the current url would be taken.
     * @param array $attributes Attributes to add to the route,
     * if empty, the system would try to extract them from the url.
     *
     * @return string|false URL translated, False if url does not exist
     */
    public function getLocalizedURL($locale = null, $url = null, $attributes = [], $forceDefaultLocation = true)
    {
        if ($locale === null) {
            $locale = $this->getCurrentLocale();
        }

        if (!$this->checkLocaleInSupportedLocales($locale)) {
            $locale = $this->getCurrentLocale();
        }

        if (empty($attributes)) {
            $attributes = $this->extractAttributes($url, $locale);
        }

        $urlQuery = parse_url($url, PHP_URL_QUERY);
        $urlQuery = $urlQuery ? '?' . $urlQuery : '';

        if (empty($url)) {
            $url = $this->request->fullUrl();
            $urlQuery = parse_url($url, PHP_URL_QUERY);
            $urlQuery = $urlQuery ? '?' . $urlQuery : '';

            if (!empty($this->routeName)) {
                return $this->getURLFromRouteNameTranslated($locale, $this->routeName, $attributes,
                        $forceDefaultLocation) . $urlQuery;
            }
        } else {
            $url = $this->url->to($url);
        }

        $url = preg_replace('/' . preg_quote($urlQuery, '/') . '$/', '', $url);

        if ($locale && $translatedRoute = $this->findTranslatedRouteByUrl($url, $attributes, $this->currentLocale)) {
            return $this->getURLFromRouteNameTranslated($locale, $translatedRoute, $attributes,
                    $forceDefaultLocation) . $urlQuery;
        }

        $basePath = $this->request->getBaseUrl();
        $parsedUrl = parse_url($url);
        $urlLocale = $this->getDefaultLocale();

        if (!$parsedUrl || empty($parsedUrl['path'])) {
            $path = $parsedUrl['path'] = '';
        } else {
            $parsedUrl['path'] = str_replace($basePath, '', '/' . ltrim($parsedUrl['path'], '/'));
            $path = $parsedUrl['path'];
            foreach ($this->getSupportedLocales() as $localeCode => $lang) {
                $localeCode = $this->getLocaleFromMapping($localeCode);

                $parsedUrl['path'] = preg_replace('%^/?' . $localeCode . '/%', '$1', $parsedUrl['path']);
                if ($parsedUrl['path'] !== $path) {
                    $urlLocale = $localeCode;
                    break;
                }

                $parsedUrl['path'] = preg_replace('%^/?' . $localeCode . '$%', '$1', $parsedUrl['path']);
                if ($parsedUrl['path'] !== $path) {
                    $urlLocale = $localeCode;
                    break;
                }
            }
        }

        $parsedUrl['path'] = ltrim($parsedUrl['path'], '/');

        if ($translatedRoute = $this->findTranslatedRouteByPath($parsedUrl['path'], $urlLocale)) {
            return $this->getURLFromRouteNameTranslated($locale, $translatedRoute, $attributes,
                    $forceDefaultLocation) . $urlQuery;
        }

        $locale = $this->getLocaleFromMapping($locale);

        if (!empty($locale)) {
            if ($forceDefaultLocation || $locale != $this->getDefaultLocale() || !$this->hideDefaultLocaleInURL()) {
                $parsedUrl['path'] = $locale . '/' . ltrim($parsedUrl['path'], '/');
            }
        }
        $parsedUrl['path'] = ltrim(ltrim($basePath, '/') . '/' . $parsedUrl['path'], '/');

        // Make sure that the pass path is returned with a leading slash only if it comes in with one.
        if (Str::startsWith($path, '/') === true) {
            $parsedUrl['path'] = '/' . $parsedUrl['path'];
        }
        $parsedUrl['path'] = rtrim($parsedUrl['path'], '/');

        $url = $this->unparseUrl($parsedUrl);

        if ($this->checkUrl($url)) {
            return $url . $urlQuery;
        }

        return $this->createUrlFromUri($url) . $urlQuery;
    }

    /**
     * Returns current language
     *
     * @return string current language
     */
    public function getCurrentLocale()
    {
        if ($this->currentLocale) {
            return $this->currentLocale;
        }

        if ($this->useAcceptLanguageHeader() && !$this->app->runningInConsole()) {
            $negotiator = new LanguageNegotiator($this->defaultLocale, $this->getSupportedLocales(), $this->request);

            return $negotiator->negotiateLanguage();
        }

        // or get application default language
        return $this->getDefaultLocale();
    }

    /**
     * Check if Locale exists on the supported locales array
     *
     * @param string|boolean $locale string|bool Locale to be checked
     * @return boolean is the locale supported?
     */
    public function checkLocaleInSupportedLocales($locale)
    {
        $locales = $this->getSupportedLocales();
        if ($locale !== false && empty($locales[$locale])) {
            return false;
        }

        return true;
    }

    /**
     * Extract attributes for current url
     *
     * @param bool|false|null|string $url to extract attributes,
     * if not present, the system will look for attributes in the current call
     *
     * @param string $locale
     * @return array Array with attributes
     */
    protected function extractAttributes($url = false, $locale = '')
    {
        if (!empty($url)) {
            $attributes = [];
            $parse = parse_url($url);
            if (isset($parse['path'])) {
                $parse = explode('/', $parse['path']);
            } else {
                $parse = [];
            }
            $url = [];
            foreach ($parse as $segment) {
                if (!empty($segment)) {
                    $url[] = $segment;
                }
            }
            foreach ($this->router->getRoutes() as $route) {
                $path = $route->uri();
                if (!preg_match('/{[\w]+}/', $path)) {
                    continue;
                }

                $path = explode('/', $path);
                $index = 0;

                $match = true;
                foreach ($path as $key => $segment) {
                    if (isset($url[$index])) {
                        if ($segment === $url[$index]) {
                            $index++;
                            continue;
                        }
                        if (preg_match('/{[\w]+}/', $segment)) {
                            // must-have parameters
                            $attribute_name = preg_replace(['/}/', '/{/', '/\?/'], '', $segment);
                            $attributes[$attribute_name] = $url[$index];
                            $index++;
                            continue;
                        }
                        if (preg_match('/{[\w]+\?}/', $segment)) {
                            // optional parameters
                            if (!isset($path[$key + 1]) || $path[$key + 1] !== $url[$index]) {
                                // optional parameter taken
                                $attribute_name = preg_replace(['/}/', '/{/', '/\?/'], '', $segment);
                                $attributes[$attribute_name] = $url[$index];
                                $index++;
                                continue;
                            }
                        }
                    } elseif (!preg_match('/{[\w]+\?}/', $segment)) {
                        // no optional parameters but no more $url given
                        // this route does not match the url
                        $match = false;
                        break;
                    }
                }

                if (isset($url[$index + 1])) {
                    $match = false;
                }

                if ($match) {
                    return $attributes;
                }
            }
        } else {
            if (!$this->router->current()) {
                return [];
            }

            $attributes = $this->normalizeAttributes($this->router->current()->parameters());
            $response = event('routes.translation', [$locale, $attributes]);

            if (!empty($response)) {
                $response = array_shift($response);
            }

            if (is_array($response)) {
                $attributes = array_merge($attributes, $response);
            }
        }

        return $attributes;
    }

    /**
     * Normalize attributes gotten from request parameters.
     *
     * @param array $attributes The attributes
     * @return array  The normalized attributes
     */
    protected function normalizeAttributes($attributes)
    {
        if (array_key_exists('data', $attributes) && is_array($attributes['data']) && !count($attributes['data'])) {
            $attributes['data'] = null;
            return $attributes;
        }

        return $attributes;
    }

    /**
     * Returns a URL adapted to the route name and the locale given
     *
     * @param string|boolean $locale Locale to adapt
     * @param string $transKeyName Translation key name of the url to adapt
     * @param array $attributes Attributes for the route (only needed if transKeyName needs them)
     *
     * @return string|false URL translated
     */
    public function getURLFromRouteNameTranslated(
        $locale,
        $transKeyName,
        $attributes = [],
        $forceDefaultLocation = false
    ) {
        if (!$this->checkLocaleInSupportedLocales($locale)) {
            return false;
        }

        if (!is_string($locale)) {
            $locale = $this->getDefaultLocale();
        }

        $route = '';

        if ($forceDefaultLocation || !($locale === $this->defaultLocale && $this->hideDefaultLocaleInURL())) {
            $route = '/' . $locale;
        }
        if (is_string($locale) && $this->translator->has($transKeyName, $locale)) {
            $translation = $this->translator->get($transKeyName, [], $locale);
            $route .= '/' . $translation;

            $route = $this->substituteAttributesInRoute($attributes, $route, $locale);
        }

        if (empty($route)) {
            // This locale does not have any key for this route name
            return false;
        }

        return rtrim($this->createUrlFromUri($route), '/');
    }

    /**
     * Returns the translation key for a given path
     *
     * @return boolean Returns value of hideDefaultLocaleInURL in config.
     */
    public function hideDefaultLocaleInURL()
    {
        return setting('language_hide_default', config('plugins.language.general.hideDefaultLocaleInURL'));
    }

    /**
     * Change route attributes for the ones in the $attributes array
     *
     * @param $attributes array Array of attributes
     * @param string $route string route to substitute
     * @return string route with attributes changed
     */
    protected function substituteAttributesInRoute($attributes, $route, $locale = null)
    {
        foreach ($attributes as $key => $value) {
            if ($value instanceof Interfaces\LocalizedUrlRoutable) {
                $value = $value->getLocalizedRouteKey($locale);
            } elseif ($value instanceof UrlRoutable) {
                $value = $value->getRouteKey();
            }
            $route = str_replace(['{' . $key . '}', '{' . $key . '?}'], $value, $route);
        }

        // delete empty optional arguments that are not in the $attributes array
        $route = preg_replace('/\/{[^)]+\?}/', '', $route);

        return $route;
    }

    /**
     * Create an url from the uri
     * @param string $uri Uri
     *
     * @return  string Url for the given uri
     */
    public function createUrlFromUri($uri)
    {
        $uri = ltrim($uri, '/');

        if (empty($this->baseUrl)) {
            return app('url')->to($uri);
        }

        return $this->baseUrl . $uri;
    }

    /**
     * Returns the translated route for an url and the attributes given and a locale
     *
     * @param string|false|null $url Url to check if it is a translated route
     * @param array $attributes Attributes to check if the url exists in the translated routes array
     * @param string $locale Language to check if the url exists
     *
     * @return string|false Key for translation, false if not exist
     */
    protected function findTranslatedRouteByUrl($url, $attributes, $locale)
    {
        if (empty($url)) {
            return false;
        }

        // Check if this url is a translated url
        foreach ($this->translatedRoutes as $translatedRoute) {
            $routeName = $this->getURLFromRouteNameTranslated($locale, $translatedRoute, $attributes);

            if ($this->getNonLocalizedURL($routeName) == $this->getNonLocalizedURL($url)) {
                return $translatedRoute;
            }
        }

        return false;
    }

    /**
     * It returns a URL without locale (if it has it)
     * Convenience function wrapping getLocalizedURL(false)
     *
     * @param string|false $url URL to clean, if false, current url would be taken
     *
     * @return string URL with no locale in path
     */
    public function getNonLocalizedURL($url = null)
    {
        return $this->getLocalizedURL(false, $url, [], false);
    }

    /**
     * Returns a locale from the mapping.
     *
     * @param string|null $locale
     *
     * @return string|null
     */
    public function getLocaleFromMapping($locale)
    {
        return $this->getLocalesMapping()[$locale] ?? $locale;
    }

    /**
     * Return locales mapping.
     *
     * @return array
     */
    public function getLocalesMapping()
    {
        if (empty($this->localesMapping)) {
            $this->localesMapping = config('plugins.language.general.localesMapping');
        }

        return $this->localesMapping;
    }

    /**
     * Returns the translated route for the path and the url given
     *
     * @param string $path Path to check if it is a translated route
     * @param string $urlLocale Language to check if the path exists
     *
     * @return string|false Key for translation, false if not exist
     */
    protected function findTranslatedRouteByPath($path, $urlLocale)
    {
        // Check if this url is a translated url
        foreach ($this->translatedRoutes as $translatedRoute) {
            if ($this->translator->get($translatedRoute, [], $urlLocale) == rawurldecode($path)) {
                return $translatedRoute;
            }
        }

        return false;
    }

    /**
     * Build URL using array data from parse_url
     *
     * @param array|false $parsedUrl Array of data from parse_url function
     *
     * @return string Returns URL as string.
     */
    protected function unparseUrl($parsedUrl)
    {
        if (empty($parsedUrl)) {
            return '';
        }

        $url = '';
        $url .= isset($parsedUrl['scheme']) ? $parsedUrl['scheme'] . '://' : '';
        $url .= isset($parsedUrl['host']) ? $parsedUrl['host'] : '';
        $url .= isset($parsedUrl['port']) ? ':' . $parsedUrl['port'] : '';
        $user = isset($parsedUrl['user']) ? $parsedUrl['user'] : '';
        $pass = isset($parsedUrl['pass']) ? ':' . $parsedUrl['pass'] : '';
        $url .= $user . (($user || $pass) ? $pass . '@' : '');

        if (!empty($url)) {
            $url .= isset($parsedUrl['path']) ? '/' . ltrim($parsedUrl['path'], '/') : '';
        } else {
            $url .= isset($parsedUrl['path']) ? $parsedUrl['path'] : '';
        }

        $url .= isset($parsedUrl['query']) ? '?' . $parsedUrl['query'] : '';
        $url .= isset($parsedUrl['fragment']) ? '#' . $parsedUrl['fragment'] : '';

        return $url;
    }

    /**
     * Returns true if the string given is a valid url
     *
     * @param string $url String to check if it is a valid url
     *
     * @return boolean Is the string given a valid url?
     */
    protected function checkUrl($url)
    {
        return filter_var($url, FILTER_VALIDATE_URL);
    }

    /**
     * Returns inversed locale from the mapping.
     *
     * @param string|null $locale
     *
     * @return string|null
     */
    public function getInversedLocaleFromMapping($locale)
    {
        return array_flip($this->getLocalesMapping())[$locale] ?? $locale;
    }

    /**
     * Returns current locale name
     *
     * @return string current locale name
     */
    public function getCurrentLocaleName()
    {
        if (empty($this->supportedLocales)) {
            return null;
        }

        return Arr::get($this->supportedLocales, $this->getCurrentLocale() . '.lang_name');
    }

    /**
     * Returns current text direction
     *
     * @return string current locale name
     *
     */
    public function getCurrentLocaleRTL()
    {
        if (empty($this->supportedLocales)) {
            return false;
        }

        return Arr::get($this->supportedLocales, $this->getCurrentLocale() . '.lang_is_rtl');
    }

    /**
     * Returns current locale code
     *
     * @return string current locale code
     */
    public function getCurrentLocaleCode()
    {
        if (empty($this->supportedLocales)) {
            return null;
        }

        return Arr::get($this->supportedLocales, $this->getCurrentLocale() . '.lang_code');
    }

    /**
     * @param string $localeCode
     * @return null|string
     */
    public function getLocaleByLocaleCode(string $localeCode)
    {
        $language = collect($this->supportedLocales)->where('lang_code', $localeCode)->first();

        if ($language) {
            return $language['lang_locale'];
        }

        return null;
    }

    /**
     * @param string $code
     */
    public function setCurrentAdminLocale($code)
    {
        $this->currentAdminLocaleCode = $code;
    }

    /**
     * Returns current admin locale code
     *
     * @return string current locale code
     */
    public function getCurrentAdminLocale()
    {
        $adminLocale = $this->getCurrentAdminLocaleCode();
        foreach ($this->supportedLocales as $locale => $supportedLocale) {
            if ($supportedLocale['lang_code'] == $adminLocale) {
                return $locale;
            }
        }

        return $adminLocale;
    }

    /**
     * Returns current admin locale code
     *
     * @return string current locale code
     */
    public function getCurrentAdminLocaleCode()
    {
        if (empty($this->supportedLocales)) {
            return null;
        }

        if ($this->currentAdminLocaleCode) {
            return $this->currentAdminLocaleCode;
        }

        if ($this->request->has('ref_lang')) {
            return $this->request->input('ref_lang');
        }

        return Arr::get($this->supportedLocales, $this->getCurrentLocale() . '.lang_code');
    }

    /**
     * Returns current locale code
     *
     * @return string current locale code
     */
    public function getDefaultLocaleCode()
    {
        if (empty($this->supportedLocales)) {
            return null;
        }

        return Arr::get($this->supportedLocales, $this->getDefaultLocale() . '.lang_code', config('app.locale'));
    }

    /**
     * Returns current locale code
     *
     * @return string current locale code
     */
    public function getCurrentLocaleFlag()
    {
        if (empty($this->supportedLocales)) {
            return null;
        }

        return Arr::get($this->supportedLocales, $this->getCurrentLocale() . '.lang_flag');
    }

    /**
     * Returns supported languages language key
     *
     * @return array keys of supported languages
     */
    public function getSupportedLanguagesKeys()
    {
        return array_keys($this->supportedLocales);
    }

    /**
     * Set current route name
     * @param string $routeName current route name
     */
    public function setRouteName($routeName)
    {
        $this->routeName = $routeName;
    }

    /**
     * Translate routes and save them to the translated routes array (used in the localize route filter)
     *
     * @param string $routeName Key of the translated string
     *
     * @return string Translated string
     */
    public function transRoute($routeName)
    {
        if (!in_array($routeName, $this->translatedRoutes)) {
            $this->translatedRoutes[] = $routeName;
        }

        return $this->translator->get($routeName);
    }

    /**
     * Returns the translation key for a given path
     *
     * @param string $path Path to get the key translated
     *
     * @return string|false Key for translation, false if not exist
     */
    public function getRouteNameFromAPath($path)
    {
        $attributes = $this->extractAttributes($path);

        $path = str_replace(route('public.index'), '', $path);
        if ($path[0] !== '/') {
            $path = '/' . $path;
        }
        $path = str_replace('/' . $this->currentLocale . '/', '', $path);
        $path = trim($path, '/');

        foreach ($this->translatedRoutes as $route) {
            if ($this->substituteAttributesInRoute($attributes, $this->translator->get($route)) === $path) {
                return $route;
            }
        }

        return false;
    }

    /**
     * Sets the base url for the site
     * @param string $url Base url for the site
     */
    public function setBaseUrl($url)
    {
        if (substr($url, -1) != '/') {
            $url .= '/';
        }

        $this->baseUrl = $url;
    }

    /**
     * @param string $screen
     * @param HttpRequest $request
     * @param Eloquent|false $data
     * @return bool
     */
    public function saveLanguage($screen, $request, $data)
    {
        $defaultLanguage = $this->getDefaultLanguage(['lang_id']);
        if (!empty($defaultLanguage)) {
            if ($data != false && in_array(get_class($data), $this->supportedModels())) {
                if ($request->input('language')) {
                    $uniqueKey = null;
                    $meta = $this->languageMetaRepository->getFirstBy(
                        [
                            'reference_id'   => $data->id,
                            'reference_type' => get_class($data),
                        ]
                    );
                    if (!$meta && !$request->input('ref_from')) {
                        $uniqueKey = md5($data->id . $screen . time());
                    } elseif ($request->input('ref_from')) {
                        $uniqueKey = $this->languageMetaRepository->getFirstBy(
                            [
                                'reference_id'   => $request->input('ref_from'),
                                'reference_type' => get_class($data),
                            ]
                        )->lang_meta_origin;
                    }

                    if (!$meta) {
                        $meta = $this->languageMetaRepository->getModel();
                        $meta->reference_id = $data->id;
                        $meta->reference_type = get_class($data);
                        $meta->lang_meta_origin = $uniqueKey;
                    }

                    $meta->lang_meta_code = $request->input('language');
                    $this->languageMetaRepository->createOrUpdate($meta);

                    return true;
                }
            }
        }

        return false;
    }

    /**
     * @param array $select
     * @return Language
     * @since 2.2
     */
    public function getDefaultLanguage($select = ['*'])
    {
        if ($this->defaultLanguage && $this->defaultLanguageSelect === $select) {
            return $this->defaultLanguage;
        }

        $this->defaultLanguage = $this->languageRepository->getDefaultLanguage($select);
        $this->defaultLanguageSelect = $select;

        return $this->defaultLanguage;
    }

    /**
     * @return array
     * @since 2.0
     */
    public function supportedModels()
    {
        return apply_filters(LANGUAGE_FILTER_MODEL_USING_MULTI_LANGUAGE,
            config('plugins.language.general.supported', []));
    }

    /**
     * @param string $screen
     * @param Eloquent|false $data
     */
    public function deleteLanguage($screen, $data)
    {
        $defaultLanguage = $this->getDefaultLanguage(['lang_id']);
        if (!empty($defaultLanguage) && in_array(get_class($data), $this->supportedModels())) {
            $this->languageMetaRepository->deleteBy([
                'reference_id'   => $data->id,
                'reference_type' => get_class($data),
            ]);
            return true;
        }

        return false;
    }

    /**
     * @param string | array $model
     * @return LanguageManager
     */
    public function registerModule($model)
    {
        if (!is_array($model)) {
            $model = [$model];
        }
        config([
            'plugins.language.general.supported' => array_merge(config('plugins.language.general.supported', []),
                $model),
        ]);

        return $this;
    }

    /**
     * Set and return current locale
     *
     * @param string $locale Locale to set the App to (optional)
     * @return string Returns locale (if route has any) or null (if route does not have a locale)
     * @throws Exception
     */
    public function setLocale($locale = null)
    {
        if (empty($locale) || !is_string($locale)) {
            // If the locale has not been passed through the function
            // it tries to get it from the first segment of the url
            $locale = $this->request->segment(1);

            $localeFromRequest = $this->request->input('language');

            if ($localeFromRequest && array_key_exists($localeFromRequest, $this->supportedLocales)) {
                $locale = $localeFromRequest;
            }

            if (!$locale) {
                $locale = $this->getForcedLocale();
            }
        }

        if (array_key_exists($locale, $this->supportedLocales)) {
            $this->currentLocale = $locale;
        } else {
            // if the first segment/locale passed is not valid
            // the system would ask which locale have to take
            // it could be taken by the browser
            // depending on your configuration

            $locale = null;

            // if we reached this point and hideDefaultLocaleInURL is true
            // we have to assume we are routing to a defaultLocale route.
            if ($this->hideDefaultLocaleInURL()) {
                $this->currentLocale = $this->defaultLocale;
            }
            // but if hideDefaultLocaleInURL is false, we have
            // to retrieve it from the browser...
            else {
                $this->currentLocale = $this->getCurrentLocale();
            }
        }

        $this->app->setLocale($this->currentLocale);

        return $locale;
    }

    /**
     * Returns the forced environment set route locale.
     *
     * @return string|null
     */
    public function getForcedLocale()
    {
        return env($this->envRoutingKey, function () {
            $value = getenv($this->envRoutingKey);

            if ($value !== false) {
                return $value;
            }
        });
    }

    /**
     * Returns the translation key for a given path
     *
     * @return boolean Returns value of useAcceptLanguageHeader in config.
     */
    public function useAcceptLanguageHeader()
    {
        return setting('language_auto_detect_user_language', false);
    }

    /**
     * @param array $urls
     * @return $this
     */
    public function setSwitcherURLs(array $urls): self
    {
        $this->switcherURLs = $urls;

        return $this;
    }

    /**
     * @param string $localeCode
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\Routing\UrlGenerator|mixed|string
     */
    public function getSwitcherUrl(string $localeCode, string $languageCode)
    {
        if (count($this->switcherURLs)) {
            $url = collect($this->switcherURLs)->where('lang_code', $languageCode)->first();

            if ($url) {
                return rtrim($url['url'], '/') == rtrim(url(''), '/') ? url($localeCode) : $url['url'];
            }
        }

        $showRelated = setting('language_show_default_item_if_current_version_not_existed', true);

        return $showRelated ? $this->getLocalizedURL($localeCode) : url($localeCode);
    }

    /**
     * Returns serialized translated routes for caching purposes.
     *
     * @return string
     */
    public function getSerializedTranslatedRoutes()
    {
        return base64_encode(serialize($this->translatedRoutes));
    }

    /**
     * Sets the translated routes list.
     * Only useful from a cached routes context.
     *
     * @param string $serializedRoutes
     */
    public function setSerializedTranslatedRoutes($serializedRoutes)
    {
        if (!$serializedRoutes) {
            return;
        }

        $this->translatedRoutes = unserialize(base64_decode($serializedRoutes));
    }

    /**
     * @return string
     * @throws Exception
     */
    public function setRoutesCachePath(): string
    {
        $this->setLocale();

        // compute $locale from url.
        // It is null if url does not contain locale.
        $locale = $this->getCurrentLocale();

        $localeKeys = $this->getSupportedLocales();

        $path = $this->app->getCachedRoutesPath();

        if ($locale && !in_array($locale, $localeKeys) && (!$this->hideDefaultLocaleInURL() || $locale != $this->getDefaultLocale())) {

            $path = substr($path, 0, -4) . '_' . $locale . '.php';

            if (file_exists($path)) {
                putenv('APP_ROUTES_CACHE=' . $path);
            }
        }

        return $path;
    }
}
