<?php

namespace Botble\Analytics;

use Google\Exception;
use Google_Service_Analytics;
use Illuminate\Contracts\Cache\Repository;
use Illuminate\Support\Facades\Cache;
use Symfony\Component\Cache\Adapter\Psr16Adapter;

class AnalyticsClientFactory
{
    /**
     * @param array $analyticsConfig
     * @return AnalyticsClient
     * @throws Exception
     */
    public static function createForConfig(array $analyticsConfig): AnalyticsClient
    {
        $authenticatedClient = self::createAuthenticatedGoogleClient($analyticsConfig);

        $googleService = new Google_Service_Analytics($authenticatedClient);

        return self::createAnalyticsClient($analyticsConfig, $googleService);
    }

    /**
     * @param array $config
     * @return GoogleClient
     * @throws Exception
     */
    public static function createAuthenticatedGoogleClient(array $config): GoogleClient
    {
        $client = new GoogleClient;

        $client->setScopes([
            Google_Service_Analytics::ANALYTICS_READONLY,
        ]);

        $client->setAuthConfig(setting('analytics_service_account_credentials'));

        self::configureCache($client, $config['cache']);

        return $client;
    }

    /**
     * @param GoogleClient $client
     * @param array $config
     */
    protected static function configureCache(GoogleClient $client, $config)
    {
        $config = collect($config);

        $store = Cache::store($config->get('store'));

        $cache = new Psr16Adapter($store);

        $client->setCache($cache);

        $client->setCacheConfig($config->except('store')->toArray());
    }

    /**
     * @param array $analyticsConfig
     * @param Google_Service_Analytics $googleService
     * @return AnalyticsClient
     */
    protected static function createAnalyticsClient(
        array $analyticsConfig,
        Google_Service_Analytics $googleService
    ): AnalyticsClient {
        $client = new AnalyticsClient($googleService, app(Repository::class));

        $client->setCacheLifeTimeInMinutes($analyticsConfig['cache_lifetime_in_minutes']);

        return $client;
    }
}
