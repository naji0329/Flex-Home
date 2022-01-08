<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Models\Category;
use Botble\Language\Models\LanguageMeta;
use Botble\Menu\Models\Menu as MenuModel;
use Botble\Menu\Models\MenuLocation;
use Botble\Menu\Models\MenuNode;
use Botble\Page\Models\Page;
use Illuminate\Support\Arr;
use Menu;

class MenuSeeder extends BaseSeeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = [
            'en_US' => [
                [
                    'name'     => 'Main menu',
                    'slug'     => 'main-menu',
                    'location' => 'main-menu',
                    'items'    => [
                        [
                            'title' => 'Projects',
                            'url'   => '/projects',
                        ],
                        [
                            'title' => 'Properties',
                            'url'   => '/properties',
                        ],
                        [
                            'title' => 'Agents',
                            'url'   => '/agents',
                        ],
                        [
                            'title'          => 'News',
                            'reference_id'   => 2,
                            'reference_type' => Page::class,
                        ],
                        [
                            'title' => 'Careers',
                            'url'   => '/careers',
                        ],
                        [
                            'title'          => 'Contact',
                            'reference_id'   => 4,
                            'reference_type' => Page::class,
                        ],
                    ],
                ],
                [
                    'name'  => 'About',
                    'slug'  => 'about',
                    'items' => [
                        [
                            'title'          => 'About us',
                            'reference_id'   => 3,
                            'reference_type' => Page::class,
                        ],
                        [
                            'title'          => 'Contact us',
                            'reference_id'   => 4,
                            'reference_type' => Page::class,
                        ],
                        [
                            'title' => 'Careers',
                            'url'   => '/careers',
                        ],
                        [
                            'title'          => 'Terms & Conditions',
                            'reference_id'   => 5,
                            'reference_type' => Page::class,
                        ],
                    ],
                ],
                [
                    'name'  => 'More information',
                    'slug'  => 'more-information',
                    'items' => [
                        [
                            'title' => 'All projects',
                            'url'   => '/projects',
                        ],
                        [
                            'title' => 'All properties',
                            'url'   => '/properties',
                        ],
                        [
                            'title' => 'Houses for sale',
                            'url'   => '/properties?type=sale',
                        ],
                        [
                            'title' => 'Houses for rent',
                            'url'   => '/properties?type=rent',
                        ],
                    ],
                ],
                [
                    'name'  => 'News',
                    'slug'  => 'news',
                    'items' => [
                        [
                            'title'          => 'Latest news',
                            'reference_id'   => 2,
                            'reference_type' => Page::class,
                        ],
                        [
                            'title'          => 'House architecture',
                            'reference_id'   => 2,
                            'reference_type' => Category::class,
                        ],
                        [
                            'title'          => 'House design',
                            'reference_id'   => 4,
                            'reference_type' => Category::class,
                        ],
                        [
                            'title'          => 'Building materials',
                            'reference_id'   => 6,
                            'reference_type' => Category::class,
                        ],
                    ],
                ],
            ],
            'vi'    => [
                [
                    'name'     => 'Menu chính',
                    'slug'     => 'menu-chinh',
                    'location' => 'main-menu',
                    'items'    => [
                        [
                            'title' => 'Dự án',
                            'url'   => '/projects',
                        ],
                        [
                            'title' => 'Nhà - Căn Hộ',
                            'url'   => '/properties',
                        ],
                        [
                            'title' => 'Đại lý',
                            'url'   => '/agents',
                        ],
                        [
                            'title'          => 'Tin tức',
                            'reference_id'   => 2,
                            'reference_type' => Page::class,
                        ],
                        [
                            'title' => 'Tuyển dụng',
                            'url'   => '/careers',
                        ],
                        [
                            'title'          => 'Liên hệ',
                            'reference_id'   => 4,
                            'reference_type' => Page::class,
                        ],
                    ],
                ],
                [
                    'name'  => 'Về chúng tôi',
                    'slug'  => 've-chung-toi',
                    'items' => [
                        [
                            'title'          => 'Về chúng tôi',
                            'reference_id'   => 3,
                            'reference_type' => Page::class,
                        ],
                        [
                            'title'          => 'Liên hệ',
                            'reference_id'   => 4,
                            'reference_type' => Page::class,
                        ],
                        [
                            'title' => 'Tuyển dụng',
                            'url'   => '/careers',
                        ],
                        [
                            'title'          => 'Điều khoản và quy định',
                            'reference_id'   => 5,
                            'reference_type' => Page::class,
                        ],
                    ],
                ],
                [
                    'name'  => 'Thông tin thêm',
                    'slug'  => 'thong-tin-them',
                    'items' => [
                        [
                            'title' => 'Dự án',
                            'url'   => '/projects',
                        ],
                        [
                            'title' => 'Nhà - Căn hộ',
                            'url'   => '/properties',
                        ],
                        [
                            'title' => 'Nhà bán',
                            'url'   => '/properties?type=sale',
                        ],
                        [
                            'title' => 'Nhà cho thuê',
                            'url'   => '/properties?type=rent',
                        ],
                    ],
                ],
                [
                    'name'  => 'Tin tức',
                    'slug'  => 'tin-tuc',
                    'items' => [
                        [
                            'title'          => 'Tin tức mới nhất',
                            'reference_id'   => 2,
                            'reference_type' => Page::class,
                        ],
                        [
                            'title'          => 'Kiến trúc nhà',
                            'reference_id'   => 2,
                            'reference_type' => Category::class,
                        ],
                        [
                            'title'          => 'Thiết kế nhà',
                            'reference_id'   => 4,
                            'reference_type' => Category::class,
                        ],
                        [
                            'title'          => 'Vật liệu xây dựng',
                            'reference_id'   => 6,
                            'reference_type' => Category::class,
                        ],
                    ],
                ],
            ],
        ];

        MenuModel::truncate();
        MenuLocation::truncate();
        MenuNode::truncate();
        LanguageMeta::where('reference_type', MenuModel::class)->delete();
        LanguageMeta::where('reference_type', MenuLocation::class)->delete();

        foreach ($data as $locale => $menus) {
            foreach ($menus as $index => $item) {
                $menu = MenuModel::create(Arr::except($item, ['items', 'location']));

                if (isset($item['location'])) {
                    $menuLocation = MenuLocation::create([
                        'menu_id'  => $menu->id,
                        'location' => $item['location'],
                    ]);

                    $originValue = LanguageMeta::where([
                        'reference_id'   => $locale == 'en_US' ? 1 : 2,
                        'reference_type' => MenuLocation::class,
                    ])->value('lang_meta_origin');

                    LanguageMeta::saveMetaData($menuLocation, $locale, $originValue);
                }

                foreach ($item['items'] as $menuNode) {
                    $this->createMenuNode($index, $menuNode, $locale, $menu->id);
                }

                $originValue = null;

                if ($locale !== 'en_US') {
                    $originValue = LanguageMeta::where([
                        'reference_id'   => $index + 1,
                        'reference_type' => MenuModel::class,
                    ])->value('lang_meta_origin');
                }

                LanguageMeta::saveMetaData($menu, $locale, $originValue);
            }
        }

        Menu::clearCacheMenuItems();
    }

    /**
     * @param int $index
     * @param array $menuNode
     * @param string $locale
     * @param int $menuId
     * @param int $parentId
     */
    protected function createMenuNode(int $index, array $menuNode, string $locale, int $menuId, int $parentId = 0): void
    {
        $menuNode['menu_id'] = $menuId;
        $menuNode['parent_id'] = $parentId;

        if (Arr::has($menuNode, 'children')) {
            $children = $menuNode['children'];
            $menuNode['has_child'] = true;

            unset($menuNode['children']);
        } else {
            $children = [];
            $menuNode['has_child'] = false;
        }

        $createdNode = MenuNode::create($menuNode);

        if ($children) {
            foreach ($children as $child) {
                $this->createMenuNode($index, $child, $locale, $menuId, $createdNode->id);
            }
        }
    }
}
