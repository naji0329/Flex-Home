<?php

namespace Botble\SocialLogin\Supports;

use Illuminate\Support\Arr;

class SocialService
{
    /**
     * @param string | array $model
     * @return $this
     */
    public function registerModule(array $model): self
    {
        config([
            'plugins.social-login.general.supported' => array_merge(
                $this->supportedModules(),
                [$model['guard'] => $model]
            ),
        ]);

        return $this;
    }

    /**
     * @return array
     */
    public function supportedModules()
    {
        return config('plugins.social-login.general.supported', []);
    }

    /**
     * @return bool
     */
    public function isSupportedModule(string $model): bool
    {
        return !!collect($this->supportedModules())->firstWhere('model', $model);
    }

    /**
     * @return bool
     */
    public function isSupportedModuleByKey(string $key)
    {
        return !!$this->getModule($key);
    }

    /**
     * @return array|null
     */
    public function getModule(string $key)
    {
        return Arr::get($this->supportedModules(), $key);
    }

    /**
     * @return bool
     */
    public function isSupportedGuard(string $guard): bool
    {
        return in_array($guard, array_keys($this->supportedModules()));
    }

    /**
     * @return array
     */
    public function getEnvDisableData()
    {
        return ['demo'];
    }

    /**
     * @return string
     */
    public function getDataDisable($key)
    {
        $setting = $this->setting($key);

        if (!$setting) {
            return '';
        }

        return substr($setting, 0, 3) . '***' . substr($setting, -3, 3);
    }

    /**
     * @return string
     */
    public function setting(string $key, $default = false)
    {
        return setting('social_login_' . $key, $default);
    }

    /**
     * @return bool
     */
    public function hasAnyProviderEnable(): bool
    {
        foreach ($this->getProviderKeys() as $value) {
            if ($this->getProviderEnabled($value)) {
                return true;
            }
        }

        return false;
    }

    /**
     * @return array
     */
    public function getProviderKeys(): array
    {
        return array_keys($this->getProviders());
    }

    /**
     * @return array
     */
    public function getProviders(): array
    {
        return [
            'facebook' => $this->getDataProviderDefault(),
            'google'   => $this->getDataProviderDefault(),
            'github'   => $this->getDataProviderDefault(),
            'linkedin' => $this->getDataProviderDefault(),
        ];
    }

    /**
     * @return array
     */
    public function getDataProviderDefault()
    {
        return [
            'data'    => [
                'app_id',
                'app_secret',
            ],
            'disable' => [
                'app_secret',
            ],
        ];
    }

    /**
     * @return string
     */
    public function getProviderEnabled(string $provider)
    {
        return $this->setting($provider . '_enable');
    }

    /**
     * @return array
     */
    public function getProviderKeysEnabled(): array
    {
        return collect($this->getProviderKeys())
            ->filter(function ($k) {
                return $this->getProviderEnabled($k);
            })
            ->toArray();
    }
}
