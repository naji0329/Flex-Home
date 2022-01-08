<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card login-form">
                <div class="card-body">
                    <h4 class="text-center">{{ trans('plugins/real-estate::dashboard.login-title') }}</h4>
                    <br>
                    @include(Theme::getThemeNamespace() . '::views.real-estate.account.auth.includes.messages')
                    <br>
                    <form method="POST" action="{{ route('public.account.login') }}">
                        @csrf
                        <div class="form-group">
                            <input id="email" type="text"
                                   class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}"
                                   placeholder="{{ trans('plugins/real-estate::dashboard.email_or_username') }}"
                                   name="email" value="{{ old('email') }}" autofocus>
                            @if ($errors->has('email'))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('email') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group">
                            <input id="password" type="password"
                                   class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}"
                                   placeholder="{{ trans('plugins/real-estate::dashboard.password') }}" name="password">
                            @if ($errors->has('password'))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('password') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"
                                                   name="remember" {{ old('remember') ? 'checked' : '' }}> {{ trans('plugins/real-estate::dashboard.remember-me') }}
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-6 text-md-center">
                                    <a href="{{ route('public.account.password.request') }}">
                                        {{ trans('plugins/real-estate::dashboard.forgot-password-cta') }}
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-blue btn-full fw6">
                                {{ trans('plugins/real-estate::dashboard.login-cta') }}
                            </button>
                        </div>

                        <div class="form-group text-center">
                            <p>{{ __("Don't have an account?") }} <a href="{{ route('public.account.register') }}" class="d-block d-sm-inline-block text-sm-left text-center">{{ __('Register a new account') }}</a></p>
                        </div>

                        <div class="text-center">
                            {!! apply_filters(BASE_FILTER_AFTER_LOGIN_OR_REGISTER_FORM, null, \Botble\RealEstate\Models\Account::class) !!}
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
