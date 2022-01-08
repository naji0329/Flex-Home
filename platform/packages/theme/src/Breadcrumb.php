<?php

namespace Botble\Theme;

use Throwable;
use URL;

class Breadcrumb
{
    /**
     * Crumbs
     *
     * @var array
     */
    public $crumbs = [];

    /**
     * Add breadcrumb to array.
     *
     * @param mixed $label
     * @param string $url
     * @return Breadcrumb
     */
    public function add(string $label, ?string $url = ''): self
    {
        if (is_array($label)) {
            if (count($label) > 0) {
                foreach ($label as $crumb) {
                    $defaults = [
                        'label' => '',
                        'url'   => '',
                    ];
                    $crumb = array_merge($defaults, $crumb);
                    $this->add($crumb['label'], $crumb['url']);
                }
            }
        } else {
            $label = trim(strip_tags($label, '<i><b><strong>'));
            if (!preg_match('|^http(s)?|', $url)) {
                $url = URL::to($url);
            }
            $this->crumbs[] = ['label' => $label, 'url' => $url];
        }

        return $this;
    }

    /**
     * Render breadcrumbs.
     *
     * @return string
     *
     * @throws Throwable
     */
    public function render(): string
    {
        return view('packages/theme::partials.breadcrumb')->render();
    }

    /**
     * Get crumbs.
     *
     * @return array
     */
    public function getCrumbs(): array
    {
        return $this->crumbs;
    }
}
