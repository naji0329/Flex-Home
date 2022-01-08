<?php

namespace Botble\Location\Http\Controllers;

use Assets;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Location\Exports\TemplateLocationExport;
use Botble\Location\Http\Requests\BulkImportRequest;
use Botble\Location\Http\Requests\LocationImportRequest;
use Botble\Location\Imports\LocationImport;
use Botble\Location\Imports\ValidateLocationImport;
use DOMDocument;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Illuminate\View\View;
use Maatwebsite\Excel\Excel;
use Throwable;

class BulkImportController extends BaseController
{
    /**
     * @var LocationImport
     */
    protected $locationImport;

    /**
     * @var LocationImport
     */
    protected $validateLocationImport;

    /**
     * BulkImportController constructor.
     * @param LocationImport $locationImport
     */
    public function __construct(LocationImport $locationImport, ValidateLocationImport $validateLocationImport)
    {
        $this->locationImport = $locationImport;
        $this->validateLocationImport = $validateLocationImport;
    }

    /**
     * @return Factory|View
     */
    public function index()
    {
        page_title()->setTitle(trans('plugins/location::bulk-import.name'));

        Assets::addScriptsDirectly(['vendor/core/plugins/location/js/bulk-import.js']);

        return view('plugins/location::bulk-import.index');
    }

    /**
     * @param BulkImportRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function postImport(BulkImportRequest $request, BaseHttpResponse $response)
    {
        @ini_set('max_execution_time', -1);
        @ini_set('memory_limit', -1);

        $file = $request->file('file');

        $this->validateLocationImport
            ->setValidatorClass(new LocationImportRequest)
            ->setImportType($request->input('type'))
            ->import($file);

        if ($this->validateLocationImport->failures()->count()) {
            $data = [
                'total_failed'  => $this->validateLocationImport->failures()->count(),
                'total_error'   => $this->validateLocationImport->errors()->count(),
                'failures'      => $this->validateLocationImport->failures(),
            ];

            $message = trans('plugins/location::bulk-import.import_failed_description');

            return $response
                ->setError()
                ->setData($data)
                ->setMessage($message);
        }

        $this->locationImport
            ->setValidatorClass(new LocationImportRequest)
            ->setImportType($request->input('type'))
            ->import($file);

        $data = [
            'total_success' => $this->locationImport->successes()->count(),
            'total_failed'  => $this->locationImport->failures()->count(),
            'total_error'   => $this->locationImport->errors()->count(),
            'failures'      => $this->locationImport->failures(),
            'successes'     => $this->locationImport->successes(),
        ];

        $message = trans('plugins/location::bulk-import.imported_successfully');

        $result = trans('plugins/location::bulk-import.results', [
            'success' => $data['total_success'],
            'failed'  => $data['total_failed'],
        ]);

        return $response->setData($data)->setMessage($message . ' ' . $result);
    }

    /**
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\BinaryFileResponse
     */
    public function downloadTemplate(Request $request)
    {
        $extension = $request->input('extension');
        $extension = $extension == 'csv' ? $extension : Excel::XLSX;

        return (new TemplateLocationExport($extension))->download('template_locations_import.' . $extension);
    }
}
