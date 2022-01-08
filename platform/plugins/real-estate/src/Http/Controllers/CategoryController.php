<?php

namespace Botble\RealEstate\Http\Controllers;

use Assets;
use Botble\Base\Events\BeforeEditContentEvent;
use Botble\RealEstate\Http\Requests\CategoryRequest;
use Botble\RealEstate\Repositories\Interfaces\CategoryInterface;
use Botble\Base\Http\Controllers\BaseController;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Exception;
use Botble\RealEstate\Tables\CategoryTable;
use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\RealEstate\Forms\CategoryForm;
use Botble\Base\Forms\FormBuilder;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;
use Throwable;

class CategoryController extends BaseController
{
    /**
     * @var CategoryInterface
     */
    protected $categoryRepository;

    /**
     * CategoryController constructor.
     * @param CategoryInterface $categoryRepository
     */
    public function __construct(CategoryInterface $categoryRepository)
    {
        $this->categoryRepository = $categoryRepository;
    }

    /**
     * @param FormBuilder $formBuilder
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse|Factory|View|string
     * @throws Throwable
     */
    public function index(FormBuilder $formBuilder, Request $request, BaseHttpResponse $response)
    {
        page_title()->setTitle(trans('plugins/real-estate::category.name'));

        $categories = $this->categoryRepository->getCategories(['*'], [
            'created_at' => 'DESC',
            'is_default' => 'DESC',
            'order'      => 'ASC',
        ]);

        $categories->loadMissing('slugable')->loadCount(['properties', 'projects']);

        if ($request->ajax()) {
            $data = view('core/base::forms.partials.tree-categories', $this->getOptions(compact('categories')))->render();

            return $response->setData($data);
        }

        Assets::addStylesDirectly(['vendor/core/core/base/css/tree-category.css'])
            ->addScriptsDirectly(['vendor/core/core/base/js/tree-category.js']);

        $form = $formBuilder->create(CategoryForm::class, ['template' => 'core/base::forms.form-tree-category']);
        $form = $this->setFormOptions($form, null, compact('categories'));

        return $form->renderForm();
    }

    /**
     * @param FormBuilder $formBuilder
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return string
     */
    public function create(FormBuilder $formBuilder, Request $request, BaseHttpResponse $response)
    {
        page_title()->setTitle(trans('plugins/real-estate::category.create'));

        if ($request->ajax()) {
            return $response->setData($this->getForm());
        }

        return $formBuilder->create(CategoryForm::class)->renderForm();
    }

