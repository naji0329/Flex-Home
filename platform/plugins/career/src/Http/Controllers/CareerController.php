<?php

namespace Botble\Career\Http\Controllers;

use Botble\Base\Events\BeforeEditContentEvent;
use Botble\Career\Http\Requests\CareerRequest;
use Botble\Career\Repositories\Interfaces\CareerInterface;
use Botble\Base\Http\Controllers\BaseController;
use Illuminate\Http\Request;
use Exception;
use Botble\Career\Tables\CareerTable;
use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Career\Forms\CareerForm;
use Botble\Base\Forms\FormBuilder;

class CareerController extends BaseController
{
    /**
     * @var CareerInterface
     */
    protected $careerRepository;

    /**
     * CareerController constructor.
     * @param CareerInterface $careerRepository
     */
    public function __construct(CareerInterface $careerRepository)
    {
        $this->careerRepository = $careerRepository;
    }

    /**
     * Display all careers
     * @param CareerTable $dataTable
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     * @throws \Throwable
     */
    public function index(CareerTable $table)
    {

        page_title()->setTitle(trans('plugins/career::career.name'));

        return $table->renderTable();
    }

    /**
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function create(FormBuilder $formBuilder)
    {
        page_title()->setTitle(trans('plugins/career::career.create'));

        return $formBuilder->create(CareerForm::class)->renderForm();
    }

    /**
     * Insert new Career into database
     *
     * @param CareerRequest $request
     * @return BaseHttpResponse
     */
    public function store(CareerRequest $request, BaseHttpResponse $response)
    {
        $career = $this->careerRepository->createOrUpdate($request->input());

        event(new CreatedContentEvent(CAREER_MODULE_SCREEN_NAME, $request, $career));

        return $response
            ->setPreviousUrl(route('career.index'))
            ->setNextUrl(route('career.edit', $career->id))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    /**
     * Show edit form
     *
     * @param $id
     * @param Request $request
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function edit($id, FormBuilder $formBuilder, Request $request)
    {
        $career = $this->careerRepository->findOrFail($id);

        event(new BeforeEditContentEvent($request, $career));

        page_title()->setTitle(trans('plugins/career::career.edit') . ' "' . $career->name . '"');

        return $formBuilder->create(CareerForm::class, ['model' => $career])->renderForm();
    }

    /**
     * @param $id
     * @param CareerRequest $request
     * @return BaseHttpResponse
     */
    public function update($id, CareerRequest $request, BaseHttpResponse $response)
    {
        $career = $this->careerRepository->findOrFail($id);

        $career->fill($request->input());

        $this->careerRepository->createOrUpdate($career);

        event(new UpdatedContentEvent(CAREER_MODULE_SCREEN_NAME, $request, $career));

        return $response
            ->setPreviousUrl(route('career.index'))
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
            $career = $this->careerRepository->findOrFail($id);

            $this->careerRepository->delete($career);

            event(new DeletedContentEvent(CAREER_MODULE_SCREEN_NAME, $request, $career));

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
            $career = $this->careerRepository->findOrFail($id);
            $this->careerRepository->delete($career);
            event(new DeletedContentEvent(CAREER_MODULE_SCREEN_NAME, $request, $career));
        }

        return $response->setMessage(trans('core/base::notices.delete_success_message'));
    }
}
