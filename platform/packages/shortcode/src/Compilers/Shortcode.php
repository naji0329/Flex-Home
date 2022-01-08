<?php

namespace Botble\Shortcode\Compilers;

class Shortcode
{

    /**
     * Shortcode name
     *
     * @var string
     */
    protected $name;

    /**
     * Shortcode Attributes
     *
     * @var array
     */
    protected $attributes = [];

    /**
     * Shortcode content
     *
     * @var string
     */
    public $content;

    /**
     * Constructor
     *
     * @param string $name
     * @param array $attributes
     * @param string $content
     * @since 2.1
     */
    public function __construct($name, $attributes = [], $content = null)
    {
        $this->name = $name;
        $this->attributes = $attributes;
        $this->content = $content;
    }

    /**
     * Get html attribute
     *
     * @param string $attribute
     * @param $fallback
     * @return string|null
     * @since 2.1
     */
    public function get($attribute, $fallback = null)
    {
        $value = $this->{$attribute};
        if (!empty($value)) {
            return $attribute . '="' . $value . '"';
        } elseif (!empty($fallback)) {
            return $attribute . '="' . $fallback . '"';
        }

        return '';
    }

    /**
     * Get shortcode name
     *
     * @return string
     * @since 2.1
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Get shortcode attributes
     *
     * @return string
     * @since 2.1
     */
    public function getContent()
    {
        return $this->content;
    }

    /**
     * Return array of attributes;
     *
     * @return array
     * @since 2.1
     */
    public function toArray()
    {
        return $this->attributes;
    }

    /**
     * Dynamically get attributes
     *
     * @param string $param
     * @return string|null
     * @since 2.1
     */
    public function __get($param)
    {
        return isset($this->attributes[$param]) ? $this->attributes[$param] : null;
    }
}