    /**
     * Insert new Category into database
     *
     * @param CategoryRequest $request
     * @return BaseHttpResponse
     */
    public function store(CategoryRequest $request, BaseHttpResponse $response)
    {
        if ($request->input('is_default')) {
            $this->categoryRepository->getModel()->where('id', '>', 0)->update(['is_default' => 0]);
        }

        $category = $this->categoryRepository->createOrUpdate($request->input());

        event(new CreatedContentEvent(PROPERTY_CATEGORY_MODULE_SCREEN_NAME, $request, $category));

        if ($request->ajax()) {
            $category = $this->categoryRepository->findOrFail($category->id);

            if ($request->input('submit') == 'save') {
                $form = $this->getForm();
            } else {
                $form = $this->getForm($category);
            }

            $response->setData([
                'model' => $category,
                'form'  => $form
            ]);
        }

        return $response
            ->setPreviousUrl(route('property_category.index'))
            ->setNextUrl(route('property_category.edit', $category->id))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    /**
     * Show edit form
     *
     * @param $id
     * @param Request $request
     * @param FormBuilder $formBuilder
     * @param BaseHttpResponse $response
     * @return string
     */
    public function edit($id, FormBuilder $formBuilder, Request $request, BaseHttpResponse $response)
    {
        $category = $this->categoryRepository->findOrFail($id);

        event(new BeforeEditContentEvent($request, $category));

        if ($request->ajax()) {
            return $response->setData($this->getForm($category));
        }

        page_title()->setTitle(trans('plugins/real-estate::category.edit') . ' "' . $category->name . '"');

        return $formBuilder->create(CategoryForm::class, ['model' => $category])->renderForm();
    }

    /**
     * @param $id
     * @param CategoryRequest $request
     * @return BaseHttpResponse
     */
    public function update($id, CategoryRequest $request, BaseHttpResponse $response)
    {
        $category = $this->categoryRepository->findOrFail($id);

        if ($request->input('is_default')) {
            $this->categoryRepository->getModel()->where('id', '!=', $id)->update(['is_default' => 0]);
        }

        $category->fill($request->input());

        $this->categoryRepository->createOrUpdate($category);

        event(new UpdatedContentEvent(PROPERTY_CATEGORY_MODULE_SCREEN_NAME, $request, $category));

        if ($request->ajax()) {
            $category = $this->categoryRepository->findOrFail($id);

            if ($request->input('submit') == 'save') {
                $form = $this->getForm();
            } else {
                $form = $this->getForm($category);
            }
            $response->setData([
                'model' => $category,
                'form'  => $form
            ]);
        }


        return $response
            ->setPreviousUrl(route('property_category.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    /**
     * @param $id
     * @param Request $request
     * @return BaseHttpResponse
     */
    public function destroy(Request $request, $id, BaseHttpResponse $response)
    {
        try {
            $category = $this->categoryRepository->findOrFail($id);

            $this->categoryRepository->delete($category);

            event(new DeletedContentEvent(PROPERTY_CATEGORY_MODULE_SCREEN_NAME, $request, $category));

            return $response->setMessage(trans('core/base::notices.delete_success_message'));
        } catch (Exception $exception) {
            return $response
                ->setError()
                ->setMessage(trans('core/base::notices.cannot_delete'));
        }
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     * @throws Exception
     */
    public function deletes(Request $request, BaseHttpResponse $response)
    {
        $ids = $request->input('ids');
        if (empty($ids)) {
            return $response
                ->setError()
                ->setMessage(trans('core/base::notices.no_select'));
        }

        foreach ($ids as $id) {
            $category = $this->categoryRepository->findOrFail($id);
            $this->categoryRepository->delete($category);
            event(new DeletedContentEvent(PROPERTY_CATEGORY_MODULE_SCREEN_NAME, $request, $category));
        }

        return $response->setMessage(trans('core/base::notices.delete_success_message'));
    }

    /**
     * @param CategoryForm|null $model
     * @return string
     */
    protected function getForm($model = null)
    {
        $options = ['template' => 'core/base::forms.form-no-wrap'];

        if ($model) {
            $options['model'] = $model;
        }

        $form = app(FormBuilder::class)->create(CategoryForm::class, $options);

        $form = $this->setFormOptions($form, $model);

        return $form->renderForm();
    }

    /**
     * @param FormAbstract $form
     * @param Category|null $model
     * @param array $options
     * @return FormAbstract
     */
    protected function setFormOptions($form, $model = null, $options = [])
    {
        if (!$model) {
            $form->setUrl(route('property_category.create'));
        }

        if (!Auth::user()->hasPermission('property_category.create') && !$model) {
            $class = $form->getFormOption('class');
            $form->setFormOption('class', $class . ' d-none');
        }

        $form->setFormOptions($this->getOptions($options));

        return $form;
    }

    /**
     * @param array $options
     * @return array
     */
    protected function getOptions($options = [])
    {
        return array_merge([
            'canCreate'   => Auth::user()->hasPermission('property_category.create'),
            'canEdit'     => Auth::user()->hasPermission('property_category.edit'),
            'canDelete'   => Auth::user()->hasPermission('property_category.destroy'),
            'createRoute' => 'property_category.create',
            'editRoute'   => 'property_category.edit',
            'deleteRoute' => 'property_category.destroy',
        ], $options);
    }
}
