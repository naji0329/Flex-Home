<?php

namespace Botble\Analytics;

use Botble\Analytics\Exceptions\InvalidPeriod;
use DateTime;
use DateTimeInterface;

class Period
{
    /**
     * @var DateTime
     */
    public $startDate;

    /**
     * @var \DateTimeInterface
     */
    public $endDate;

    /**
     * Period constructor.
     * @param DateTimeInterface $startDate
     * @param DateTimeInterface $endDate
     * @throws InvalidPeriod
     */
    public function __construct(DateTimeInterface $startDate, DateTimeInterface $endDate)
    {
        if ($startDate > $endDate) {
            throw InvalidPeriod::startDateCannotBeAfterEndDate($startDate, $endDate);
        }

        $this->startDate = $startDate;

        $this->endDate = $endDate;
    }

    /**
     * @param DateTimeInterface $startDate
     * @param DateTimeInterface $endDate
     * @return static
     * @throws InvalidPeriod
     */
    public static function create(DateTimeInterface $startDate, DateTimeInterface $endDate): self
    {
        return new static($startDate, $endDate);
    }

    /**
     * @param int $numberOfDays
     * @return static
     * @throws InvalidPeriod
     */
    public static function days(int $numberOfDays): self
    {
        $endDate = today();

        $startDate = today()->subDays($numberOfDays)->startOfDay();

        return new static($startDate, $endDate);
    }

    /**
     * @param int $numberOfMonths
     * @return static
     * @throws InvalidPeriod
     */
    public static function months(int $numberOfMonths): self
    {
        $endDate = today();

        $startDate = today()->subMonths($numberOfMonths)->startOfDay();

        return new static($startDate, $endDate);
    }

    /**
     * @param int $numberOfYears
     * @return static
     * @throws InvalidPeriod
     */
    public static function years(int $numberOfYears): self
    {
        $endDate = today();

        $startDate = today()->subYears($numberOfYears)->startOfDay();

        return new static($startDate, $endDate);
    }
}
