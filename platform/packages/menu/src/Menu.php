<?php

namespace Botble\Menu;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Menu\Repositories\Eloquent\MenuRepository;
use Botble\Menu\Repositories\Interfaces\MenuInterface;
use Botble\Menu\Repositories\Interfaces\MenuNodeInterface;
use Botble\Support\Services\Cache\Cache;
use Collective\Html\HtmlBuilder;
use Exception;
use Illuminate\Cache\CacheManager;
use Illuminate\Config\Repository;
use Illuminate\Contracts\Filesystem\FileNotFoundException;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;
use Theme;
use Throwable;

class Menu
{
    /**
     * @var MenuInterface
     */
    protected $menuRepository;

    /**
     * @var HtmlBuilder
     */
    protected $html;

    /**
     * @var MenuNodeInterface
     */
    protected $menuNodeRepository;

    /**
     * @var Cache
     */
    protected $cache;

    /**
     * @var Repository
     */
    protected $config;

    /**
     * @var array
     */
    protected $menuOptionModels = [];

    /**
     * @var Collection
     */
    protected $data = [];

    /**
     * Whether the settings data are loaded.
     *
     * @var boolean
     */
    protected $loaded = false;

    /**
     * Menu constructor.
     * @param MenuInterface $menuRepository
     * @param HtmlBuilder $html
     * @param MenuNodeInterface $menuNodeRepository
     * @param CacheManager $cache
     * @param Repository $config
     */
    public function __construct(
        MenuInterface $menuRepository,
        HtmlBuilder $html,
        MenuNodeInterface $menuNodeRepository,
        CacheManager $cache,
        Repository $config
    ) {
        $this->config = $config;
        $this->menuRepository = $menuRepository;
        $this->html = $html;
        $this->menuNodeRepository = $menuNodeRepository;
        $this->cache = new Cache($cache, MenuRepository::class);
        $this->data = collect([]);
    }

    /**
     * @param string $slug
     * @param bool $active
     * @return bool
     */
    public function hasMenu($slug, $active)
    {
        return $this->menuRepository->findBySlug($slug, $active);
    }

    /**
     * @param array $menuNodes
     * @param int $menuId
     * @param int $parentId
     */
    public function recursiveSaveMenu($menuNodes, $menuId, $parentId)
    {
        try {
            foreach ($menuNodes as $row) {
                $child = Arr::get($row, 'children', []);
                $hasChild = 0;
                if (!empty($child)) {
                    $hasChild = 1;
                }
                $parent = $this->saveMenuNode($row, $menuId, $parentId, $hasChild);
                if (!empty($parent)) {
                    $this->recursiveSaveMenu($child, $menuId, $parent);
                }
            }
        } catch (Exception $ex) {
            info($ex->getMessage());
        }
    }

    /**
     * @param array $menuItem
     * @param int $menuId
     * @param int $parentId
     * @param int $hasChild
     * @return int
     */
    protected function saveMenuNode($menuItem, $menuId, $parentId, $hasChild = 0)
    {
        $item = $this->menuNodeRepository->findById(Arr::get($menuItem, 'id'));

        if (!$item) {
            $item = $this->menuNodeRepository->getModel();
        }

        $item->title = str_replace('&amp;', '&', Arr::get($menuItem, 'title'));
        $item->css_class = Arr::get($menuItem, 'class');
        $item->position = Arr::get($menuItem, 'position');
        $item->icon_font = Arr::get($menuItem, 'iconFont');
        $item->target = Arr::get($menuItem, 'target');
        $item->menu_id = $menuId;
        $item->parent_id = $parentId;
        $item->has_child = $hasChild;

        switch (Arr::get($menuItem, 'referenceType')) {
            case 'custom-link':
            case '':
                $item->reference_id = 0;
                $item->reference_type = null;
                $item->url = Arr::get($menuItem, 'customUrl');
                break;
            default:
                $item->reference_id = (int)Arr::get($menuItem, 'referenceId');
                $item->reference_type = Arr::get($menuItem, 'referenceType');
                if (class_exists($item->reference_type)) {
                    $reference = $item->reference_type::find($item->reference_id);
                    if ($reference) {
                        $item->url = str_replace(url(''), '', $reference->url);
                    }
                }
                break;
        }

        $this->menuNodeRepository->createOrUpdate($item);

        return $item->id;
    }

    /**
     * @param string $location
     * @param string $description
     * @return $this
     */
    public function addMenuLocation(string $location, string $description): self
    {
        $locations = $this->getMenuLocations();
        $locations[$location] = $description;

        $this->config->set('packages.menu.general.locations', $locations);

        return $this;
    }

    /**
     * @return array
     */
    public function getMenuLocations(): array
    {
        return $this->config->get('packages.menu.general.locations', []);
    }

