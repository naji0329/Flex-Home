<?php

namespace Botble\RssFeed\Supports;

use AdminBar;
use Exception;
use Html;
use Illuminate\Support\Collection;
use Spatie\Feed\Feed;

class RssFeed
{
    /**
     * @param string $url
     * @param string $title
     * @return $this
     */
    public function addFeedLink(string $url, string $title): self
    {
        add_filter(THEME_FRONT_HEADER, function ($html) use ($url, $title) {
            $html .= Html::style($url, [
                    'rel'   => 'alternate',
                    'type'  => 'application/atom+xml',
                    'title' => $title,
                    'media' => null,
                ])->toHtml() . "\n";

            if (is_plugin_active('language')) {
                $supportedLocales = \Language::getSupportedLocales();

                foreach (array_keys($supportedLocales) as $supportedLocale) {

                    if ($supportedLocale == \Language::getDefaultLocale()) {
                        continue;
                    }

                    $html .= Html::style(\Language::getLocalizedURL($supportedLocale, $url), [
                            'rel'   => 'alternate',
                            'type'  => 'application/atom+xml',
                            'title' => $title,
                            'media' => null,
                        ])->toHtml() . "\n";
                }
            }

            return $html;
        }, 112);

        return $this;
    }

    /**
     * @param \Illuminate\Support\Collection $items
     * @param string $title
     * @param string $description
     * @return \Spatie\Feed\Feed
     */
    public function renderFeedItems(Collection $items, string $title, string $description)
    {
        AdminBar::setIsDisplay(false);

        return new Feed(
            $title,
            $items,
            request()->url(),
            'plugins/rss-feed::rss',
            $description,
            'en-US'
        );
    }

    /**
     * @param string $url
     * @return int
     */
    public function remoteFilesize($url)
    {
        if (!$url) {
            return 0;
        }

        try {
            $data = get_headers($url, true);

            if (isset($data['Content-Length'])) {
                return (int)$data['Content-Length'];
            }
        } catch (Exception $exception) {
            return 0;
        }

        return 0;
    }
}
