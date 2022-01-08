<?php

namespace Botble\AuditLog\Http\Controllers;

use Botble\AuditLog\Repositories\Interfaces\AuditLogInterface;
use Botble\AuditLog\Tables\AuditLogTable;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Base\Traits\HasDeleteManyItemsTrait;
use Exception;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Illuminate\View\View;
use Throwable;

class AuditLogController extends BaseController
{

    use HasDeleteManyItemsTrait;

    /**
     * @var AuditLogInterface
     */
    protected $auditLogRepository;

    /**
     * AuditLogController constructor.
     * @param AuditLogInterface $auditLogRepository
     */
    public function __construct(AuditLogInterface $auditLogRepository)
    {
        $this->auditLogRepository = $auditLogRepository;
    }

    /**
     * @param BaseHttpResponse $response
     * @param Request $request
     * @return BaseHttpResponse
     */
    public function getWidgetActivities(BaseHttpResponse $response, Request $request)
    {
        $limit = (int)$request->input('paginate', 10);
        $limit = $limit > 0 ? $limit : 10;

        $histories = $this->auditLogRepository
            ->advancedGet([
                'with'     => ['user'],
                'order_by' => ['created_at' => 'DESC'],
                'paginate' => [
                    'per_page'      => $limit,
                    'current_paged' => (int)$request->input('page', 1),
                ],
            ]);

        return $response
            ->setData(view('plugins/audit-log::widgets.activities', compact('histories', 'limit'))->render());
    }

    /**
     * @param AuditLogTable $dataTable
     * @return Factory|View
     * @throws Throwable
     */
    public function index(AuditLogTable $dataTable)
    {
        page_title()->setTitle(trans('plugins/audit-log::history.name'));

        return $dataTable->renderTable();
    }

    /**
     * @param Request $request
     * @param int $id
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function destroy(Request $request, $id, BaseHttpResponse $response)
    {
        try {
            $log = $this->auditLogRepository->findOrFail($id);
            $this->auditLogRepository->delete($log);

            event(new DeletedContentEvent(AUDIT_LOG_MODULE_SCREEN_NAME, $request, $log));

            return $response->setMessage(trans('core/base::notices.delete_success_message'));
        } catch (Exception $ex) {
            return $response
                ->setError()
                ->setMessage($ex->getMessage());
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
        return $this->executeDeleteItems($request, $response, $this->auditLogRepository, AUDIT_LOG_MODULE_SCREEN_NAME);
    }

    /**
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function deleteAll(BaseHttpResponse $response)
    {
        $this->auditLogRepository->getModel()->truncate();

        return $response->setMessage(trans('core/base::notices.delete_success_message'));
    }
}
