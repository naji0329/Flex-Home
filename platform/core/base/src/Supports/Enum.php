<?php

namespace Botble\Base\Supports;

use BadMethodCallException;
use JsonSerializable;
use Lang;
use Log;
use ReflectionClass;
use ReflectionException;
use UnexpectedValueException;

abstract class Enum implements JsonSerializable
{
    /**
     * Store existing constants in a static cache per object.
     *
     * @var array
     */
    protected static $cache = [];

    /**
     * @var string
     */
    protected static $langPath = 'core/base::enums';

    /**
     * Enum value
     *
     * @var mixed
     */
    protected $value;

    /**
     * Creates a new value of some type
     *
     * @param mixed $value
     * @throws UnexpectedValueException if incompatible type is given.
     */
    public function __construct($value)
    {
        if ($value instanceof static) {
            $this->value = $value->getValue();

            return;
        }

        if ($value !== null && !$this->isValid($value)) {
            Log::error('Value ' . $value . ' is not part of the enum ' . get_called_class());
        }

        $this->value = $value;
    }

    /**
     * @return mixed
     */
    public function getValue()
    {
        return $this->value;
    }

    /**
     * Check if is valid enum value
     *
     * @param string|int $value
     * @return bool
     */
    public static function isValid($value)
    {
        return in_array($value, static::toArray(), true);
    }

    /**
     * @param bool $includeDefault
     * @return array
     */
    public static function toArray(bool $includeDefault = false): array
    {
        $class = get_called_class();
        if (!isset(static::$cache[$class])) {
            try {
                $reflection = new ReflectionClass($class);
            } catch (ReflectionException $error) {
                info($error->getMessage());
            }
            static::$cache[$class] = $reflection->getConstants();
        }

        $result = static::$cache[$class];

        if (isset($result['__default']) && !$includeDefault) {
            unset($result['__default']);
        }

        return apply_filters(BASE_FILTER_ENUM_ARRAY, $result, get_called_class());
    }

    /**
     * Returns the names (keys) of all constants in the Enum class
     *
     * @return array
     */
    public static function keys()
    {
        return array_keys(static::toArray());
    }

    /**
     * Returns instances of the Enum class of all Enum constants
     *
     * @return static[] Constant name in key, Enum instance in value
     */
    public static function values()
    {
        $values = [];

        foreach (static::toArray() as $key => $value) {
            $values[$key] = new static($value);
        }

        return $values;
    }

    /**
     * Returns a value when called statically like so: MyEnum::SOME_VALUE() given SOME_VALUE is a class constant
     *
     * @param string $name
     * @param array $arguments
     *
     * @return static
     * @throws BadMethodCallException
     */
    public static function __callStatic($name, $arguments)
    {
        $array = static::toArray();
        if (isset($array[$name]) || array_key_exists($name, $array)) {
            return new static($array[$name]);
        }

        throw new BadMethodCallException('No static method or enum constant ' . $name . ' in class ' . get_called_class());
    }

    /**
     * @return array
     */
    public static function labels(): array
    {
        $result = [];

        foreach (static::toArray() as $value) {
            $result[$value] = static::getLabel($value);
        }

        return $result;
    }

    /**
     * @param string $value
     * @return string
     */
    public static function getLabel(?string $value): ?string
    {
        $key = sprintf(
            '%s.%s',
            static::$langPath,
            $value
        );

        $label = Lang::has($key) ? trans($key) : $value;

        return apply_filters(BASE_FILTER_ENUM_LABEL, $label, get_called_class());
    }

    /**
     * Returns the enum key (i.e. the constant name).
     *
     * @return mixed
     */
    public function getKey()
    {
        return static::search($this->value);
    }

    /**
     * Return key for value
     *
     * @param string|int $value
     *
     * @return mixed
     */
    public static function search($value)
    {
        return array_search($value, static::toArray(), true);
    }

    /**
     * @return string
     */
    public function __toString()
    {
        return (string)$this->value;
    }

    /**
     * Compares one Enum with another.
     *
     * @param Enum|null $enum
     * @return bool True if Enums are equal, false if not equal
     */
    final public function equals(Enum $enum = null)
    {
        return $enum !== null && $this->getValue() === $enum->getValue() && get_called_class() === get_class($enum);
    }

    /**
     * Specify data which should be serialized to JSON. This method returns data that can be serialized by json_encode()
     * natively.
     *
     * @return mixed
     * @link http://php.net/manual/en/jsonserializable.jsonserialize.php
     */
    public function jsonSerialize()
    {
        return $this->getValue();
    }

    /**
     * @return string
     */
    public function label(): ?string
    {
        return self::getLabel($this->getValue());
    }

    /**
     * @return string
     */
    public function toHtml()
    {
        return apply_filters(BASE_FILTER_ENUM_HTML, $this->value, get_called_class());
    }
}
