<?php

namespace Botble\Location\Http\Controllers;

use Botble\Base\Events\BeforeEditContentEvent;
use Botble\Location\Http\Requests\StateRequest;
use Botble\Location\Http\Resources\StateResource;
use Botble\Location\Repositories\Interfaces\StateInterface;
use Botble\Base\Http\Controllers\BaseController;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Exception;
use Botble\Location\Tables\StateTable;
use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Location\Forms\StateForm;
use Botble\Base\Forms\FormBuilder;
use Illuminate\View\View;
use Location;
use Throwable;

class StateController extends BaseController
{
    /**
     * @var StateInterface
     */
    protected $stateRepository;

    /**
     * StateController constructor.
     * @param StateInterface $stateRepository
     */
    public function __construct(StateInterface $stateRepository)
    {
        $this->stateRepository = $stateRepository;
    }

    /**
     * @param StateTable $dataTable
     * @return Factory|View
     * @throws Throwable
     */
    public function index(StateTable $table)
    {

        page_title()->setTitle(trans('plugins/location::state.name'));

        return $table->renderTable();
    }

    /**
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function create(FormBuilder $formBuilder)
    {
        page_title()->setTitle(trans('plugins/location::state.create'));

        return $formBuilder->create(StateForm::class)->renderForm();
    }

    /**
     * @param StateRequest $request
     * @return BaseHttpResponse
     */
    public function store(StateRequest $request, BaseHttpResponse $response)
    {
        $state = $this->stateRepository->createOrUpdate($request->input());

        event(new CreatedContentEvent(STATE_MODULE_SCREEN_NAME, $request, $state));

        return $response
            ->setPreviousUrl(route('state.index'))
            ->setNextUrl(route('state.edit', $state->id))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    /**
     * @param $id
     * @param Request $request
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function edit($id, FormBuilder $formBuilder, Request $request)
    {
        $state = $this->stateRepository->findOrFail($id);

        event(new BeforeEditContentEvent($request, $state));

        page_title()->setTitle(trans('plugins/location::state.edit') . ' "' . $state->name . '"');

        return $formBuilder->create(StateForm::class, ['model' => $state])->renderForm();
    }

    /**
     * @param $id
     * @param StateRequest $request
     * @return BaseHttpResponse
     */
    public function update($id, StateRequest $request, BaseHttpResponse $response)
    {
        $state = $this->stateRepository->findOrFail($id);

        $state->fill($request->input());

        $this->stateRepository->createOrUpdate($state);

        event(new UpdatedContentEvent(STATE_MODULE_SCREEN_NAME, $request, $state));

        return $response
            ->setPreviousUrl(route('state.index'))
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
            $state = $this->stateRepository->findOrFail($id);

            $this->stateRepository->delete($state);

            event(new DeletedContentEvent(STATE_MODULE_SCREEN_NAME, $request, $state));

            return $response->setMessage(trans('core/base::notices.delete_success_message'));
        } catch (Exception $exception) {
            return $response
                ->setError()
                ->setMessage($exception->getMessage());
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
            $state = $this->stateRepository->findOrFail($id);
            $this->stateRepository->delete($state);
            event(new DeletedContentEvent(STATE_MODULE_SCREEN_NAME, $request, $state));
        }

        return $response->setMessage(trans('core/base::notices.delete_success_message'));
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     */
    public function getList(Request $request, BaseHttpResponse $response)
    {
        $keyword = $request->input('q');

        if (!$keyword) {
            return $response->setData([]);
        }

        $data = $this->stateRepository->advancedGet([
            'condition' => [
                ['states.name', 'LIKE', '%' . $keyword . '%'],
            ],
            'select'    => ['states.id', 'states.name'],
            'take'      => 10,

        ]);

        return $response->setData(StateResource::collection($data));
    }
}
