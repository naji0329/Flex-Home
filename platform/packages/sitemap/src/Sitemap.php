<?php

namespace Botble\Sitemap;

use Carbon\Carbon;
use DateTime;
use Illuminate\View\Factory as ViewFactory;
use Illuminate\Cache\Repository as CacheRepository;
use Illuminate\Filesystem\Filesystem as Filesystem;
use Illuminate\Config\Repository as ConfigRepository;
use Illuminate\Contracts\Routing\ResponseFactory as ResponseFactory;

class Sitemap
{
    /**
     * Model instance.
     *
     * @var Model
     */
    public $model = null;

    /**
     * CacheRepository instance.
     *
     * @var CacheRepository
     */
    public $cache = null;

    /**
     * ConfigRepository instance.
     *
     * @var ConfigRepository
     */
    protected $configRepository = null;

    /**
     * Filesystem instance.
     *
     * @var Filesystem
     */
    protected $file = null;

    /**
     * ResponseFactory instance.
     *
     * @var ResponseFactory
     */
    protected $response = null;

    /**
     * ViewFactory instance.
     *
     * @var ViewFactory
     */
    protected $view = null;

    /**
     * Using constructor we populate our model from configuration file and loading dependencies.
     *
     * @param array $config
     */
    public function __construct(
        array $config,
        CacheRepository $cache,
        ConfigRepository $configRepository,
        Filesystem $file,
        ResponseFactory $response,
        ViewFactory $view
    ) {
        $this->cache = $cache;
        $this->configRepository = $configRepository;
        $this->file = $file;
        $this->response = $response;
        $this->view = $view;

        $this->model = new Model($config);
    }

    /**
     * Set cache options.
     *
     * @param string $key
     * @param Carbon|Datetime|int $duration
     * @param bool $useCache
     */
    public function setCache($key = null, $duration = null, $useCache = true)
    {
        $this->model->setUseCache($useCache);

        if (null !== $key) {
            $this->model->setCacheKey($key);
        }

        if (null !== $duration) {
            $this->model->setCacheDuration($duration);
        }
    }

    /**
     * Add new sitemap item to $items array.
     *
     * @param string $loc
     * @param string $lastmod
     * @param string $priority
     * @param string $freq
     * @param array $images
     * @param string $title
     * @param array $translations
     * @param array $videos
     * @param array $googlenews
     * @param array $alternates
     *
     * @return void
     */
    public function add(
        $loc,
        $lastmod = null,
        $priority = null,
        $freq = null,
        $images = [],
        $title = null,
        $translations = [],
        $videos = [],
        $googlenews = [],
        $alternates = []
    ) {
        $params = [
            'loc'          => $loc,
            'lastmod'      => $lastmod,
            'priority'     => $priority,
            'freq'         => $freq,
            'images'       => $images,
            'title'        => $title,
            'translations' => $translations,
            'videos'       => $videos,
            'googlenews'   => $googlenews,
            'alternates'   => $alternates,
        ];

        $this->addItem($params);
    }

