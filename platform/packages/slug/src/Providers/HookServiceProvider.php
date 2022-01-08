<?php

namespace Botble\Slug\Providers;

use Assets;
use Botble\Base\Forms\FormAbstract;
use Botble\Base\Models\BaseModel;
use Botble\Slug\Forms\Fields\PermalinkField;
use Eloquent;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Query\Builder;
use Illuminate\Database\Query\JoinClause;
use Illuminate\Support\ServiceProvider;
use Kris\LaravelFormBuilder\FormHelper;
use SlugHelper;

class HookServiceProvider extends ServiceProvider
{
    public function boot()
    {
        add_filter(BASE_FILTER_SLUG_AREA, [$this, 'addSlugBox'], 17, 2);

        add_filter(BASE_FILTER_BEFORE_GET_FRONT_PAGE_ITEM, [$this, 'getItemSlug'], 3, 2);

        add_filter('form_custom_fields', [$this, 'addCustomFormFields'], 29, 2);
    }

    /**
     * @param string $html
     * @param BaseModel $object
     * @return null|string
     */
    public function addSlugBox($html = null, $object = null)
    {
        if ($object && SlugHelper::isSupportedModel(get_class($object))) {

            Assets::addScriptsDirectly('vendor/core/packages/slug/js/slug.js')
                ->addStylesDirectly('vendor/core/packages/slug/css/slug.css');

            $prefix = SlugHelper::getPrefix(get_class($object));

            return $html . view('packages/slug::partials.slug', compact('object', 'prefix'))->render();
        }

        return $html;
    }

    /**
     * @param Builder $data
     * @param Model $model
     * @return mixed
     */
    public function getItemSlug($data, $model)
    {
        if ($data && SlugHelper::isSupportedModel(get_class($data))) {
            $table = $model->getTable();
            $select = [$table . '.*'];
            /**
             * @var Eloquent $data
             */
            $rawBindings = $data->getRawBindings();
            /**
             * @var Eloquent $rawBindings
             */
            $query = $rawBindings->getQuery();
            if ($query instanceof Builder) {
                $querySelect = $data->getQuery()->columns;
                if (!empty($querySelect)) {
                    $select = $querySelect;
                }
            }

            foreach ($select as &$column) {
                if (strpos($column, '.') === false) {
                    $column = $table . '.' . $column;
                }
            }

            $select = array_merge($select, ['slugs.key']);

            return $data
                ->leftJoin('slugs', function (JoinClause $join) use ($table) {
                    $join->on('slugs.reference_id', '=', $table . '.id');
                })
                ->select($select)
                ->where('slugs.reference_type', get_class($model));
        }

        return $data;
    }

    /**
     * @param FormAbstract $form
     * @param FormHelper $formHelper
     * @return FormAbstract
     */
    public function addCustomFormFields(FormAbstract $form, FormHelper $formHelper)
    {
        if (!$formHelper->hasCustomField('permalink') && SlugHelper::supportedModels()) {
            $form->addCustomField('permalink', PermalinkField::class);
        }

        return $form;
    }
}
