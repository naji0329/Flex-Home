<?php

namespace Botble\Chart;

use Botble\Chart\Supports\Chart;
use Botble\Chart\Supports\ChartTypes;

class AreaChart extends Chart
{

    /**
     * Change the opacity of the area fill colour.
     * Accepts values between 0.0 (for completely transparent) and 1.0 (for completely opaque).
     *
     * @brief Opacity
     *
     * @var string
     */
    protected $fillOpacity = 'auto';

    /**
     * Set to true to overlay the areas on top of each other instead of stacking them.
     *
     * @brief Line
     *
     * @var bool
     */
    protected $behaveLikeLine = false;

    /**
     * @var array
     */
    protected $pointFillColors = [];

    /**
     * @var array
     */
    protected $pointStrokeColors = [];

    /**
     * @var array
     */
    protected $lineColors = [];

    /**
     * Create an instance of MorrisAreaCharts class
     */
    public function __construct()
    {
        parent::__construct(ChartTypes::AREA);
    }
}
