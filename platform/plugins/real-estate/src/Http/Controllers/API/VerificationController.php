<?php

namespace Botble\RealEstate\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\RealEstate\Http\Requests\API\ResendEmailVerificationRequest;
use Botble\RealEstate\Http\Requests\API\VerifyEmailRequest;
use Botble\RealEstate\Notifications\ConfirmEmailNotification;
use Botble\RealEstate\Repositories\Interfaces\AccountInterface;
use Hash;
use Illuminate\Auth\Events\Verified;
use Illuminate\Support\Str;
use RealEstateHelper;

class VerificationController extends Controller
{
    /**
     * @var AccountInterface
     */
    protected $accountRepository;

    /**
     * AuthenticationController constructor.
     *
     * @param AccountInterface $accountRepository
     */
    public function __construct(AccountInterface $accountRepository)
    {
        $this->accountRepository = $accountRepository;
    }

    /**
     * Verify email
     *
     * Mark the authenticated user's email address as verified.
     *
     * @bodyParam email string required The email of the user.
     * @bodyParam token string required The token to verify user's email.
     *
     * @group Authentication
     *
     * @param VerifyEmailRequest $request
     * @param BaseHttpResponse $response
     *
     * @return BaseHttpResponse
     */
    public function verify(VerifyEmailRequest $request, BaseHttpResponse $response)
    {
        if (!RealEstateHelper::isRegisterEnabled()) {
            abort(404);
        }

        $account = $this
            ->accountRepository
            ->getFirstBy([
                'email' => $request->input('email'),
            ]);

        if (!$account) {
            return $response
                ->setError()
                ->setMessage(__('User not found!'))
                ->setCode(404);
        }

        if (!Hash::check($request->input('token'), $account->email_verify_token)) {
            return $response
                ->setError()
                ->setMessage(__('Token is invalid or expired!'));
        }

        if (!$account->markEmailAsVerified()) {
            return $response
                ->setError()
                ->setMessage(__('Has error when verify email!'));
        }

        event(new Verified($account));

        $account->email_verify_token = null;
        $this->accountRepository->createOrUpdate($account);

        return $response
            ->setMessage(__('Verify email successfully!'));
    }

    /**
     * Resend email verification
     *
     * Resend the email verification notification.
     *
     * @bodyParam email string required The email of the user.
     *
     * @group Authentication
     *
     * @param ResendEmailVerificationRequest $request
     * @param BaseHttpResponse $response
     *
     * @return BaseHttpResponse
     */
    public function resend(ResendEmailVerificationRequest $request, BaseHttpResponse $response)
    {
        if (!RealEstateHelper::isRegisterEnabled()) {
            abort(404);
        }

        $account = $this
            ->accountRepository
            ->getFirstBy([
                'email' => $request->input('email'),
            ]);

        if (!$account) {
            return $response
                ->setError()
                ->setMessage(__('User not found!'))
                ->setCode(404);
        }

        if ($account->hasVerifiedEmail()) {
            return $response
                ->setError()
                ->setMessage(__('This user has verified email'));
        }

        $token = Hash::make(Str::random(32));

        $account->email_verify_token = $token;
        $account->save();

        $account->notify(new ConfirmEmailNotification($token));

        return $response
            ->setMessage(__('Resend email verification successfully!'));
    }
}
