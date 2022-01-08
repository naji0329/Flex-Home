<?php

namespace Botble\Analytics\Http\Controllers;

use Analytics;
use Botble\Analytics\Exceptions\InvalidConfiguration;
use Botble\Analytics\Period;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Dashboard\Supports\DashboardWidgetInstance;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Throwable;

class AnalyticsController extends BaseController
{

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     * @throws Throwable
     */
    public function getGeneral(Request $request, BaseHttpResponse $response)
    {
        $predefinedRangeFound = (new DashboardWidgetInstance)->getFilterRange($request->input('predefined_range'));

        $startDate = $predefinedRangeFound['startDate'];
        $endDate = $predefinedRangeFound['endDate'];
        $dimensions = $this->getDimension($predefinedRangeFound['key']);

        try {
            $period = Period::create($startDate, $endDate);

            $visitorData = [];

            $answer = Analytics::performQuery($period, 'ga:visits,ga:pageviews', ['dimensions' => 'ga:' . $dimensions]);

            if ($answer->rows == null) {
                $answer->rows = [];
            }

            foreach ($answer->rows as $dateRow) {
                $visitorData[] = [
                    'axis'      => $this->getAxisByDimensions($dateRow[0], $dimensions),
                    'visitors'  => $dateRow[1],
                    'pageViews' => $dateRow[2],
                ];
            }

            $stats = collect($visitorData);
            $country_stats = Analytics::performQuery($period, 'ga:sessions',
                ['dimensions' => 'ga:countryIsoCode'])->rows;
            $total = Analytics::performQuery($period,
                'ga:sessions, ga:users, ga:pageviews, ga:percentNewSessions, ga:bounceRate, ga:pageviewsPerVisit, ga:avgSessionDuration, ga:newUsers')->totalsForAllResults;

            return $response->setData(view('plugins/analytics::widgets.general',
                compact('stats', 'country_stats', 'total'))->render());
        } catch (InvalidConfiguration $exception) {
            return $response
                ->setError()
                ->setMessage(trans('plugins/analytics::analytics.wrong_configuration'));
        } catch (Exception $exception) {
            return $response
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    /**
     * @param string $dateRow
     * @param string $dimensions
     * @return Carbon|string
     */
    protected function getAxisByDimensions($dateRow, $dimensions = 'hour')
    {
        switch ($dimensions) {
            case 'date':
                return Carbon::parse($dateRow)->toDateString();
            case 'yearMonth':
                return Carbon::createFromFormat('Ym', $dateRow)->format('Y-m');
            default:
                return (int)$dateRow . 'h';
        }
    }

    /**
    * @param string $key
    * @return string
    */
    protected function getDimension($key): string
    {
        $data = [
            'this_week'    => 'date',
            'last_7_days'  => 'date',
            'this_month'   => 'date',
            'last_30_days' => 'date',
            'this_year'    => 'yearMonth',
        ];

        return Arr::get($data, $key, 'hour');
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function getTopVisitPages(Request $request, BaseHttpResponse $response)
    {
        $predefinedRangeFound = (new DashboardWidgetInstance)->getFilterRange($request->input('predefined_range'));

        $startDate = $predefinedRangeFound['startDate'];
        $endDate = $predefinedRangeFound['endDate'];

        try {
            $period = Period::create($startDate, $endDate);
            $pages = Analytics::fetchMostVisitedPages($period, 10);

            return $response->setData(view('plugins/analytics::widgets.page', compact('pages'))->render());
        } catch (InvalidConfiguration $exception) {
            return $response
                ->setError()
                ->setMessage(trans('plugins/analytics::analytics.wrong_configuration'));
        } catch (Exception $exception) {
            return $response
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function getTopBrowser(Request $request, BaseHttpResponse $response)
    {
        $predefinedRangeFound = (new DashboardWidgetInstance)->getFilterRange($request->input('predefined_range'));

        $startDate = $predefinedRangeFound['startDate'];
        $endDate = $predefinedRangeFound['endDate'];

        try {
            $period = Period::create($startDate, $endDate);
            $browsers = Analytics::fetchTopBrowsers($period);

            return $response->setData(view('plugins/analytics::widgets.browser', compact('browsers'))->render());
        } catch (InvalidConfiguration $exception) {
            return $response
                ->setError()
                ->setMessage(trans('plugins/analytics::analytics.wrong_configuration'));
        } catch (Exception $exception) {
            return $response
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function getTopReferrer(Request $request, BaseHttpResponse $response)
    {
        $predefinedRangeFound = (new DashboardWidgetInstance)->getFilterRange($request->input('predefined_range'));

        $startDate = $predefinedRangeFound['startDate'];
        $endDate = $predefinedRangeFound['endDate'];

        try {
            $period = Period::create($startDate, $endDate);
            $referrers = Analytics::fetchTopReferrers($period, 10);

            return $response->setData(view('plugins/analytics::widgets.referrer', compact('referrers'))->render());
        } catch (InvalidConfiguration $exception) {
            return $response
                ->setError()
                ->setMessage(trans('plugins/analytics::analytics.wrong_configuration'));
        } catch (Exception $exception) {
            return $response
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }
}
