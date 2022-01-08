<?php

namespace Botble\RealEstate\Http\Controllers;

use Botble\Base\Events\BeforeEditContentEvent;
use Botble\RealEstate\Http\Requests\ConsultRequest;
use Botble\RealEstate\Repositories\Interfaces\ConsultInterface;
use Botble\Base\Http\Controllers\BaseController;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Exception;
use Botble\RealEstate\Tables\ConsultTable;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\RealEstate\Forms\ConsultForm;
use Botble\Base\Forms\FormBuilder;
use Illuminate\View\View;
use Throwable;

class ConsultController extends BaseController
{
    /**
     * @var ConsultInterface
     */
    protected $consultRepository;

    /**
     * ConsultController constructor.
     * @param ConsultInterface $consultRepository
     */
    public function __construct(ConsultInterface $consultRepository)
    {
        $this->consultRepository = $consultRepository;
    }

    /**
     * Display all consults
     * @param ConsultTable $dataTable
     * @return Factory|View
     * @throws Throwable
     */
    public function index(ConsultTable $table)
    {

        page_title()->setTitle(trans('plugins/real-estate::consult.name'));

        return $table->renderTable();
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
        $consult = $this->consultRepository->findOrFail($id, ['project', 'property']);

        event(new BeforeEditContentEvent($request, $consult));

        page_title()->setTitle(trans('plugins/real-estate::consult.edit') . ' "' . $consult->name . '"');

        return $formBuilder->create(ConsultForm::class, ['model' => $consult])->renderForm();
    }

    /**
     * @param $id
     * @param ConsultRequest $request
     * @return BaseHttpResponse
     */
    public function update($id, ConsultRequest $request, BaseHttpResponse $response)
    {
        $consult = $this->consultRepository->findOrFail($id);

        $consult->fill($request->input());

        $this->consultRepository->createOrUpdate($consult);

        event(new UpdatedContentEvent(CONSULT_MODULE_SCREEN_NAME, $request, $consult));

        return $response
            ->setPreviousUrl(route('consult.index'))
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
            $consult = $this->consultRepository->findOrFail($id);

            $this->consultRepository->delete($consult);

            event(new DeletedContentEvent(CONSULT_MODULE_SCREEN_NAME, $request, $consult));

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
            $consult = $this->consultRepository->findOrFail($id);
            $this->consultRepository->delete($consult);
            event(new DeletedContentEvent(CONSULT_MODULE_SCREEN_NAME, $request, $consult));
        }

        return $response->setMessage(trans('core/base::notices.delete_success_message'));
    }
}
