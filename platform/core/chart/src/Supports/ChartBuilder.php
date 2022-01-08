<?php

namespace Botble\Chart\Supports;

use Illuminate\Contracts\Container\BindingResolutionException;
use Illuminate\Contracts\Container\Container;
use InvalidArgumentException;

class ChartBuilder
{
    /**
     * @var Container
     */
    protected $container;

    /**
     * ChartBuilder constructor.
     * @param Container $container
     */
    public function __construct(Container $container)
    {
        $this->container = $container;
    }

    /**
     * @param string $chartClass
     * @return Chart
     * @throws BindingResolutionException
     */
    public function create($chartClass)
    {
        if (!class_exists($chartClass)) {
            throw new InvalidArgumentException(
                'Chart class with name ' . $chartClass . ' does not exist.'
            );
        }

        return $this->container->make($chartClass);
    }
}
