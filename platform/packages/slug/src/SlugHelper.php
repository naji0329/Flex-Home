<?php

namespace Botble\Slug;

use Botble\Base\Models\BaseModel;
use Botble\Page\Models\Page;
use Botble\Slug\Repositories\Interfaces\SlugInterface;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;

class SlugHelper
{
    /**
     * @var array
     */
    protected $canEmptyPrefixes = [Page::class];

    /**
     * @param string|array $model
     * @param string|null $name
     * @return $this
     */
    public function registerModule($model, ?string $name = null): self
    {
        $supported = $this->supportedModels();

        if (!is_array($model)) {
            $supported[$model] = $name ?: $model;
        } else {
            foreach ($model as $item) {
                $supported[$item] = $name ?: $item;
            }
        }

        config(['packages.slug.general.supported' => $supported]);

        return $this;
    }

    /**
     * @param string|array $model
     * @return $this
     */
    public function removeModule($model): self
    {
        $supported = $this->supportedModels();

        Arr::forget($supported, $model);

        config(['packages.slug.general.supported' => $supported]);

        return $this;
    }

    /**
     * @return array
     */
    public function supportedModels(): array
    {
        return config('packages.slug.general.supported', []);
    }

    /**
     * @param string $model
     * @param string|null $prefix
     * @param bool $canEmptyPrefix
     * @return $this
     */
    public function setPrefix(string $model, ?string $prefix, bool $canEmptyPrefix = false): self
    {
        $prefixes = config('packages.slug.general.prefixes', []);
        $prefixes[$model] = $prefix;

        config(['packages.slug.general.prefixes' => $prefixes]);

        if ($canEmptyPrefix) {
            $this->canEmptyPrefixes[] = $model;
        }

        return $this;
    }

    /**
     * @return bool
     */
    public function isSupportedModel(string $model): bool
    {
        return in_array($model, array_keys($this->supportedModels()));
    }

    /**
     * @param BaseModel|array $model
     * @return $this
     */
    public function disablePreview($model): self
    {
        if (!is_array($model)) {
            $model = [$model];
        }

        config([
            'packages.slug.general.disable_preview' => array_merge(config('packages.slug.general.disable_preview', []),
                $model),
        ]);

        return $this;
    }

    /**
     * @param string $model
     * @return bool
     */
    public function canPreview(string $model): bool
    {
        return !in_array($model, config('packages.slug.general.disable_preview', []));
    }

    /**
     * @param string|null $key
     * @param string $model
     * @return mixed
     */
    public function getSlug(
        ?string $key,
        ?string $prefix = null,
        ?string $model = null,
        $referenceId = null
    )
    {
        $condition = [];

        if ($key !== null) {
            $condition = ['key' => $key];
        }

        if ($model !== null) {
            $condition['reference_type'] = $model;
        }

        if ($referenceId !== null) {
            $condition['reference_id'] = $referenceId;
        }

        if ($prefix !== null) {
            $condition['prefix'] = $prefix;
        }

        return app(SlugInterface::class)->getFirstBy($condition);
    }

    /**
     * @param string $model
     * @param string $default
     * @return string|null
     */
    public function getPrefix(string $model, string $default = ''): ?string
    {
        $permalink = setting($this->getPermalinkSettingKey($model));

        if ($permalink !== null) {
            return $permalink;
        }

        $config = Arr::get(config('packages.slug.general.prefixes', []), $model);

        if ($config !== null) {
            return (string)$config;
        }

        return $default;
    }

    /**
     * @param string $model
     * @return string
     */
    public function getPermalinkSettingKey(string $model): string
    {
        return 'permalink-' . Str::slug(str_replace('\\', '_', $model));
    }

    /**
     * @return bool
     */
    public function turnOffAutomaticUrlTranslationIntoLatin(): bool
    {
        return setting('slug_turn_off_automatic_url_translation_into_latin', 0) == 1;
    }

    /**
     * @return array|string[]
     */
    public function getCanEmptyPrefixes(): array
    {
        return $this->canEmptyPrefixes;
    }
}
