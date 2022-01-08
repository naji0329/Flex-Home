<?php

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;
use Botble\Base\Models\MetaBox as MetaBoxModel;
use Botble\Career\Repositories\Interfaces\CareerInterface;
use Botble\Location\Models\City;
use Botble\Location\Repositories\Interfaces\CityInterface;
use Botble\RealEstate\Enums\ModerationStatusEnum;
use Botble\RealEstate\Enums\ProjectStatusEnum;
use Botble\RealEstate\Enums\PropertyStatusEnum;
use Botble\RealEstate\Models\Facility;
use Botble\RealEstate\Models\Feature;
use Botble\RealEstate\Models\Project;
use Botble\RealEstate\Models\Property;
use Botble\RealEstate\Repositories\Interfaces\ProjectInterface;
use Botble\RealEstate\Repositories\Interfaces\PropertyInterface;
use Botble\Theme\Events\RenderingSiteMapEvent;
use Botble\Theme\Supports\Youtube;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;
use Theme\FlexHome\Http\Requests\CityRequest;
use Theme\FlexHome\Forms\Fields\ThemeIconField;

app()->booted(function () {
    SeoHelper::registerModule(City::class);
});

register_page_template([
    'homepage'   => __('Homepage'),
    'full-width' => __('Full width'),
]);

register_sidebar([
    'id'          => 'footer_sidebar',
    'name'        => __('Footer sidebar'),
    'description' => __('Footer sidebar for Flex Home theme'),
]);

Event::listen(RenderingSiteMapEvent::class, function () {

    if (is_plugin_active('real-estate')) {
        $projects = app(ProjectInterface::class)->advancedGet([
            'condition' => [
                ['re_projects.status', 'NOT_IN', [ProjectStatusEnum::NOT_AVAILABLE]],
            ],
            'with'      => ['slugable'],
        ]);

        SiteMapManager::add(route('public.projects'), '2019-12-09 00:00:00', '0.4', 'monthly');

        foreach ($projects as $project) {
            SiteMapManager::add($project->url, $project->updated_at, '0.8');
        }

        $properties = app(PropertyInterface::class)->advancedGet([
            'condition' => [
                ['re_properties.status', 'NOT_IN', [PropertyStatusEnum::NOT_AVAILABLE]],
                're_properties.moderation_status' => ModerationStatusEnum::APPROVED,
            ],
            'with'      => ['slugable'],
        ]);

        SiteMapManager::add(route('public.properties'), '2010-11-25 00:00:00', '0.4', 'monthly');

        foreach ($properties as $property) {
            SiteMapManager::add($property->url, $property->updated_at, '0.8');
        }
    }

    if (is_plugin_active('career')) {
        $careers = app(CareerInterface::class)->allBy(['status' => BaseStatusEnum::PUBLISHED]);

        SiteMapManager::add(route('public.careers'), '2010-11-25 00:00:00', '0.4', 'monthly');

        foreach ($careers as $career) {
            SiteMapManager::add($career->url, $career->updated_at, '0.6');
        }
    }

});

RvMedia::setUploadPathAndURLToPublic();

RvMedia::addSize('small', 410, 270);

