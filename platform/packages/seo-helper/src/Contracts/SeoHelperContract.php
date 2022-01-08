<?php

namespace Botble\SeoHelper\Contracts;

interface SeoHelperContract extends RenderableContract
{
    /**
     * Get SeoMeta instance.
     *
     * @return SeoMetaContract
     */
    public function meta();

    /**
     * Set SeoMeta instance.
     *
     * @param SeoMetaContract $seoMeta
     * @return $this
     */
    public function setSeoMeta(SeoMetaContract $seoMeta);

    /**
     * Get SeoOpenGraph instance.
     *
     * @return SeoOpenGraphContract
     */
    public function openGraph();

    /**
     * Get SeoOpenGraph instance.
     *
     * @param SeoOpenGraphContract $seoOpenGraph
     * @return $this
     */
    public function setSeoOpenGraph(SeoOpenGraphContract $seoOpenGraph);

    /**
     * Get SeoTwitter instance.
     *
     * @return SeoTwitterContract
     */
    public function twitter();

    /**
     * Set SeoTwitter instance.
     *
     * @param SeoTwitterContract $seoTwitter
     * @return $this
     */
    public function setSeoTwitter(SeoTwitterContract $seoTwitter);

    /**
     * Set title.
     *
     * @param string $title
     * @param string|null $siteName
     * @param string|null $separator
     * @return $this
     */
    public function setTitle($title, $siteName = null, $separator = null);

    /**
     * @return string
     */
    public function getTitle();

    /**
     * Set description.
     *
     * @param string $description
     * @return $this
     */
    public function setDescription($description);
}
