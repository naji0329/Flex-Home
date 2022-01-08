<?php

namespace Botble\Location\Http\Controllers;

use Botble\Base\Events\BeforeEditContentEvent;
use Botble\Location\Http\Requests\CountryRequest;
use Botble\Location\Http\Resources\CountryResource;
use Botble\Location\Repositories\Interfaces\CountryInterface;
use Botble\Base\Http\Controllers\BaseController;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Exception;
use Botble\Location\Tables\CountryTable;
use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Location\Forms\CountryForm;
use Botble\Base\Forms\FormBuilder;
use Illuminate\View\View;
use Throwable;

class CountryController extends BaseController
{
    /**
     * @var CountryInterface
     */
    protected $countryRepository;

    /**
     * CountryController constructor.
     * @param CountryInterface $countryRepository
     */
    public function __construct(CountryInterface $countryRepository)
    {
        $this->countryRepository = $countryRepository;
    }

    /**
     * @param CountryTable $dataTable
     * @return Factory|View
     * @throws Throwable
     */
    public function index(CountryTable $table)
    {

        page_title()->setTitle(trans('plugins/location::country.name'));

        return $table->renderTable();
    }

    /**
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function create(FormBuilder $formBuilder)
    {
        page_title()->setTitle(trans('plugins/location::country.create'));

        return $formBuilder->create(CountryForm::class)->renderForm();
    }

    /**
     * @param CountryRequest $request
     * @return BaseHttpResponse
     */
    public function store(CountryRequest $request, BaseHttpResponse $response)
    {
        $country = $this->countryRepository->createOrUpdate($request->input());

        event(new CreatedContentEvent(COUNTRY_MODULE_SCREEN_NAME, $request, $country));

        return $response
            ->setPreviousUrl(route('country.index'))
            ->setNextUrl(route('country.edit', $country->id))
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
        $country = $this->countryRepository->findOrFail($id);

        event(new BeforeEditContentEvent($request, $country));

        page_title()->setTitle(trans('plugins/location::country.edit') . ' "' . $country->name . '"');

        return $formBuilder->create(CountryForm::class, ['model' => $country])->renderForm();
    }

    /**
     * @param $id
     * @param CountryRequest $request
     * @return BaseHttpResponse
     */
    public function update($id, CountryRequest $request, BaseHttpResponse $response)
    {
        $country = $this->countryRepository->findOrFail($id);

        $country->fill($request->input());

        $this->countryRepository->createOrUpdate($country);

        event(new UpdatedContentEvent(COUNTRY_MODULE_SCREEN_NAME, $request, $country));

        return $response
            ->setPreviousUrl(route('country.index'))
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
            $country = $this->countryRepository->findOrFail($id);

            $this->countryRepository->delete($country);

            event(new DeletedContentEvent(COUNTRY_MODULE_SCREEN_NAME, $request, $country));

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
            $country = $this->countryRepository->findOrFail($id);
            $this->countryRepository->delete($country);
            event(new DeletedContentEvent(COUNTRY_MODULE_SCREEN_NAME, $request, $country));
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

        $data = $this->countryRepository->advancedGet([
            'condition' => [
                ['countries.name', 'LIKE', '%' . $keyword . '%'],
            ],
            'select'    => ['countries.id', 'countries.name'],
            'take'      => 10,

        ]);

        return $response->setData(CountryResource::collection($data));
    }
}