    /**
     * Add new sitemap one or multiple items to $items array.
     *
     * @param array $params
     * @return void
     */
    public function addItem($params = [])
    {
        // if is multidimensional
        if (array_key_exists(1, $params)) {
            foreach ($params as $param) {
                $this->addItem($param);
            }

            return;
        }

        // get params
        foreach ($params as $key => $value) {
            $$key = $value;
        }

        // set default values
        if (!isset($loc)) {
            $loc = '/';
        }
        if (!isset($lastmod)) {
            $lastmod = null;
        }
        if (!isset($priority)) {
            $priority = null;
        }
        if (!isset($freq)) {
            $freq = null;
        }
        if (!isset($title)) {
            $title = null;
        }
        if (!isset($images)) {
            $images = [];
        }
        if (!isset($translations)) {
            $translations = [];
        }
        if (!isset($alternates)) {
            $alternates = [];
        }
        if (!isset($videos)) {
            $videos = [];
        }
        if (!isset($googlenews)) {
            $googlenews = [];
        }

        // escaping
        if ($this->model->isEscaping()) {
            $loc = htmlentities($loc, ENT_XML1);

            if ($title != null) {
                $title = htmlentities($title, ENT_XML1);
            }

            if ($images) {
                foreach ($images as $k => $image) {
                    foreach ($image as $key => $value) {
                        $images[$k][$key] = htmlentities($value, ENT_XML1);
                    }
                }
            }

            if ($translations) {
                foreach ($translations as $k => $translation) {
                    foreach ($translation as $key => $value) {
                        $translations[$k][$key] = htmlentities($value, ENT_XML1);
                    }
                }
            }

            if ($alternates) {
                foreach ($alternates as $k => $alternate) {
                    foreach ($alternate as $key => $value) {
                        $alternates[$k][$key] = htmlentities($value, ENT_XML1);
                    }
                }
            }

            if ($videos) {
                foreach ($videos as $k => $video) {
                    if (!empty($video['title'])) {
                        $videos[$k]['title'] = htmlentities($video['title'], ENT_XML1);
                    }
                    if (!empty($video['description'])) {
                        $videos[$k]['description'] = htmlentities($video['description'], ENT_XML1);
                    }
                }
            }

            if ($googlenews) {
                if (isset($googlenews['sitename'])) {
                    $googlenews['sitename'] = htmlentities($googlenews['sitename'], ENT_XML1);
                }
            }
        }

        $googlenews['sitename'] = isset($googlenews['sitename']) ? $googlenews['sitename'] : '';
        $googlenews['language'] = isset($googlenews['language']) ? $googlenews['language'] : 'en';
        $googlenews['publication_date'] = isset($googlenews['publication_date']) ? $googlenews['publication_date'] : date('Y-m-d H:i:s');

        $this->model->setItems([
            'loc'          => $loc,
            'lastmod'      => $lastmod,
            'priority'     => $priority,
            'freq'         => $freq,
            'images'       => $images,
            'title'        => $title,
            'translations' => $translations,
            'videos'       => $videos,
            'googlenews'   => $googlenews,
            'alternates'   => $alternates,
        ]);
    }

    /**
     * Add new sitemap to $sitemaps array.
     *
     * @param string $loc
     * @param string $lastmod
     * @return void
     */
    public function resetSitemaps($sitemaps = [])
    {
        $this->model->resetSitemaps($sitemaps);
    }

    /**
     * Returns document with all sitemap items from $items array.
     *
     * @param string $format (options: xml, html, txt, ror-rss, ror-rdf, google-news)
     * @param string $style (path to custom xls style like '/styles/xsl/xml-sitemap.xsl')
     *
     * @return \Illuminate\Http\Response
     */
    public function render($format = 'xml')
    {
        // limit size of sitemap
        if ($this->model->getMaxSize() > 0 && count($this->model->getItems()) > $this->model->getMaxSize()) {
            $this->model->limitSize($this->model->getMaxSize());
        } elseif ('google-news' == $format && count($this->model->getItems()) > 1000) {
            $this->model->limitSize(1000);
        } elseif ('google-news' != $format && count($this->model->getItems()) > 50000) {
            $this->model->limitSize();
        }

        $data = $this->generate($format);

        return $this->response->make($data['content'], 200, $data['headers']);
    }

    /**
     * Generates document with all sitemap items from $items array.
     *
     * @param string $format (options: xml, html, txt, ror-rss, ror-rdf, sitemapindex, google-news)
     * @param string $style (path to custom xls style like '/styles/xsl/xml-sitemap.xsl')
     * @return array
     */
    public function generate($format = 'xml')
    {
        // check if caching is enabled, there is a cached content and its duration isn't expired
        if ($this->isCached()) {
            ('sitemapindex' == $format) ? $this->model->resetSitemaps($this->cache->get($this->model->getCacheKey())) : $this->model->resetItems($this->cache->get($this->model->getCacheKey()));
        } elseif ($this->model->isUseCache()) {
            ('sitemapindex' == $format) ? $this->cache->put($this->model->getCacheKey(), $this->model->getSitemaps(),
                $this->model->getCacheDuration()) : $this->cache->put($this->model->getCacheKey(),
                $this->model->getItems(), $this->model->getCacheDuration());
        }

        if (!$this->model->getLink()) {
            $this->model->setLink($this->configRepository->get('app.url'));
        }

        if (!$this->model->getTitle()) {
            $this->model->setTitle('Sitemap for ' . $this->model->getLink());
        }

        // check if styles are enabled
        if ($this->model->isUseStyles()) {
            if (null != $this->model->getSloc() && file_exists(public_path($this->model->getSloc() . $format . '.xsl'))) {
                // use style from your custom location
                $style = $this->model->getSloc() . $format . '.xsl';
            } else {
                // don't use style
                $style = null;
            }
        } else {
            // don't use style
            $style = null;
        }

        return [
            'content' => $this->view->make('packages/sitemap::xml', ['items' => $this->model->getItems(), 'style' => $style])->render(),
            'headers' => ['Content-type' => 'text/xml; charset=utf-8'],
        ];
    }

