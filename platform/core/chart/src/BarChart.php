<?php

namespace Botble\Chart;

use Botble\Chart\Supports\Chart;
use Botble\Chart\Supports\ChartTypes;

class BarChart extends Chart
{

    /**
     * @var float
     */
    protected $barSizeRatio = 0.75;

    /**
     * @var int
     */
    protected $barGap = 3;

    /**
     * @var float
     */
    protected $barOpacity = 1.0;

    /**
     * @var array
     */
    protected $barRadius = [0, 0, 0, 0];

    /**
     * @var int
     */
    protected $xLabelMargin = 50;

    /**
     * Array containing colors for the series bars.
     *
     * @brief Bars colors
     *
     * @var array
     */
    protected $barColors = [
        '#0b62a4',
        '#7a92a3',
        '#4da74d',
        '#afd8f8',
        '#edc240',
        '#cb4b4b',
        '#9440ed',
    ];

    /**
     * Set to true to draw bars stacked vertically.
     *
     * @brief Stacked
     *
     * @var bool
     */
    protected $stacked = true;

    /**
     * Create an instance of MorrisBarCharts class
     */
    public function __construct()
    {
        parent::__construct(ChartTypes::BAR);
    }
}
