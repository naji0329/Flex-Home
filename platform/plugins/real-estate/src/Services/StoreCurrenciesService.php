<?php

namespace Botble\RealEstate\Services;

use Botble\RealEstate\Repositories\Eloquent\CurrencyRepository;
use Botble\RealEstate\Repositories\Interfaces\CurrencyInterface;
use Exception;

class StoreCurrenciesService
{
    /**
     * @var CurrencyRepository
     */
    protected $currencyRepository;

    /**
     * StoreCurrenciesService constructor.
     * @param CurrencyInterface $currency
     */
    public function __construct(CurrencyInterface $currency)
    {
        $this->currencyRepository = $currency;
    }

    /**
     * @param array $currencies
     * @param array $deletedCurrencies
     * @throws Exception
     */
    public function execute(array $currencies, array $deletedCurrencies)
    {
        if ($deletedCurrencies) {
            $this->currencyRepository->deleteBy([
                ['id', 'IN', $deletedCurrencies],
            ]);
        }

        foreach ($currencies as $item) {
            if (!$item['title'] || !$item['symbol']) {
                continue;
            }

            $item['title'] = substr(strtoupper($item['title']), 0, 3);
            $item['symbol'] = substr($item['symbol'], 0, 3);
            $item['decimals'] = (int) $item['decimals'];
            $item['decimals'] = $item['decimals'] < 10 ? $item['decimals'] : 2;

            if (count($currencies) == 1) {
                $item['is_default'] = 1;
            }

            $currency = $this->currencyRepository->findById($item['id']);
            if (!$currency) {
                $this->currencyRepository->create($item);
            } else {
                $currency->fill($item);
                $this->currencyRepository->createOrUpdate($currency);
            }
        }
    }
}
