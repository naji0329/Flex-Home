<?php

namespace Botble\RealEstate\Supports;

use Botble\Base\Supports\Language;
use Botble\RealEstate\Models\Currency;
use Botble\RealEstate\Repositories\Interfaces\CurrencyInterface;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;
use Locale;

class CurrencySupport
{
    /**
     * @var Currency
     */
    protected $currency;

    /**
     * @var Currency
     */
    protected $defaultCurrency = null;

    /**
     * @var Collection
     */
    protected $currencies = [];

    /**
     * @param Currency $currency
     */
    public function setApplicationCurrency(Currency $currency)
    {
        $this->currency = $currency;

        if (session('currency') == $currency->title) {
            return;
        }

        session(['currency' => $currency->title]);
    }

    /**
     * @return Currency
     */
    public function getApplicationCurrency()
    {
        $currency = $this->currency;

        if (empty($currency)) {
            if (!$this->currencies || !$this->currencies instanceof Collection) {
                $this->currencies();
            }

            if (session('currency')) {
                $currency = $this->currencies->where('title', session('currency'))->first();
            } elseif (setting('real_estate_enable_auto_detect_visitor_currency', 0) == 1) {
                $currency = $this->currencies->where('title', $this->detectedCurrencyCode())->first();
            }

            if (!$currency) {
                $currency = $this->getDefaultCurrency();
            }

            $this->currency = $currency;
        }

        return $currency;
    }

    /**
     * @return Currency
     */
    public function getDefaultCurrency()
    {
        $currency = $this->defaultCurrency;

        if ($currency) {
            return $currency;
        }

        if ($this->currencies && $this->currencies instanceof Collection) {
            $currency = $this->currencies->where('is_default', 1)->first();
        }

        if (!$currency) {
            $currency = app(CurrencyInterface::class)->getFirstBy(['is_default' => 1]);
        }

        if (!$currency) {
            $currency = app(CurrencyInterface::class)->getFirstBy([]);
        }

        if (!$currency) {
            $currency = new Currency([
                'title'            => 'USD',
                'symbol'           => '$',
                'is_prefix_symbol' => true,
                'order'            => 0,
                'decimals'         => 2,
                'is_default'       => true,
                'exchange_rate'    => 1,
            ]);
        }

        $this->defaultCurrency = $currency;

        return $this->defaultCurrency;
    }

    /**
     * @return Collection
     */
    public function currencies(): Collection
    {
        if (!$this->currencies instanceof Collection) {
            $this->currencies = collect([]);
        }

        if ($this->currencies->count() == 0) {
            $this->currencies = app(CurrencyInterface::class)->getAllCurrencies();
        }

        return $this->currencies;
    }