    /**
     * @param string $location
     * @return $this
     */
    public function removeMenuLocation(string $location): self
    {
        $locations = $this->getMenuLocations();
        Arr::forget($locations, $location);

        $this->config->set('packages.menu.general.locations', $locations);

        return $this;
    }

    /**
     * @param string $location
     * @param array $attributes
     * @return string
     * @throws Throwable
     */
    public function renderMenuLocation(string $location, array $attributes = []): string
    {

        $this->load();

        $html = '';

        foreach ($this->data as $menu) {
            if (!in_array($location, $menu->locations->pluck('location')->all())) {
                continue;
            }

            $attributes['slug'] = $menu->slug;
            $html .= $this->generateMenu($attributes);
        }

        return $html;
    }

    /**
     * Make sure data is loaded.
     *
     * @param boolean $force Force a reload of data. Default false.
     */
    public function load($force = false)
    {
        if (!$this->loaded || $force) {
            $this->data = $this->read();
            $this->loaded = true;
        }
    }

    /**
     * @return Collection
     */
    protected function read()
    {
        return $this->menuRepository->allBy(['status' => BaseStatusEnum::PUBLISHED], ['menuNodes', 'locations']);
    }

    /**
     * @param array $args
     * @return mixed|null|string
     * @throws Throwable
     */
    public function generateMenu(array $args = [])
    {
        $this->load();

        $view = Arr::get($args, 'view');
        $theme = Arr::get($args, 'theme', true);

        $menu = Arr::get($args, 'menu');

        $slug = Arr::get($args, 'slug');
        if (!$menu && !$slug) {
            return null;
        }

        $parentId = Arr::get($args, 'parent_id', 0);

        if (!$menu) {
            $menu = $this->data->where('slug', $slug)->first();
        }

        if (!$menu) {
            return null;
        }

        if (!Arr::has($args, 'menu_nodes')) {
            $menuNodes = $menu->menuNodes->where('parent_id', $parentId);
        } else {
            $menuNodes = Arr::get($args, 'menu_nodes', []);
        }

        if ($menuNodes instanceof Collection) {
            $menuNodes = $menuNodes->sortBy('position');
        }

        $data = [
            'menu'       => $menu,
            'menu_nodes' => $menuNodes,
        ];

        $data['options'] = $this->html->attributes(Arr::get($args, 'options', []));

        if ($theme && $view) {
            return Theme::partial($view, $data);
        }

        if ($view) {
            return view($view, $data)->render();
        }

        return view('packages/menu::partials.default', $data)->render();
    }

    /**
     * @param string $model
     * @param string $name
     * @throws FileNotFoundException
     * @throws Throwable
     */
    public function registerMenuOptions(string $model, string $name)
    {
        $options = Menu::generateSelect([
            'model'   => new $model,
            'options' => [
                'class' => 'list-item',
            ],
        ]);

        echo view('packages/menu::menu-options', compact('options', 'name'));
    }

    /**
     * @param array $args
     * @return mixed|null|string
     * @throws FileNotFoundException
     * @throws Throwable
     */
    public function generateSelect(array $args = [])
    {
        $model = Arr::get($args, 'model');

        $options = $this->html->attributes(Arr::get($args, 'options', []));

        if (!Arr::has($args, 'items')) {
            if (method_exists($model, 'children')) {
                $items = $model->where('parent_id', Arr::get($args, 'parent_id', 0))
                    ->with('children')
                    ->orderBy('name', 'asc');
            } else {
                $items = $model->orderBy('name');
            }

            if (Arr::get($args, 'active', true)) {
                $items = $items->where('status', BaseStatusEnum::PUBLISHED);
            }

            $items = apply_filters(BASE_FILTER_BEFORE_GET_ADMIN_LIST_ITEM, $items, $model, get_class($model))->get();
        } else {
            $items = Arr::get($args, 'items', []);
        }

        if (empty($items)) {
            return null;
        }

        return view('packages/menu::partials.select', compact('items', 'model', 'options'))->render();
    }

    /**
     * @param string $model
     * @return $this
     */
    public function addMenuOptionModel(string $model): self
    {
        $this->menuOptionModels[] = $model;

        return $this;
    }

    /**
     * @return array
     */
    public function getMenuOptionModels(): array
    {
        return $this->menuOptionModels;
    }

    /**
     * @param array $models
     * @return $this
     */
    public function setMenuOptionModels(array $models): self
    {
        $this->menuOptionModels = $models;

        return $this;
    }

    /**
     * @return $this
     */
    public function clearCacheMenuItems(): self
    {
        try {
            $nodes = $this->menuNodeRepository->all(['reference']);

            foreach ($nodes as $node) {
                if (!$node->reference_type ||
                    !class_exists($node->reference_type) ||
                    !$node->reference_id ||
                    !$node->reference
                ) {
                    continue;
                }

                $node->url = str_replace(url(''), '', $node->reference->url);
                $node->save();
            }
        } catch (Exception $exception) {
            info($exception->getMessage());
        }

        return $this;
    }
}
