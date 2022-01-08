<?php

namespace Botble\Base\Supports;

use BadMethodCallException;
use Botble\Base\Models\BaseModel;
use Closure;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Arr;
use InvalidArgumentException;
use ReflectionException;
use ReflectionFunction;

class MacroableModels
{
    /**
     * @var array
     */
    protected $macros = [];

    /**
     * @return array
     */
    public function getAllMacros()
    {
        return $this->macros;
    }

    /**
     * @param string $model
     * @param string $name
     * @param Closure $closure
     */
    public function addMacro(string $model, string $name, Closure $closure)
    {
        $this->checkModelSubclass($model);

        if (!isset($this->macros[$name])) {
            $this->macros[$name] = [];
        }
        $this->macros[$name][$model] = $closure;
        $this->syncMacros($name);
    }

    /**
     * @param string $model
     */
    protected function checkModelSubclass(string $model)
    {
        if (!is_subclass_of($model, Model::class)) {
            throw new InvalidArgumentException('$model must be a subclass of Illuminate\\Database\\Eloquent\\Model');
        }
    }

    /**
     * @param string $name
     */
    protected function syncMacros($name)
    {
        $models = $this->macros[$name];
        Builder::macro($name, function (...$args) use ($name, $models) {
            /**
             * @var BaseModel $this
             */
            $class = get_class($this->getModel());

            if (!isset($models[$class])) {
                throw new BadMethodCallException("Call to undefined method ${class}::${name}()");
            }

            $closure = Closure::bind($models[$class], $this->getModel());
            return call_user_func($closure, ...$args);
        });
    }

    /**
     * @param string $name
     * @return array|\ArrayAccess|mixed
     */
    public function getMacro(string $name)
    {
        return Arr::get($this->macros, $name);
    }

    /**
     * @param string $model
     * @param string $name
     * @return bool
     */
    public function removeMacro($model, string $name)
    {
        $this->checkModelSubclass($model);

        if (isset($this->macros[$name]) && isset($this->macros[$name][$model])) {
            unset($this->macros[$name][$model]);
            if (count($this->macros[$name]) == 0) {
                unset($this->macros[$name]);
            } else {
                $this->syncMacros($name);
            }
            return true;
        }

        return false;
    }

    /**
     * @param string $model
     * @param string $name
     * @return bool
     */
    public function modelHasMacro($model, $name)
    {
        $this->checkModelSubclass($model);
        return (isset($this->macros[$name]) && isset($this->macros[$name][$model]));
    }

    /**
     * @param string $name
     * @return array
     */
    public function modelsThatImplement($name)
    {
        if (!isset($this->macros[$name])) {
            return [];
        }
        return array_keys($this->macros[$name]);
    }

    /**
     * @param string $model
     * @return array
     * @throws ReflectionException
     */
    public function macrosForModel($model)
    {
        $this->checkModelSubclass($model);

        $macros = [];

        foreach ($this->macros as $macro => $models) {
            if (in_array($model, array_keys($models))) {
                $params = (new ReflectionFunction($this->macros[$macro][$model]))->getParameters();
                $macros[$macro] = [
                    'name'       => $macro,
                    'parameters' => $params,
                ];
            }
        }

        return $macros;
    }
}
