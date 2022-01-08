<?php

namespace Theme\FlexHome\Http\Controllers;

use App;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Base\Supports\RepositoryHelper;
use Botble\Blog\Repositories\Interfaces\PostInterface;
use Botble\Location\Repositories\Interfaces\CityInterface;
use Botble\RealEstate\Enums\ModerationStatusEnum;
use Botble\RealEstate\Enums\PropertyStatusEnum;
use Botble\RealEstate\Enums\PropertyTypeEnum;
use Botble\RealEstate\Models\Account;
use Botble\RealEstate\Repositories\Interfaces\AccountInterface;
use Botble\RealEstate\Repositories\Interfaces\ProjectInterface;
use Botble\RealEstate\Repositories\Interfaces\PropertyInterface;
use Botble\Theme\Http\Controllers\PublicController;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use RealEstateHelper;
use SeoHelper;
use Theme;
use Theme\FlexHome\Http\Resources\AgentHTMLResource;
use Theme\FlexHome\Http\Resources\PostResource;
use Theme\FlexHome\Http\Resources\PropertyHTMLResource;
use Theme\FlexHome\Http\Resources\PropertyResource;

class FlexHomeController extends PublicController
{
    /**
     * @param string $slug
     * @param Request $request
     * @param ProjectInterface $projectRepository
     * @param CityInterface $cityRepository
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse|\Response
     */
    public function getProjectsByCity(
        string $slug,
        Request $request,
        ProjectInterface $projectRepository,
        CityInterface $cityRepository,
        BaseHttpResponse $response
    ) {
        $city = $cityRepository->getFirstBy(compact('slug'));

        if (!$city) {
            abort(404);
        }

        SeoHelper::setTitle(__('Projects in :city', ['city' => $city->name]));

        Theme::breadcrumb()
            ->add(__('Home'), route('public.index'))
            ->add(SeoHelper::getTitle(), route('public.project-by-city', $city->slug));

        do_action(BASE_ACTION_PUBLIC_RENDER_SINGLE, CITY_MODULE_SCREEN_NAME, $city);

        $perPage = (int)$request->input('per_page') ? (int)$request->input('per_page') : (int)theme_option('number_of_projects_per_page',
            12);

        $filters = [
            'keyword'     => $request->input('k'),
            'blocks'      => $request->input('blocks'),
            'min_floor'   => $request->input('min_floor'),
            'max_floor'   => $request->input('max_floor'),
            'min_flat'    => $request->input('min_flat'),
            'max_flat'    => $request->input('max_flat'),
            'category_id' => $request->input('category_id'),
            'city'        => $slug,
            'location'    => $request->input('location'),
            'sort_by'     => $request->input('sort_by'),
        ];

        $params = [
            'paginate' => [
                'per_page'      => $perPage ?: 12,
                'current_paged' => (int)$request->input('page', 1),
            ],
            'order_by' => ['re_projects.created_at' => 'DESC'],
            'with'     => RealEstateHelper::getProjectRelationsQuery(),
        ];

        $projects = $projectRepository->getProjects($filters, $params);

        if ($request->ajax()) {
            if ($request->input('minimal')) {
                return $response->setData(Theme::partial('search-suggestion', ['items' => $projects]));
            }

            return $response->setData(Theme::partial('real-estate.projects.items', ['projects' => $projects]));
        }

        $categories = get_property_categories([
            'indent'     => '↳',
            'conditions' => ['status' => BaseStatusEnum::PUBLISHED],
        ]);

        return Theme::scope('real-estate.projects', compact('projects', 'categories'))
            ->render();
    }

