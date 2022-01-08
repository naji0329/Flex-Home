<?php

namespace Botble\SocialLogin\Http\Controllers;

use Assets;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Setting\Supports\SettingStore;
use Botble\SocialLogin\Http\Requests\SocialLoginRequest;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use RvMedia;
use Socialite;
use SocialService;

class SocialLoginController extends BaseController
{

    /**
     * Redirect the user to the {provider} authentication page.
     *
     * @param string $provider
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return mixed
     */
    public function redirectToProvider($provider, Request $request, BaseHttpResponse $response)
    {
        $guard = $this->guard($request);

        if (!$guard) {
            return $response
                ->setError()
                ->setNextUrl(route('public.index'));
        }

        $this->setProvider($provider);

        session(['social_login_guard_current' => $guard]);

        return Socialite::driver($provider)->redirect();
    }

    /**
     *
     * @param Request|null $request
     * @return bool|string
     */
    protected function guard(Request $request = null)
    {
        if ($request) {
            $guard = $request->input('guard');
        } else {
            $guard = session('social_login_guard_current');
        }

        if (!$guard) {
            $guard = array_key_first(SocialService::supportedModules());
        }

        if (!$guard || !SocialService::isSupportedModuleByKey($guard) || Auth::guard($guard)->check()) {
            return false;
        }

        return $guard;
    }

    /**
     * @param string $provider
     */
    protected function setProvider(string $provider)
    {
        config()->set([
            'services.' . $provider => [
                'client_id'     => SocialService::setting($provider . '_app_id'),
                'client_secret' => SocialService::setting($provider . '_app_secret'),
                'redirect'      => route('auth.social.callback', $provider),
            ],
        ]);

        return true;
    }

    /**
     * Obtain the user information from {provider}.
     * @param string $provider
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function handleProviderCallback($provider, BaseHttpResponse $response)
    {
        $guard = $this->guard();

        if (!$guard) {
            return $response
                ->setError()
                ->setNextUrl(route('public.index'))
                ->setMessage(__('An error occurred while trying to login'));
        }

        $this->setProvider($provider);

        $providerData = Arr::get(SocialService::supportedModules(), $guard);

        try {
            /**
             * @var \Laravel\Socialite\AbstractUser $oAuth
             */
            $oAuth = Socialite::driver($provider)->user();
        } catch (Exception $ex) {
            $message = $ex->getMessage();

            if ($provider == 'github') {
                $message = json_encode($message);
            }

            if (!$message) {
                $message = __('An error occurred while trying to login');
            }

            return $response
                ->setError()
                ->setNextUrl($providerData['login_url'])
                ->setMessage($message);
        }

        if (!$oAuth->getEmail()) {
            return $response
                ->setError()
                ->setNextUrl($providerData['login_url'])
                ->setMessage(__('Cannot login, no email provided!'));
        }

        $account = (new $providerData['model'])->where('email', $oAuth->getEmail())->first();

        if (!$account) {
            $avatarId = null;

            try {
                $url = $oAuth->getAvatar();
                if ($url) {
                    $result = RvMedia::uploadFromUrl($url, 0, 'accounts', 'image/png');
                    if (!$result['error']) {
                        $avatarId = $result['data']->id;
                    }
                }
            } catch (Exception $exception) {
                info($exception->getMessage());
            }

            $data = [
                'name'      => $oAuth->getName() ?: $oAuth->getEmail(),
                'email'     => $oAuth->getEmail(),
                'password'  => bcrypt(Str::random(36)),
                'avatar_id' => $avatarId,
            ];

            $data = apply_filters('social_login_before_saving_account', $data, $oAuth, $providerData);

            $account = new $providerData['model'];
            $account->fill($data);
            $account->confirmed_at = now();
            $account->save();
        }

        Auth::guard($guard)->login($account, true);

        return $response
            ->setNextUrl($providerData['redirect_url'] ?: route('public.index'))
            ->setMessage(trans('core/acl::auth.login.success'));
    }

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function getSettings()
    {
        page_title()->setTitle(trans('plugins/social-login::social-login.settings.title'));

        Assets::addScriptsDirectly('vendor/core/plugins/social-login/js/social-login.js');

        return view('plugins/social-login::settings');
    }

    /**
     * @param SocialLoginRequest $request
     * @param BaseHttpResponse $response
     * @param SettingStore $setting
     * @return BaseHttpResponse
     */
    public function postSettings(SocialLoginRequest $request, BaseHttpResponse $response, SettingStore $setting)
    {
        $prefix = 'social_login_';

        $setting->set($prefix . 'enable', $request->input($prefix . 'enable'));

        foreach (SocialService::getProviders() as $provider => $item) {
            $prefix = 'social_login_' . $provider . '_';

            $setting->set($prefix . 'enable', $request->input($prefix . 'enable'));

            foreach ($item['data'] as $input) {
                if (!in_array(app()->environment(), SocialService::getEnvDisableData()) ||
                    !in_array($input, Arr::get($item, 'disable', []))
                ) {
                    $setting->set($prefix . $input, $request->input($prefix . $input));
                }
            }
        }

        $setting->save();

        return $response
            ->setPreviousUrl(route('social-login.settings'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }
}