if (is_plugin_active('location')) {
    add_filter(BASE_FILTER_BEFORE_RENDER_FORM, 'add_addition_fields_into_form', 127, 2);

    /**
     * @param \Botble\Base\Forms\FormAbstract $form
     * @param $data
     * @throws \Illuminate\Contracts\Filesystem\FileNotFoundException
     */
    function add_addition_fields_into_form($form, $data)
    {
        switch (get_class($data)) {
            case City::class:
                $form
                    ->setValidatorClass(CityRequest::class)
                    ->addAfter('name', 'slug', 'text', [
                        'label'      => __('Slug'),
                        'label_attr' => ['class' => 'control-label required'],
                        'attr'       => [
                            'placeholder'  => __('Slug'),
                            'data-counter' => 120,
                        ],
                        'value'      => $data->slug,
                    ])
                    ->addAfter('country_id', 'is_featured', 'onOff', [
                        'label'         => trans('core/base::forms.is_featured'),
                        'label_attr'    => ['class' => 'control-label'],
                        'default_value' => false,
                        'value'         => $data->is_featured,
                    ])
                    ->addAfter('status', 'image', 'mediaImage', [
                        'label'      => trans('core/base::forms.image'),
                        'label_attr' => ['class' => 'control-label'],
                        'value'      => $data->image,
                    ]);
                break;
            case Facility::class:
            case Feature::class:

                $iconImage = null;
                if ($data->id) {
                    $iconImage = MetaBox::getMetaData($data, 'icon_image', true);
                }

                $form
                    ->withCustomFields()
                    ->addCustomField('themeIcon', ThemeIconField::class)
                    ->modify('icon', 'themeIcon', ['label' => __('Font Icon')], true)
                    ->addAfter('icon', 'icon_image', 'mediaImage', [
                        'value' => $iconImage,
                        'label' => __('Icon Image (It will replace Font Icon if it is present)'),
                    ]);
                break;
        }

        return $form;
    }

    add_action(BASE_ACTION_AFTER_CREATE_CONTENT, 'save_addition_city_fields', 230, 3);
    add_action(BASE_ACTION_AFTER_UPDATE_CONTENT, 'save_addition_city_fields', 231, 3);

    /**
     * @param string $type
     * @param Request $request
     * @param City $object
     * @throws \Illuminate\Contracts\Filesystem\FileNotFoundException
     */
    function save_addition_city_fields($type, $request, $object)
    {
        if (is_plugin_active('location') && in_array($type, [CITY_MODULE_SCREEN_NAME])) {
            $object->slug = create_city_slug($request->input('slug'), $object);
            $object->is_featured = $request->input('is_featured');
            $object->image = $request->input('image');
            $object->save();
        }
    }

    if (!function_exists('create_city_slug')) {
        /**
         * @param string $slug
         * @param City $city
         * @return int|string
         */
        function create_city_slug($slug, $city) {
            $slug = Str::slug($slug, '-', !SlugHelper::turnOffAutomaticUrlTranslationIntoLatin() ? 'en' : false);

            $index = 1;
            $baseSlug = $slug;

            while (app(CityInterface::class)->getModel()->where('slug', $slug)->where('id', '!=', $city->id)->count() > 0) {
                if ($slug == $baseSlug) {
                    $slug = $baseSlug . '-' . Str::slug($city->state->name, '-', !SlugHelper::turnOffAutomaticUrlTranslationIntoLatin() ? 'en' : false);
                } else {
                    $slug = $baseSlug . '-' . $index++;
                }
            }

            if (empty($slug)) {
                $slug = time();
            }

            return $slug;
        }
    }
}

/**
 * @param string $color
 * @param int $opacity
 * @return string
 */
function hex_to_rgba(string $color, $opacity = 1)
{
    [$r, $g, $b] = sscanf($color, "#%02x%02x%02x");
    return 'rgba(' . $r . ',' . $g . ',' . ($b === null ? 0 : $b) . ', ' . $opacity . ')';
}

/**
 * @param array $calc
 * @param int $minInput
 * @param int $maxInput
 * @param int $default
 * @return array
 */
function handle_min_max_input($calc, $minInput, $maxInput, $default)
{
    $minLabel = '';
    $maxLabel = '';
    $dropLabel = $default;
    if ($minInput || $maxInput) {
        foreach ($calc as $value) {
            if ($minInput >= $value['number'] && !$minLabel && $minInput) {
                $minLabel = str_replace('__value__', round($minInput / ($value['number'] ?: 1), 2), $value['label']);
            }
            if ($maxInput >= $value['number'] && !$maxLabel && $maxInput) {
                $maxLabel = str_replace('__value__', round($maxInput / ($value['number'] ?: 1), 2), $value['label']);
            }
        }
        if (!$minInput) {
            $dropLabel = '< ';
        }
        if ($maxInput) {
            if ($minInput) {
                $dropLabel = $minLabel . ' - ' . $maxLabel;
            } else {
                $dropLabel = $dropLabel . $maxLabel;
            }
        } else {
            $dropLabel = '> ' . $minLabel;
        }
    }

    return [$minLabel, $maxLabel, $dropLabel];
}

/**
 * @return Object
 */
function get_object_property_map()
{
    return (object)[
        'name'            => '__name__',
        'status_html'     => '__status_html__',
        'url'             => '__url__',
        'city_name'       => '__city_name__',
        'square_text'     => '__square_text__',
        'number_bedroom'  => '__number_bedroom__',
        'number_bathroom' => '__number_bathroom__',
        'image_thumb'     => '__image_thumb__',
        'price_html'      => '__price_html__',
    ];
}

