<?php

namespace Botble\RealEstate\Http\Controllers;

use App\Http\Controllers\Controller;
use BaseHelper;
use Botble\ACL\Traits\RegistersUsers;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\RealEstate\Models\Account;
use Botble\RealEstate\Repositories\Interfaces\AccountInterface;
use EmailHandler;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use RealEstateHelper;
use SeoHelper;
use Theme;
use URL;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default, this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after login / registration.
     *
     * @var string
     */
    protected $redirectTo = null;

    /**
     * @var AccountInterface
     */
    protected $accountRepository;

    /**
     * Create a new controller instance.
     *
     * @param AccountInterface $accountRepository
     */
    public function __construct(AccountInterface $accountRepository)
    {
        $this->accountRepository = $accountRepository;
        $this->redirectTo = route('public.account.register');
    }

    /**
     * Show the application registration form.
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View|\Response
     * @throws \Illuminate\Contracts\Filesystem\FileNotFoundException
     */
    public function showRegistrationForm()
    {
        if (!RealEstateHelper::isRegisterEnabled()) {
            abort(404);
        }

        SeoHelper::setTitle(__('Register'));

        if (view()->exists(Theme::getThemeNamespace() . '::views.real-estate.account.auth.register')) {
            return Theme::scope('real-estate.account.auth.register')->render();
        }

        return view('plugins/real-estate::account.auth.register');
    }

    /**
     * Confirm a user with a given confirmation code.
     *
     * @param int $id
     * @param Request $request
     * @param BaseHttpResponse $response
     * @param AccountInterface $accountRepository
     * @return BaseHttpResponse
     */
    public function confirm($id, Request $request, BaseHttpResponse $response, AccountInterface $accountRepository)
    {
        if (!RealEstateHelper::isRegisterEnabled()) {
            abort(404);
        }

        if (!URL::hasValidSignature($request)) {
            abort(404);
        }

        $account = $accountRepository->findOrFail($id);

        $account->confirmed_at = now();
        $this->accountRepository->createOrUpdate($account);

        $this->guard()->login($account);

        return $response
            ->setNextUrl(route('public.account.dashboard'))
            ->setMessage(__('You successfully confirmed your email address.'));
    }

    /**
     * Get the guard to be used during registration.
     *
     * @return \Illuminate\Contracts\Auth\StatefulGuard
     */
    protected function guard()
    {
        return auth('account');
    }

    /**
     * Resend a confirmation code to a user.
     *
     * @param \Illuminate\Http\Request $request
     * @param AccountInterface $accountRepository
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function resendConfirmation(
        Request $request,
        AccountInterface $accountRepository,
        BaseHttpResponse $response
    ) {
        if (!RealEstateHelper::isRegisterEnabled()) {
            abort(404);
        }

        $account = $accountRepository->getFirstBy(['email' => $request->input('email')]);
        if (!$account) {
            return $response
                ->setError()
                ->setMessage(__('Cannot find this account!'));
        }

        $this->sendConfirmationToUser($account);

        return $response
            ->setMessage(__('We sent you another confirmation email. You should receive it shortly.'));
    }

    /**
     * Send the confirmation code to a user.
     *
     * @param Account $account
     */
    protected function sendConfirmationToUser($account)
    {
        // Notify the user
        $notificationConfig = config('plugins.real-estate.real-estate.notification');
        if ($notificationConfig) {
            $notification = app($notificationConfig);
            $account->notify($notification);
        }
    }

    /**
     * Handle a registration request for the application.
     *
     * @param \Illuminate\Http\Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function register(Request $request, BaseHttpResponse $response)
    {
        if (!RealEstateHelper::isRegisterEnabled()) {
            abort(404);
        }

        $this->validator($request->input())->validate();

        event(new Registered($account = $this->create($request->input())));

        EmailHandler::setModule(REAL_ESTATE_MODULE_SCREEN_NAME)
            ->setVariableValues([
                'account_name'  => $account->name,
                'account_email' => $account->email,
            ])
            ->sendUsingTemplate('account-registered');

        if (setting('verify_account_email', config('plugins.real-estate.real-estate.verify_email'))) {
            $this->sendConfirmationToUser($account);
            return $this->registered($request, $account)
                ?: $response->setNextUrl($this->redirectPath())
                    ->setMessage(__('Please confirm your email address.'));
        }

        $account->confirmed_at = now();
        $this->accountRepository->createOrUpdate($account);
        $this->guard()->login($account);

        return $response->setNextUrl($this->redirectPath())->setMessage(__('Registered successfully!'));
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param array $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        $rules = [
            'first_name' => 'required|max:120',
            'last_name'  => 'required|max:120',
            'username'   => 'required|max:60|min:2|unique:re_accounts,username',
            'email'      => 'required|email|max:255|unique:re_accounts',
            'password'   => 'required|min:6|confirmed',
            'phone'      => 'required|' . BaseHelper::getPhoneValidationRule(),
        ];

        if (is_plugin_active('captcha') && setting('enable_captcha') && setting('real_estate_enable_recaptcha_in_register_page',
                0)) {
            $rules += ['g-recaptcha-response' => 'required|captcha'];
        }

        return Validator::make($data, $rules, [
            'g-recaptcha-response.required' => __('Captcha Verification Failed!'),
            'g-recaptcha-response.captcha'  => __('Captcha Verification Failed!'),
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param array $data
     * @return Account
     */
    protected function create(array $data)
    {
        return $this->accountRepository->create([
            'first_name' => $data['first_name'],
            'last_name'  => $data['last_name'],
            'username'   => $data['username'],
            'email'      => $data['email'],
            'phone'      => $data['phone'],
            'password'   => bcrypt($data['password']),
        ]);
    }

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function getVerify()
    {
        if (!RealEstateHelper::isRegisterEnabled()) {
            abort(404);
        }

        return view('plugins/real-estate::account.auth.verify');
    }
}
