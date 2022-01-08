<?php

namespace Botble\Shortcode;

use Botble\Shortcode\Compilers\ShortcodeCompiler;

class Shortcode
{
    /**
     * Shortcode compiler
     *
     * @var ShortcodeCompiler
     */
    protected $compiler;

    /**
     * Constructor
     *
     * @param ShortcodeCompiler $compiler
     * @since 2.1
     */
    public function __construct(ShortcodeCompiler $compiler)
    {
        $this->compiler = $compiler;
    }

    /**
     * Register a new shortcode
     *
     * @param string $key
     * @param string $name
     * @param null $description
     * @param callable|string $callback
     * @return Shortcode
     * @since 2.1
     */
    public function register($key, $name, $description = null, $callback = null)
    {
        $this->compiler->add($key, $name, $description, $callback);

        return $this;
    }

    /**
     * Enable the shortcode
     *
     * @return Shortcode
     * @since 2.1
     */
    public function enable()
    {
        $this->compiler->enable();

        return $this;
    }

    /**
     * Disable the shortcode
     *
     * @return Shortcode
     * @since 2.1
     */
    public function disable()
    {
        $this->compiler->disable();

        return $this;
    }

    /**
     * Compile the given string
     *
     * @param string $value
     * @return string
     * @since 2.1
     */
    public function compile($value)
    {
        // Always enable when we call the compile method directly
        $this->enable();

        // return compiled contents
        $html = $this->compiler->compile($value);

        $this->disable();

        return $html;
    }

    /**
     * @param string $value
     * @return string
     * @since 2.1
     */
    public function strip($value)
    {
        return $this->compiler->strip($value);
    }

    /**
     * @return array
     */
    public function getAll()
    {
        return $this->compiler->getRegistered();
    }

    /**
     * @param string $key
     * @param string|callable $html
     */
    public function setAdminConfig(string $key, $html)
    {
        $this->compiler->setAdminConfig($key, $html);
    }

    /**
     * @param string $name
     * @param array $attributes
     * @return string
     */
    public function generateShortcode($name, array $attributes = [])
    {
        $parsedAttributes = '';
        foreach ($attributes as $key => $attribute) {
            $parsedAttributes .= ' ' . $key . '="' . $attribute . '"';
        }

        return '[' . $name . $parsedAttributes . '][/' . $name . ']';
    }

    /**
     * @return ShortcodeCompiler
     */
    public function getCompiler()
    {
        return $this->compiler;
    }
}
