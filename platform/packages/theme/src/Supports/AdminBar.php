<?php

namespace Botble\Theme\Supports;

use Throwable;

class AdminBar
{
    /**
     * @var array
     */
    protected $groups = [];

    /**
     * @var bool
     */
    protected $isDisplay = true;

    /**
     * @var array
     */
    protected $noGroupLinks = [];

    /**
     * AdminBar constructor.
     */
    public function __construct()
    {
        $this->groups = [
            'appearance' => [
                'link'  => 'javascript:;',
                'title' => trans('packages/theme::theme.appearance'),
                'items' => [
                    trans('core/base::layouts.dashboard') => route('dashboard.index'),
                    trans('core/setting::setting.title')  => route('settings.options'),
                ],
            ],
            'add-new'    => [
                'link'  => 'javascript:;',
                'title' => trans('packages/theme::theme.add_new'),
                'items' => [
                    trans('core/acl::users.users') => route('users.create'),
                ],
            ],
        ];
    }

    /**
     * @return bool
     */
    public function isDisplay(): bool
    {
        return $this->isDisplay;
    }

    /**
     * @param bool $isDisplay
     * @return $this
     */
    public function setIsDisplay($isDisplay = true): self
    {
        $this->isDisplay = $isDisplay;

        return $this;
    }

    /**
     * @return array
     */
    public function getGroups(): array
    {
        return $this->groups;
    }

    /**
     * @return array
     */
    public function getLinksNoGroup(): array
    {
        return $this->noGroupLinks;
    }

    /**
     * @param string $slug
     * @param string $title
     * @param string $link
     * @return $this
     */
    public function registerGroup($slug, $title, $link = 'javascript:;'): self
    {
        if (isset($this->groups[$slug])) {
            $this->groups[$slug]['items'][$title] = $link;
            return $this;
        }

        $this->groups[$slug] = [
            'title' => $title,
            'link'  => $link,
            'items' => [],
        ];

        return $this;
    }

    /**
     * @param string $title
     * @param string $url
     * @param null $group
     * @return $this
     */
    public function registerLink(string $title, string $url, $group = null): self
    {
        if ($group === null || !isset($this->groups[$group])) {
            $this->noGroupLinks[] = [
                'link'  => $url,
                'title' => $title,
            ];
        } else {
            $this->groups[$group]['items'][$title] = $url;
        }

        return $this;
    }

    /**
     * @return string
     * @throws Throwable
     */
    public function render(): string
    {
        return view('packages/theme::admin-bar')->render();
    }
}
