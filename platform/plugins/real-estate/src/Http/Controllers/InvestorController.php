<?php

namespace Botble\RealEstate\Http\Controllers;

use Botble\Base\Events\BeforeEditContentEvent;
use Botble\RealEstate\Http\Requests\InvestorRequest;
use Botble\RealEstate\Repositories\Interfaces\InvestorInterface;
use Botble\Base\Http\Controllers\BaseController;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Exception;
use Botble\RealEstate\Tables\InvestorTable;
use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\RealEstate\Forms\InvestorForm;
use Botble\Base\Forms\FormBuilder;
use Illuminate\View\View;
use Throwable;

class InvestorController extends BaseController
{
    /**
     * @var InvestorInterface
     */
    protected $investorRepository;

    /**
     * InvestorController constructor.
     * @param InvestorInterface $investorRepository
     */
    public function __construct(InvestorInterface $investorRepository)
    {
        $this->investorRepository = $investorRepository;
    }

    /**
     * Display all investors
     * @param InvestorTable $dataTable
     * @return Factory|View
     * @throws Throwable
     */
    public function index(InvestorTable $table)
    {

        page_title()->setTitle(trans('plugins/real-estate::investor.name'));

        return $table->renderTable();
    }

    /**
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function create(FormBuilder $formBuilder)
    {
        page_title()->setTitle(trans('plugins/real-estate::investor.create'));

        return $formBuilder->create(InvestorForm::class)->renderForm();
    }

    /**
     * Insert new Investor into database
     *
     * @param InvestorRequest $request
     * @return BaseHttpResponse
     */
    public function store(InvestorRequest $request, BaseHttpResponse $response)
    {
        $investor = $this->investorRepository->createOrUpdate($request->input());

        event(new CreatedContentEvent(INVESTOR_MODULE_SCREEN_NAME, $request, $investor));

        return $response
            ->setPreviousUrl(route('investor.index'))
            ->setNextUrl(route('investor.edit', $investor->id))
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
        $investor = $this->investorRepository->findOrFail($id);

        event(new BeforeEditContentEvent($request, $investor));

        page_title()->setTitle(trans('plugins/real-estate::investor.edit') . ' "' . $investor->name . '"');

        return $formBuilder->create(InvestorForm::class, ['model' => $investor])->renderForm();
    }

    /**
     * @param $id
     * @param InvestorRequest $request
     * @return BaseHttpResponse
     */
    public function update($id, InvestorRequest $request, BaseHttpResponse $response)
    {
        $investor = $this->investorRepository->findOrFail($id);

        $investor->fill($request->input());

        $this->investorRepository->createOrUpdate($investor);

        event(new UpdatedContentEvent(INVESTOR_MODULE_SCREEN_NAME, $request, $investor));

        return $response
            ->setPreviousUrl(route('investor.index'))
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
            $investor = $this->investorRepository->findOrFail($id);

            $this->investorRepository->delete($investor);

            event(new DeletedContentEvent(INVESTOR_MODULE_SCREEN_NAME, $request, $investor));

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
            $investor = $this->investorRepository->findOrFail($id);
            $this->investorRepository->delete($investor);
            event(new DeletedContentEvent(INVESTOR_MODULE_SCREEN_NAME, $request, $investor));
        }

        return $response->setMessage(trans('core/base::notices.delete_success_message'));
    }
}