    /**
     * @param string $slug
     * @param Request $request
     * @param PropertyInterface $propertyRepository
     * @param CityInterface $cityRepository
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse|\Response
     */
    public function getPropertiesByCity(
        string $slug,
        Request $request,
        PropertyInterface $propertyRepository,
        CityInterface $cityRepository,
        BaseHttpResponse $response
    ) {
        $city = $cityRepository->getFirstBy(compact('slug'));

        if (!$city) {
            abort(404);
        }

        SeoHelper::setTitle(__('Properties in :city', ['city' => $city->name]));

        do_action(BASE_ACTION_PUBLIC_RENDER_SINGLE, CITY_MODULE_SCREEN_NAME, $city);

        Theme::breadcrumb()
            ->add(__('Home'), route('public.index'))
            ->add(SeoHelper::getTitle(), route('public.properties-by-city', $city->slug));

        $perPage = (int)$request->input('per_page') ? (int)$request->input('per_page') : (int)theme_option('number_of_properties_per_page',
            12);

        $filters = [
            'keyword'     => $request->input('k'),
            'type'        => $request->input('type'),
            'bedroom'     => $request->input('bedroom'),
            'bathroom'    => $request->input('bathroom'),
            'floor'       => $request->input('floor'),
            'min_price'   => $request->input('min_price'),
            'max_price'   => $request->input('max_price'),
            'min_square'  => $request->input('min_square'),
            'max_square'  => $request->input('max_square'),
            'project'     => $request->input('project'),
            'category_id' => $request->input('category_id'),
            'city'        => $slug,
            'location'    => $request->input('location'),
            'sort_by'     => $request->input('sort_by'),
        ];

        $params = [
            'paginate' => [
                'per_page'      => $perPage ?: 12,
                'current_paged' => (int)$request->input('page', 1),
            ],
            'order_by' => ['re_properties.created_at' => 'DESC'],
            'with'     => RealEstateHelper::getPropertyRelationsQuery(),
        ];

        $properties = $propertyRepository->getProperties($filters, $params);

        if ($request->ajax()) {
            if ($request->input('minimal')) {
                return $response->setData(Theme::partial('search-suggestion', ['items' => $properties]));
            }

            return $response->setData(Theme::partial('real-estate.properties.items', ['properties' => $properties]));
        }

        $categories = get_property_categories([
            'indent'     => '↳',
            'conditions' => ['status' => BaseStatusEnum::PUBLISHED],
        ]);

        return Theme::scope('real-estate.properties', compact('properties', 'categories', 'city'))
            ->render();
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function ajaxGetProperties(Request $request, BaseHttpResponse $response)
    {
        if (!$request->ajax()) {
            abort(404);
        }

        $properties = [];
        $with = RealEstateHelper::getPropertyRelationsQuery();

        switch ($request->input('type')) {
            case 'related':
                $properties = app(PropertyInterface::class)
                    ->getRelatedProperties(
                        $request->input('property_id'),
                        (int)theme_option('number_of_related_properties', 8),
                        $with
                    );
                break;
            case 'rent':
                $properties = app(PropertyInterface::class)->getPropertiesByConditions(
                    [
                        're_properties.is_featured'       => true,
                        're_properties.type'              => PropertyTypeEnum::RENT,
                        ['re_properties.status', 'NOT_IN', [PropertyStatusEnum::NOT_AVAILABLE]],
                        're_properties.moderation_status' => ModerationStatusEnum::APPROVED,
                    ],
                    (int)theme_option('number_of_properties_for_rent', 8),
                    $with
                );
                break;
            case 'sale':
                $properties = app(PropertyInterface::class)->getPropertiesByConditions(
                    [
                        're_properties.is_featured'       => true,
                        're_properties.type'              => PropertyTypeEnum::SALE,
                        ['re_properties.status', 'NOT_IN', [PropertyStatusEnum::NOT_AVAILABLE]],
                        're_properties.moderation_status' => ModerationStatusEnum::APPROVED,
                    ],
                    (int)theme_option('number_of_properties_for_sale', 8),
                    $with
                );
                break;
            case 'project-properties-for-sell':
                $properties = app(PropertyInterface::class)->getPropertiesByConditions(
                    [
                        're_properties.project_id'        => $request->input('project_id'),
                        're_properties.type'              => PropertyTypeEnum::SALE,
                        ['re_properties.status', 'NOT_IN', [PropertyStatusEnum::NOT_AVAILABLE]],
                        're_properties.moderation_status' => ModerationStatusEnum::APPROVED,
                    ],
                    (int)theme_option('number_of_properties_for_sale', 8),
                    $with
                );
                break;
            case 'project-properties-for-rent':
                $properties = app(PropertyInterface::class)->getPropertiesByConditions(
                    [
                        're_properties.project_id'        => $request->input('project_id'),
                        're_properties.type'              => PropertyTypeEnum::RENT,
                        ['re_properties.status', 'NOT_IN', [PropertyStatusEnum::NOT_AVAILABLE]],
                        're_properties.moderation_status' => ModerationStatusEnum::APPROVED,
                    ],
                    (int)theme_option('number_of_properties_for_rent', 8),
                    $with
                );
                break;
            case 'recently-viewed-properties':
                $cookieName = App::getLocale() . '_recently_viewed_properties';
                $jsonRecentViewProduct = null;

                if (isset($_COOKIE[$cookieName])) {
                    $jsonRecentViewProduct = $_COOKIE[$cookieName];
                }

                if (!empty($jsonRecentViewProduct)) {
                    $ids = collect(json_decode($jsonRecentViewProduct, true))->flatten()->all();

                    $properties = app(PropertyInterface::class)->getPropertiesByConditions(
                        [
                            ['re_properties.id', 'IN', $ids],
                            ['re_properties.status', 'NOT_IN', [PropertyStatusEnum::NOT_AVAILABLE]],
                            're_properties.moderation_status' => ModerationStatusEnum::APPROVED,
                        ],
                        (int)theme_option('number_of_properties_for_rent', 8),
                        $with
                    );

                    $reversed = array_reverse($ids);

                    $properties = $properties->sortBy(function ($model) use ($reversed) {
                        return array_search($model->id, $reversed);
                    });
                }
                break;
        }

        return $response
            ->setData(PropertyHTMLResource::collection($properties))
            ->toApiResponse();
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function ajaxGetPropertiesForMap(Request $request, BaseHttpResponse $response)
    {
        $filters = [
            'keyword'     => $request->input('k'),
            'type'        => $request->input('type'),
            'bedroom'     => $request->input('bedroom'),
            'bathroom'    => $request->input('bathroom'),
            'floor'       => $request->input('floor'),
            'min_price'   => $request->input('min_price'),
            'max_price'   => $request->input('max_price'),
            'min_square'  => $request->input('min_square'),
            'max_square'  => $request->input('max_square'),
            'project'     => $request->input('project'),
            'category_id' => $request->input('category_id'),
            'city'        => $request->input('city'),
            'city_id'     => $request->input('city_id'),
            'location'    => $request->input('location'),
        ];

        $params = [
            'with'     => RealEstateHelper::getPropertyRelationsQuery(),
            'paginate' => [
                'per_page'      => 20,
                'current_paged' => (int)$request->input('page', 1),
            ],
        ];

        $properties = app(PropertyInterface::class)->getProperties($filters, $params);

        return $response
            ->setData(PropertyResource::collection($properties))
            ->toApiResponse();
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse|\Illuminate\Http\RedirectResponse|\Illuminate\Http\Resources\Json\JsonResource
     */
    public function ajaxGetPosts(Request $request, BaseHttpResponse $response)
    {
        if (!$request->ajax() || !$request->wantsJson()) {
            abort(404);
        }

        $posts = app(PostInterface::class)->getFeatured(4, ['slugable', 'categories', 'categories.slugable']);

        return $response
            ->setData(PostResource::collection($posts))
            ->toApiResponse();
    }

    /**
     * @param Request $request
     * @param AccountInterface $accountRepository
     * @return \Response
     */
    public function getAgents(Request $request, AccountInterface $accountRepository)
    {
        $accounts = $accountRepository->advancedGet([
            'paginate'  => [
                'per_page'      => 12,
                'current_paged' => (int)$request->input('page'),
            ],
            'withCount' => [
                'properties' => function ($query) {
                    return RepositoryHelper::applyBeforeExecuteQuery($query, $query->getModel());
                },
            ],
        ]);

        SeoHelper::setTitle(__('Agents'));

        Theme::breadcrumb()->add(__('Home'), route('public.index'))->add(__('Agents'), route('public.agents'));

        return Theme::scope('real-estate.agents', compact('accounts'))->render();
    }

    /**
     * @param string $username
     * @param Request $request
     * @param PropertyInterface $propertyRepository
     * @return \Response
     */
    public function getAgent(
        string $username,
        Request $request,
        AccountInterface $accountRepository,
        PropertyInterface $propertyRepository
    ) {
        $account = $accountRepository->getFirstBy(['username' => $username]);

        if (!$account) {
            abort(404);
        }

        SeoHelper::setTitle($account->name);

        $properties = $propertyRepository->advancedGet([
            'condition' => [
                'author_id'   => $account->id,
                'author_type' => Account::class,
            ],
            'paginate'  => [
                'per_page'      => 12,
                'current_paged' => (int)$request->input('page'),
            ],
            'with'      => RealEstateHelper::getPropertyRelationsQuery(),
        ]);

        return Theme::scope('real-estate.agent', compact('properties', 'account'))
            ->render();
    }

    /**
     * @param Request $request
     * @param CityInterface $cityRepository
     * @param BaseHttpResponse $response
     * @return mixed
     */
    public function ajaxGetCities(Request $request, CityInterface $cityRepository, BaseHttpResponse $response)
    {
        if (!$request->ajax()) {
            abort(404);
        }

        $keyword = $request->input('k');

        $cities = $cityRepository->filters($keyword);

        return $response->setData(Theme::partial('city-suggestion', ['items' => $cities]));
    }

    /**
     * @param Request $request
     * @return Response|\Response
     */
    public function getWishlist(Request $request, PropertyInterface $propertyRepository)
    {
        SeoHelper::setTitle(__('Wishlist'))
            ->setDescription(__('Wishlist'));

        $cookieName = App::getLocale() . '_wishlist';
        $jsonWishlist = null;
        if (isset($_COOKIE[$cookieName])) {
            $jsonWishlist = $_COOKIE[$cookieName];
        }

        $properties = collect([]);

        if (!empty($jsonWishlist)) {
            $arrValue = collect(json_decode($jsonWishlist, true))->flatten()->all();
            $properties = $propertyRepository->advancedGet([
                'condition' => [
                    ['re_properties.id', 'IN', $arrValue],
                ],
                'order_by'  => [
                    're_properties.id' => 'DESC',
                ],
                'paginate'  => [
                    'per_page'      => (int)theme_option('number_of_properties_per_page', 12),
                    'current_paged' => (int)$request->input('page', 1),
                ],
                'with'      => RealEstateHelper::getPropertyRelationsQuery(),
            ]);
        }

        Theme::breadcrumb()
            ->add(__('Home'), url('/'))
            ->add(__('Wishlist'));

        return Theme::scope('real-estate.wishlist', compact('properties'))->render();
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @param AccountInterface $accountRepository
     * @return BaseHttpResponse|\Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse|\Illuminate\Http\Resources\Json\JsonResource
     */
    public function ajaxGetFeaturedAgents(
        Request $request,
        BaseHttpResponse $response,
        AccountInterface $accountRepository
    ) {
        if (!$request->ajax()) {
            abort(404);
        }

        $accounts = $accountRepository->advancedGet([
            'condition' => [
                're_accounts.is_featured' => true,
            ],
            'order_by'  => [
                're_accounts.id' => 'DESC',
            ],
            'take'      => $request->input('limit') ? (int)$request->input('limit') : 4,
            'withCount' => [
                'properties' => function ($query) {
                    return RepositoryHelper::applyBeforeExecuteQuery($query, $query->getModel());
                },
            ],
        ]);

        return $response
            ->setData(AgentHTMLResource::collection($accounts))
            ->toApiResponse();
    }
}
