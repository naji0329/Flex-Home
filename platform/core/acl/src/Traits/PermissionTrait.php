<?php

namespace Botble\ACL\Traits;

use Illuminate\Support\Str;

trait PermissionTrait
{
    /**
     * An array of cached, prepared permissions.
     *
     * @var array
     */
    protected $preparedPermissions;

    /**
     * Create a new permissions instance.
     *
     * @param array $permissions
     */
    public function __construct(array $permissions = null)
    {
        if (isset($permissions)) {
            $this->permissions = $permissions;
        }
    }

    /**
     * @param string $permission
     * @param bool $value
     * @param bool $create
     * @return $this
     */
    public function updatePermission(string $permission, $value = true, $create = false): self
    {
        if (array_key_exists($permission, (array)$this->permissions)) {
            $permissions = $this->permissions;

            $permissions[$permission] = $value;

            $this->permissions = $permissions;
        } elseif ($create) {
            $this->addPermission($permission, $value);
        }

        return $this;
    }

    /**
     * @param string $permission
     * @param bool $value
     * @return $this
     */
    public function addPermission(string $permission, $value = true): self
    {
        if (!array_key_exists($permission, (array)$this->permissions)) {
            $this->permissions = array_merge($this->permissions, [$permission => $value]);
        }

        return $this;
    }

    /**
     * @param string $permission
     * @return $this
     */
    public function removePermission(string $permission): self
    {
        if (array_key_exists($permission, (array)$this->permissions)) {
            $permissions = $this->permissions;

            unset($permissions[$permission]);

            $this->permissions = $permissions;
        }

        return $this;
    }

    /**
     * @param array|string $permissions
     * @return bool
     */
    public function hasAccess($permissions): bool
    {
        if (is_string($permissions)) {
            $permissions = func_get_args();
        }

        $prepared = $this->getPreparedPermissions();

        foreach ($permissions as $permission) {
            if (!$this->checkPermission($prepared, $permission)) {
                return false;
            }
        }

        return true;
    }

    /**
     * Lazily grab the prepared permissions.
     *
     * @return array
     */
    protected function getPreparedPermissions(): array
    {
        if ($this->preparedPermissions === null) {
            $this->preparedPermissions = $this->createPreparedPermissions();
        }

        return $this->preparedPermissions;
    }

    /**
     * @return array
     */
    protected function createPreparedPermissions(): array
    {
        $prepared = [];

        if (!empty($this->permissions)) {
            $this->preparePermissions($prepared, $this->permissions);
        }

        return $prepared;
    }

    /**
     * Does the heavy lifting of preparing permissions.
     *
     * @param array $prepared
     * @param array $permissions
     * @return void
     */
    protected function preparePermissions(array &$prepared, array $permissions): void
    {
        foreach ($permissions as $keys => $value) {
            foreach ($this->extractClassPermissions($keys) as $key) {
                // If the value is not in the array, we're opting in
                if (!array_key_exists($key, $prepared)) {
                    $prepared[$key] = $value;

                    continue;
                }

                // If our value is in the array and equals false, it will override
                if ($value === false) {
                    $prepared[$key] = $value;
                }
            }
        }
    }

    /**
     * Takes the given permission key and inspects it for a class & method. If
     * it exists, methods may be comma-separated, e.g. Class@method1,method2.
     *
     * @param string $key
     * @return array
     */
    protected function extractClassPermissions($key): array
    {
        if (!Str::contains($key, '@')) {
            return (array)$key;
        }

        $keys = [];

        [$class, $methods] = explode('@', $key);

        foreach (explode(',', $methods) as $method) {
            $keys[] = $class . '@' . $method;
        }

        return $keys;
    }

    /**
     * Checks a permission in the prepared array, including wildcard checks and permissions.
     *
     * @param array $prepared
     * @param string $permission
     * @return bool
     */
    protected function checkPermission(array $prepared, string $permission): bool
    {
        if (array_key_exists($permission, $prepared) && $prepared[$permission] === true) {
            return true;
        }

        foreach ($prepared as $key => $value) {
            if ((Str::is($permission, $key) || Str::is($key, $permission)) && $value === true) {
                return true;
            }
        }

        return false;
    }

    /**
     * @param array|string $permissions
     * @return bool
     */
    public function hasAnyAccess($permissions): bool
    {
        if (is_string($permissions)) {
            $permissions = func_get_args();
        }

        $prepared = $this->getPreparedPermissions();

        foreach ($permissions as $permission) {
            if ($this->checkPermission($prepared, $permission)) {
                return true;
            }
        }

        return false;
    }
}
