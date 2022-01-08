<?php

namespace Botble\SeoHelper\Entities;

use Botble\SeoHelper\Contracts\Entities\TitleContract;
use Botble\SeoHelper\Exceptions\InvalidArgumentException;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;

class Title implements TitleContract
{

    /**
     * The title content.
     *
     * @var string
     */
    protected $title = '';

    /**
     * The site name.
     *
     * @var string
     */
    protected $siteName = '';

    /**
     * The title separator.
     *
     * @var string
     */
    protected $separator = '-';

    /**
     * Display the title first.
     *
     * @var bool
     */
    protected $titleFirst = true;

    /**
     * The maximum title length.
     *
     * @var int
     */
    protected $max = 55;

    /**
     * Make the Title instance.
     *
     * @param array $configs
     * @throws InvalidArgumentException
     */
    public function __construct()
    {
        $this->init();
    }

    /**
     * Start the engine.
     * @throws InvalidArgumentException
     */
    protected function init()
    {
        $this->set(null);
        $this->title = theme_option('site_title');
        if (theme_option('show_site_name', false)) {
            $this->setSiteName(theme_option('site_title'));
            if (theme_option('seo_title')) {
                $this->setSiteName(theme_option('seo_title'));
            }
        }
        $this->setSeparator(config('packages.seo-helper.general.title.separator', '-'));
        $this->switchPosition(config('packages.seo-helper.general.title.first', true));
        $this->setMax(config('packages.seo-helper.general.title.max', 55));
    }

    /**
     * Get title only (without site name or separator).
     *
     * @return string
     */
    public function getTitleOnly()
    {
        return $this->title;
    }

    /**
     * Set title.
     *
     * @param string $title
     *
     * @return Title
     */
    public function set($title)
    {
        $this->title = $title;

        return $this;
    }

    /**
     * Get site name.
     *
     * @return string
     */
    public function getSiteName()
    {
        return $this->siteName;
    }

    /**
     * Set site name.
     *
     * @param string $siteName
     *
     * @return Title
     */
    public function setSiteName($siteName)
    {
        $this->siteName = $siteName;

        return $this;
    }

    /**
     * Get title separator.
     *
     * @return string
     */
    public function getSeparator()
    {
        return $this->separator;
    }

    /**
     * Set title separator.
     *
     * @param string $separator
     *
     * @return Title
     */
    public function setSeparator($separator)
    {
        $this->separator = trim($separator);

        return $this;
    }

    /**
     * Set title first.
     *
     * @return Title
     */
    public function setFirst()
    {
        return $this->switchPosition(true);
    }

    /**
     * Set title last.
     *
     * @return Title
     */
    public function setLast()
    {
        return $this->switchPosition(false);
    }

    /**
     * Switch title position.
     *
     * @param bool $first
     *
     * @return Title
     */
    protected function switchPosition($first)
    {
        $this->titleFirst = boolval($first);

        return $this;
    }

    /**
     * Check if title is first.
     *
     * @return bool
     */
    public function isTitleFirst()
    {
        return $this->titleFirst;
    }

    /**
     * Get title max length.
     *
     * @return int
     */
    public function getMax()
    {
        return $this->max;
    }

    /**
     * Set title max length.
     *
     * @param int $max
     *
     * @return Title
     * @throws InvalidArgumentException
     */
    public function setMax($max)
    {
        $this->checkMax($max);

        $this->max = $max;

        return $this;
    }

    /**
     * Make a Title instance.
     *
     * @param string $title
     * @param string $siteName
     * @param string $separator
     *
     * @return Title
     * @throws InvalidArgumentException
     */
    public static function make($title, $siteName = '', $separator = '-')
    {
        return new self();
    }

    /**
     * @return string
     */
    public function getTitle()
    {
        $separator = null;
        if ($this->getTitleOnly()) {
            $separator = $this->renderSeparator();
        }
        $output = $this->isTitleFirst()
            ? $this->renderTitleFirst($separator)
            : $this->renderTitleLast($separator);

        $output = Str::limit(strip_tags($output), $this->getMax());

        return e($output);
    }

    /**
     * Render the tag.
     *
     * @return string
     */
    public function render()
    {
        return '<title>' . $this->getTitle() . '</title>';
    }

    /**
     * Render the separator.
     *
     * @return string
     */
    protected function renderSeparator()
    {
        return empty($separator = $this->getSeparator()) ? ' ' : ' ' . $separator . ' ';
    }

    /**
     * Render the tag.
     *
     * @return string
     */
    public function __toString()
    {
        return $this->render();
    }

    /**
     * Check title max length.
     *
     * @param int $max
     *
     * @throws InvalidArgumentException
     */
    protected function checkMax($max)
    {
        if (!is_int($max)) {
            throw new InvalidArgumentException('The title maximum lenght must be integer.');
        }

        if ($max <= 0) {
            throw new InvalidArgumentException('The title maximum lenght must be greater 0.');
        }
    }

    /**
     * Render title first.
     *
     * @param string $separator
     *
     * @return string
     */
    protected function renderTitleFirst($separator)
    {
        $output = [];
        $output[] = $this->getTitleOnly();

        if ($this->hasSiteName()) {
            $output[] = $separator;
            $output[] = $this->getSiteName();
        }

        $output = array_unique($output);

        if (count($output) > 2) {
            return implode('', array_unique($output));
        }

        return Arr::first($output);
    }

    /**
     * Render title last.
     *
     * @param string $separator
     *
     * @return string
     */
    protected function renderTitleLast($separator)
    {
        $output = [];

        if ($this->hasSiteName()) {
            $output[] = $this->getSiteName();
            $output[] = $separator;
        }

        $output[] = $this->getTitleOnly();

        return implode('', $output);
    }

    /**
     * Check if site name exists.
     *
     * @return bool
     */
    protected function hasSiteName()
    {
        return !empty($this->getSiteName());
    }
}