app()->booted(function () {

    if (is_plugin_active('real-estate')) {
        $videoSupportModels = [Project::class, Property::class];
        add_action(BASE_ACTION_META_BOXES, function ($context, $object) use ($videoSupportModels) {
            if (in_array(get_class($object), $videoSupportModels) && $context == 'advanced') {
                MetaBox::addMetaBox('additional_property_fields', __('Addition Information'), function () {
                    $videoThumbnail = null;
                    $videoUrl = null;
                    $args = func_get_args();
                    if (!empty($args[0])) {
                        $videoThumbnail = $args[0]->video_thumbnail;
                        $videoUrl = $args[0]->video_url;
                    }

                    return Theme::partial('additional-property-fields', compact('videoThumbnail', 'videoUrl'));
                }, get_class($object), $context);
            }
        }, 28, 2);

        add_action(BASE_ACTION_AFTER_CREATE_CONTENT, function ($type, $request, $object) use ($videoSupportModels) {
            if (in_array(get_class($object), $videoSupportModels) && $request->has('video')) {
                $data = Arr::only((array)$request->input('video', []), ['url']);

                if ($request->hasFile('thumbnail_input')) {
                    $result = RvMedia::handleUpload($request->file('thumbnail_input'), 0, 'properties');
                    if ($result['error'] == false) {
                        $file = $result['data'];
                        $data['thumbnail'] = $file->url;
                    }
                }

                MetaBox::saveMetaBoxData($object, 'video', $data);
            }
        }, 280, 3);

        add_action(BASE_ACTION_AFTER_UPDATE_CONTENT, function ($type, $request, $object) use ($videoSupportModels) {
            if (in_array(get_class($object), $videoSupportModels) && $request->has('video')) {
                $data = Arr::only((array)$request->input('video', []), ['url']);

                if ($request->hasFile('thumbnail_input')) {
                    $result = RvMedia::handleUpload($request->file('thumbnail_input'), 0, 'properties');
                    if ($result['error'] == false) {
                        $file = $result['data'];
                        $data['thumbnail'] = $file->url;
                    }
                }

                MetaBox::saveMetaBoxData($object, 'video', $data);
            }
        }, 281, 3);

        // yes or no is okay
        add_action(BASE_ACTION_PUBLIC_RENDER_SINGLE, function ($screen, $object) use ($videoSupportModels) {
            if (in_array(get_class($object), $videoSupportModels)) {
                return $object->loadMissing(['meta_boxes']);
            }
        }, 56, 2);

        foreach ($videoSupportModels as $supportModel) {
            $supportModel::resolveRelationUsing('meta_boxes', function ($model) {
                return $model->morphMany(MetaBoxModel::class, 'reference')
                    ->select(['reference_id', 'meta_key', 'meta_value']);
            });

            MacroableModels::addMacro($supportModel, 'getVideoThumbnailAttribute', function () {
                /**
                 * @var BaseModel $this
                 */
                if ($this->meta_boxes) {
                    $fistMeta = $this->meta_boxes->firstWhere('meta_key', 'video');

                    if ($fistMeta) {
                        return Arr::get(Arr::first($fistMeta->meta_value), 'thumbnail');
                    }
                }

                return '';
            });

            MacroableModels::addMacro($supportModel, 'getVideoUrlAttribute', function () {
                /**
                 * @var BaseModel $this
                 */
                if ($this->meta_boxes) {
                    $fistMeta = $this->meta_boxes->firstWhere('meta_key', 'video');

                    if ($fistMeta) {

                        $url = Arr::get(Arr::first($fistMeta->meta_value), 'url');

                        if ($url) {
                            return Youtube::getYoutubeWatchURL($url);
                        }
                    }
                }

                return '';
            });
        }
    }
});

/**
 * @param Property $property
 * @return string
 */
function get_image_from_video_property(BaseModel $property)
{
    if ($property->video_thumbnail) {
        return RvMedia::getImageUrl($property->video_thumbnail);
    }

    $videoID = Youtube::getYoutubeVideoID($property->video_url);

    if ($videoID) {
        return 'https://img.youtube.com/vi/' . $videoID . '/hqdefault.jpg';
    }

    return RvMedia::getDefaultImage();
}

Form::component('themeIcon', Theme::getThemeNamespace() . '::partials.forms.fields.icons-field', [
    'name',
    'value'      => null,
    'attributes' => [],
]);

if (is_plugin_active('real-estate')) {
    add_action(BASE_ACTION_AFTER_CREATE_CONTENT, 'save_customize_form_fields', 230, 3);
    add_action(BASE_ACTION_AFTER_UPDATE_CONTENT, 'save_customize_form_fields', 230, 3);

    function save_customize_form_fields ($type, $request, $object) {
        if (in_array(get_class($object), [Facility::class, Feature::class]) && $request->has('icon_image')) {
            MetaBox::saveMetaBoxData($object, 'icon_image', $request->input('icon_image'));
        }
    }
}
