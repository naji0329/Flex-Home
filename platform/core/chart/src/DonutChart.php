<?php

namespace Botble\Chart;

use Botble\Chart\Supports\Chart;
use Botble\Chart\Supports\ChartTypes;

class DonutChart extends Chart
{

    /**
     * An array of strings containing HTML-style hex colors for each of the donut segments. Note: if there are fewer
     * colors than segments, the colors will cycle back to the start of the array when exhausted.
     *
     * @brief Colors
     *
     * @var array
     */
    protected $colors = [
        '#0B62A4',
        '#3980B5',
        '#679DC6',
        '#95BBD7',
        '#B0CCE1',
        '#095791',
        '#095085',
        '#083E67',
        '#052C48',
        '#042135',
    ];

    /**
     * A function that will translate a y-value into a label for the centre of the donut.
     *
     * eg: currency function (y, data) { return '$' + y }
     *
     * Note: if required, the method is also passed an optional second argument, which is the complete data row for the
     * given value.
     *
     * @brief Formatter
     *
     * @var string
     */
    protected $formatter = '';

    /**
     * @var string
     */
    protected $backgroundColor = '#FFFFFF';

    /**
     * @var string
     */
    protected $labelColor = '#000000';

    /**
     * Create an instance of MorrisDonutCharts class
     *
     * @brief Construct
     */
    public function __construct()
    {
        parent::__construct(ChartTypes::DONUT);
    }
}
