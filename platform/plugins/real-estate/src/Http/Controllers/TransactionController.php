<?php

namespace Botble\RealEstate\Http\Controllers;

use Auth;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\RealEstate\Enums\TransactionTypeEnum;
use Botble\RealEstate\Http\Requests\CreateTransactionRequest;
use Botble\RealEstate\Repositories\Interfaces\AccountInterface;
use Botble\RealEstate\Repositories\Interfaces\TransactionInterface;
use RealEstateHelper;

class TransactionController extends BaseController
{
    /**
     * @var TransactionInterface
     */
    protected $transactionRepository;

    /**
     * @var AccountInterface
     */
    protected $accountRepository;

    /**
     * TransactionController constructor.
     * @param TransactionInterface $transactionRepository
     * @param AccountInterface $accountRepository
     */
    public function __construct(TransactionInterface $transactionRepository, AccountInterface $accountRepository)
    {
        $this->transactionRepository = $transactionRepository;
        $this->accountRepository = $accountRepository;
    }

    /**
     * Insert new Transaction into database
     *
     * @param $id
     * @param CreateTransactionRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function postCreate($id, CreateTransactionRequest $request, BaseHttpResponse $response)
    {
        if (!RealEstateHelper::isEnabledCreditsSystem()) {
            abort(404);
        }

        $account = $this->accountRepository->findOrFail($id);

        $request->merge([
            'user_id'    => Auth::user()->getKey(),
            'account_id' => $id,
        ]);

        $this->transactionRepository->createOrUpdate($request->input());

        if ($request->input('type') == TransactionTypeEnum::ADD) {
            $account->credits += $request->input('credits');
        } elseif ($request->input('type') == TransactionTypeEnum::REMOVE) {
            $credits = $account->credits - $request->input('credits');
            $account->credits = $credits > 0 ? $credits : 0;
        }

        $this->accountRepository->createOrUpdate($account);

        return $response
            ->setMessage(trans('core/base::notices.create_success_message'));
    }
}