    /**
     * Checks if content is cached.
     *
     * @return bool
     */
    public function isCached()
    {
        return $this->model->isUseCache() && $this->cache->has($this->model->getCacheKey());
    }

    /**
     * Generate sitemap and store it to a file.
     *
     * @param string $format (options: xml, html, txt, ror-rss, ror-rdf, sitemapindex, google-news)
     * @param string $filename (without file extension, may be a path like 'sitemaps/sitemap1' but must exist)
     * @param string $path (path to store sitemap like '/www/site/public')
     * @param string $style (path to custom xls style like '/styles/xsl/xml-sitemap.xsl')
     * @return void
     */
    public function store($format = 'xml', $filename = 'sitemap', $path = null, $style = null)
    {
        // turn off caching for this method
        $this->model->setUseCache(false);

        // use correct file extension
        in_array($format, ['txt', 'html'], true) ? $fe = $format : $fe = 'xml';

        if (true == $this->model->getUseGzip()) {
            $fe = $fe . '.gz';
        }

        // use custom size limit for sitemaps
        if ($this->model->getMaxSize() > 0 && count($this->model->getItems()) > $this->model->getMaxSize()) {
            if ($this->model->isUseLimitSize()) {
                // limit size
                $this->model->limitSize($this->model->getMaxSize());
                $data = $this->generate($format);
            } else {
                // use sitemapindex and generate partial sitemaps
                foreach (array_chunk($this->model->getItems(), $this->model->getMaxSize()) as $key => $item) {
                    // reset current items
                    $this->model->resetItems($item);

                    // generate new partial sitemap
                    $this->store($format, $filename . '-' . $key, $path);

                    // add sitemap to sitemapindex
                    if ($path != null) {
                        // if using custom path generate relative urls for sitemaps in the sitemapindex
                        $this->addSitemap($filename . '-' . $key . '.' . $fe);
                    } else {
                        // else generate full urls based on app's domain
                        $this->addSitemap(url($filename . '-' . $key . '.' . $fe));
                    }
                }

                $data = $this->generate('sitemapindex');
            }
        } elseif (('google-news' != $format && count($this->model->getItems()) > 50000) || ($format == 'google-news' && count($this->model->getItems()) > 1000)) {
            ('google-news' != $format) ? $max = 50000 : $max = 1000;

            // check if limiting size of items array is enabled
            if (!$this->model->isUseLimitSize()) {
                // use sitemapindex and generate partial sitemaps
                foreach (array_chunk($this->model->getItems(), $max) as $key => $item) {
                    // reset current items
                    $this->model->resetItems($item);

                    // generate new partial sitemap
                    $this->store($format, $filename . '-' . $key, $path, $style);

                    // add sitemap to sitemapindex
                    if (null != $path) {
                        // if using custom path generate relative urls for sitemaps in the sitemapindex
                        $this->addSitemap($filename . '-' . $key . '.' . $fe);
                    } else {
                        // else generate full urls based on app's domain
                        $this->addSitemap(url($filename . '-' . $key . '.' . $fe));
                    }
                }

                $data = $this->generate('sitemapindex');
            } else {
                // reset items and use only most recent $max items
                $this->model->limitSize($max);
                $data = $this->generate($format);
            }
        } else {
            $data = $this->generate($format);
        }

        // clear memory
        if ('sitemapindex' == $format) {
            $this->model->resetSitemaps();
        }

        $this->model->resetItems();

        // if custom path
        if (null == $path) {
            $file = public_path() . DIRECTORY_SEPARATOR . $filename . '.' . $fe;
        } else {
            $file = $path . DIRECTORY_SEPARATOR . $filename . '.' . $fe;
        }

        if (true == $this->model->getUseGzip()) {
            // write file (gzip compressed)
            $this->file->put($file, gzencode($data['content'], 9));
        } else {
            // write file
            $this->file->put($file, $data['content']);
        }
    }

    /**
     * Add new sitemap to $sitemaps array.
     *
     * @param string $loc
     * @param string $lastmod
     * @return void
     */
    public function addSitemap($loc, $lastmod = null)
    {
        $this->model->setSitemaps([
            'loc'     => $loc,
            'lastmod' => $lastmod,
        ]);
    }
}
