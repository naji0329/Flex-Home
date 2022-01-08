<?php

namespace Botble\SeoHelper\Entities;

use Botble\SeoHelper\Contracts\Entities\AnalyticsContract;

class Analytics implements AnalyticsContract
{
    /**
     * Google Analytics code.
     *
     * @var string
     */
    protected $google = '';

    /**
     * Set Google Analytics code.
     *
     * @param string $code
     *
     * @return Analytics
     */
    public function setGoogle($code)
    {
        $this->google = $code;

        return $this;
    }

    /**
     * Render the tag.
     *
     * @return string
     */
    public function render()
    {
        return implode(PHP_EOL, array_filter([
            $this->renderGoogleScript(),
        ]));
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
     * Render the Google Analytics tracking script.
     *
     * @return string
     */
    protected function renderGoogleScript()
    {
        if (empty($this->google)) {
            return '';
        }

        return <<<EOT
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=$this->google"></script>
<script>
 "use strict";
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', '$this->google');
</script>
EOT;
    }
}