    /**
     * @return string|null
     */
    public function detectedCurrencyCode()
    {
        $currencies = [
            'BD' => 'BDT',
            'BE' => 'EUR',
            'BF' => 'XOF',
            'BG' => 'BGN',
            'BA' => 'BAM',
            'BB' => 'BBD',
            'WF' => 'XPF',
            'BL' => 'EUR',
            'BM' => 'BMD',
            'BN' => 'BND',
            'BO' => 'BOB',
            'BH' => 'BHD',
            'BI' => 'BIF',
            'BJ' => 'XOF',
            'BT' => 'BTN',
            'JM' => 'JMD',
            'BV' => 'NOK',
            'BW' => 'BWP',
            'WS' => 'WST',
            'BQ' => 'USD',
            'BR' => 'BRL',
            'BS' => 'BSD',
            'JE' => 'GBP',
            'BY' => 'BYR',
            'BZ' => 'BZD',
            'RU' => 'RUB',
            'RW' => 'RWF',
            'RS' => 'RSD',
            'TL' => 'USD',
            'RE' => 'EUR',
            'TM' => 'TMT',
            'TJ' => 'TJS',
            'RO' => 'RON',
            'TK' => 'NZD',
            'GW' => 'XOF',
            'GU' => 'USD',
            'GT' => 'GTQ',
            'GS' => 'GBP',
            'GR' => 'EUR',
            'GQ' => 'XAF',
            'GP' => 'EUR',
            'JP' => 'JPY',
            'GY' => 'GYD',
            'GG' => 'GBP',
            'GF' => 'EUR',
            'GE' => 'GEL',
            'GD' => 'XCD',
            'GB' => 'GBP',
            'GA' => 'XAF',
            'SV' => 'USD',
            'GN' => 'GNF',
            'GM' => 'GMD',
            'GL' => 'DKK',
            'GI' => 'GIP',
            'GH' => 'GHS',
            'OM' => 'OMR',
            'TN' => 'TND',
            'JO' => 'JOD',
            'HR' => 'HRK',
            'HT' => 'HTG',
            'HU' => 'HUF',
            'HK' => 'HKD',
            'HN' => 'HNL',
            'HM' => 'AUD',
            'VE' => 'VEF',
            'PR' => 'USD',
            'PS' => 'ILS',
            'PW' => 'USD',
            'PT' => 'EUR',
            'SJ' => 'NOK',
            'PY' => 'PYG',
            'IQ' => 'IQD',
            'PA' => 'PAB',
            'PF' => 'XPF',
            'PG' => 'PGK',
            'PE' => 'PEN',
            'PK' => 'PKR',
            'PH' => 'PHP',
            'PN' => 'NZD',
            'PL' => 'PLN',
            'PM' => 'EUR',
            'ZM' => 'ZMK',
            'EH' => 'MAD',
            'EE' => 'EUR',
            'EG' => 'EGP',
            'ZA' => 'ZAR',
            'EC' => 'USD',
            'IT' => 'EUR',
            'VN' => 'VND',
            'SB' => 'SBD',
            'ET' => 'ETB',
            'SO' => 'SOS',
            'ZW' => 'ZWL',
            'SA' => 'SAR',
            'ES' => 'EUR',
            'ER' => 'ERN',
            'ME' => 'EUR',
            'MD' => 'MDL',
            'MG' => 'MGA',
            'MF' => 'EUR',
            'MA' => 'MAD',
            'MC' => 'EUR',
            'UZ' => 'UZS',
            'MM' => 'MMK',
            'ML' => 'XOF',
            'MO' => 'MOP',
            'MN' => 'MNT',
            'MH' => 'USD',
            'MK' => 'MKD',
            'MU' => 'MUR',
            'MT' => 'EUR',
            'MW' => 'MWK',
            'MV' => 'MVR',
            'MQ' => 'EUR',
            'MP' => 'USD',
            'MS' => 'XCD',
            'MR' => 'MRO',
            'IM' => 'GBP',
            'UG' => 'UGX',
            'TZ' => 'TZS',
            'MY' => 'MYR',
            'MX' => 'MXN',
            'IL' => 'ILS',
            'FR' => 'EUR',
            'IO' => 'USD',
            'SH' => 'SHP',
            'FI' => 'EUR',
            'FJ' => 'FJD',
            'FK' => 'FKP',
            'FM' => 'USD',
            'FO' => 'DKK',
            'NI' => 'NIO',
            'NL' => 'EUR',
            'NO' => 'NOK',
            'NA' => 'NAD',
            'VU' => 'VUV',
            'NC' => 'XPF',
            'NE' => 'XOF',
            'NF' => 'AUD',
            'NG' => 'NGN',
            'NZ' => 'NZD',
            'NP' => 'NPR',
            'NR' => 'AUD',
            'NU' => 'NZD',
            'CK' => 'NZD',
            'XK' => 'EUR',
            'CI' => 'XOF',
            'CH' => 'CHF',
            'CO' => 'COP',
            'CN' => 'CNY',
            'CM' => 'XAF',
            'CL' => 'CLP',
            'CC' => 'AUD',
            'CA' => 'CAD',
            'CG' => 'XAF',
            'CF' => 'XAF',
            'CD' => 'CDF',
            'CZ' => 'CZK',
            'CY' => 'EUR',
            'CX' => 'AUD',
            'CR' => 'CRC',
            'CW' => 'ANG',
            'CV' => 'CVE',
            'CU' => 'CUP',
            'SZ' => 'SZL',
            'SY' => 'SYP',
            'SX' => 'ANG',
            'KG' => 'KGS',
            'KE' => 'KES',
            'SS' => 'SSP',
            'SR' => 'SRD',
            'KI' => 'AUD',
            'KH' => 'KHR',
            'KN' => 'XCD',
            'KM' => 'KMF',
            'ST' => 'STD',
            'SK' => 'EUR',
            'KR' => 'KRW',
            'SI' => 'EUR',
            'KP' => 'KPW',
            'KW' => 'KWD',
            'SN' => 'XOF',
            'SM' => 'EUR',
            'SL' => 'SLL',
            'SC' => 'SCR',
            'KZ' => 'KZT',
            'KY' => 'KYD',
            'SG' => 'SGD',
            'SE' => 'SEK',
            'SD' => 'SDG',
            'DO' => 'DOP',
            'DM' => 'XCD',
            'DJ' => 'DJF',
            'DK' => 'DKK',
            'VG' => 'USD',
            'DE' => 'EUR',
            'YE' => 'YER',
            'DZ' => 'DZD',
            'US' => 'USD',
            'UY' => 'UYU',
            'YT' => 'EUR',
            'UM' => 'USD',
            'LB' => 'LBP',
            'LC' => 'XCD',
            'LA' => 'LAK',
            'TV' => 'AUD',
            'TW' => 'TWD',
            'TT' => 'TTD',
            'TR' => 'TRY',
            'LK' => 'LKR',
            'LI' => 'CHF',
            'LV' => 'EUR',
            'TO' => 'TOP',
            'LT' => 'LTL',
            'LU' => 'EUR',
            'LR' => 'LRD',
            'LS' => 'LSL',
            'TH' => 'THB',
            'TF' => 'EUR',
            'TG' => 'XOF',
            'TD' => 'XAF',
            'TC' => 'USD',
            'LY' => 'LYD',
            'VA' => 'EUR',
            'VC' => 'XCD',
            'AE' => 'AED',
            'AD' => 'EUR',
            'AG' => 'XCD',
            'AF' => 'AFN',
            'AI' => 'XCD',
            'VI' => 'USD',
            'IS' => 'ISK',
            'IR' => 'IRR',
            'AM' => 'AMD',
            'AL' => 'ALL',
            'AO' => 'AOA',
            'AQ' => '',
            'AS' => 'USD',
            'AR' => 'ARS',
            'AU' => 'AUD',
            'AT' => 'EUR',
            'AW' => 'AWG',
            'IN' => 'INR',
            'AX' => 'EUR',
            'AZ' => 'AZN',
            'IE' => 'EUR',
            'ID' => 'IDR',
            'UA' => 'UAH',
            'QA' => 'QAR',
            'MZ' => 'MZN',
        ];

        if (!isset($_SERVER['HTTP_ACCEPT_LANGUAGE'])) {
            return null;
        }

        if (class_exists('Locale')) {
            $httpAcceptLanguage = Locale::acceptFromHttp($_SERVER['HTTP_ACCEPT_LANGUAGE']);

            $languages = Language::getListLanguages();

            foreach ($languages as $language) {
                if ($language[1] == $httpAcceptLanguage) {
                    $httpAcceptLanguage = $language[4];
                    break;
                }
            }
        } else {
            $httpAcceptLanguage = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);
        }

        return Arr::get($currencies, strtoupper(substr($httpAcceptLanguage, 0, 2)));
    }
}
