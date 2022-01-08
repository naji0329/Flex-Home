<?php

namespace Botble\RealEstate\Http\Controllers;

use Botble\Base\Events\BeforeEditContentEvent;
use Botble\RealEstate\Http\Requests\FacilityRequest;
use Botble\RealEstate\Repositories\Interfaces\FacilityInterface;
use Botble\Base\Http\Controllers\BaseController;
use Illuminate\Http\Request;
use Exception;
use Botble\RealEstate\Tables\FacilityTable;
use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\RealEstate\Forms\FacilityForm;
use Botble\Base\Forms\FormBuilder;

class FacilityController extends BaseController
{
    /**
     * @var FacilityInterface
     */
    protected $facilityRepository;

    /**
     * @param FacilityInterface $facilityRepository
     */
    public function __construct(FacilityInterface $facilityRepository)
    {
        $this->facilityRepository = $facilityRepository;
    }

    /**
     * @param FacilityTable $table
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     * @throws \Throwable
     */
    public function index(FacilityTable $table)
    {
        page_title()->setTitle(trans('plugins/real-estate::facility.name'));

        return $table->renderTable();
    }

    /**
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function create(FormBuilder $formBuilder)
    {
        page_title()->setTitle(trans('plugins/real-estate::facility.create'));

        return $formBuilder->create(FacilityForm::class)->renderForm();
    }

    /**
     * @param FacilityRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function store(FacilityRequest $request, BaseHttpResponse $response)
    {
        $facility = $this->facilityRepository->createOrUpdate($request->input());

        event(new CreatedContentEvent(FACILITY_MODULE_SCREEN_NAME, $request, $facility));

        return $response
            ->setPreviousUrl(route('facility.index'))
            ->setNextUrl(route('facility.edit', $facility->id))
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
        $facility = $this->facilityRepository->findOrFail($id);

        event(new BeforeEditContentEvent($request, $facility));

        page_title()->setTitle(trans('plugins/real-estate::facility.edit') . ' "' . $facility->name . '"');

        return $formBuilder->create(FacilityForm::class, ['model' => $facility])->renderForm();
    }

    /**
     * @param $id
     * @param FacilityRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function update($id, FacilityRequest $request, BaseHttpResponse $response)
    {
        $facility = $this->facilityRepository->findOrFail($id);

        $facility->fill($request->input());

        $this->facilityRepository->createOrUpdate($facility);

        event(new UpdatedContentEvent(FACILITY_MODULE_SCREEN_NAME, $request, $facility));

        return $response
            ->setPreviousUrl(route('facility.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    /**
     * @param $id
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function destroy(Request $request, $id, BaseHttpResponse $response)
    {
        try {
            $facility = $this->facilityRepository->findOrFail($id);

            $this->facilityRepository->delete($facility);

            event(new DeletedContentEvent(FACILITY_MODULE_SCREEN_NAME, $request, $facility));

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
            $facility = $this->facilityRepository->findOrFail($id);
            $this->facilityRepository->delete($facility);
            event(new DeletedContentEvent(FACILITY_MODULE_SCREEN_NAME, $request, $facility));
        }

        return $response->setMessage(trans('core/base::notices.delete_success_message'));
    }
}
