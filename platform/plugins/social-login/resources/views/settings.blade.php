@extends(BaseHelper::getAdminMasterLayoutTemplate())
@section('content')
    {!! Form::open(['route' => ['social-login.settings']]) !!}
    <div class="max-width-1200">
        <div class="flexbox-annotated-section">

            <div class="flexbox-annotated-section-annotation">
                <div class="annotated-section-title pd-all-20">
                    <h2>{{ trans('plugins/social-login::social-login.settings.title') }}</h2>
                </div>
                <div class="annotated-section-description pd-all-20 p-none-t">
                    <p class="color-note">{{ trans('plugins/social-login::social-login.settings.description') }}</p>
                </div>
            </div>

            <div class="flexbox-annotated-section-content">
                <div class="wrapper-content pd-all-20">
                    <div class="form-group mb-0">
                        <input type="hidden" name="social_login_enable" value="0">
                        <label>
                            <input type="checkbox" class="hrv-checkbox" value="1"
                                   @if (setting('social_login_enable')) checked @endif name="social_login_enable" id="social_login_enable">
                            {{ trans('plugins/social-login::social-login.settings.enable') }}
                        </label>
                    </div>

                </div>
            </div>
        </div>
        <div class="wrapper-list-social-login-options" @if (!SocialService::setting('enable')) style="display:none;" @endif>
            @foreach (SocialService::getProviders() as $provider => $item)
                <div class="flexbox-annotated-section">

                    <div class="flexbox-annotated-section-annotation">
                        <div class="annotated-section-title pd-all-20">
                            <h2>{{ trans('plugins/social-login::social-login.settings.' . $provider . '.title') }}</h2>
                        </div>
                        <div class="annotated-section-description pd-all-20 p-none-t">
                            <p class="color-note">{{ trans('plugins/social-login::social-login.settings.' . $provider . '.description') }}</p>
                        </div>
                    </div>

                    <div class="flexbox-annotated-section-content">
                        <div class="wrapper-content pd-all-20">
                            <div class="form-group mb-3 @if (!SocialService::getProviderEnabled($provider)) mb-0 @endif">
                                <input type="hidden" name="social_login_{{ $provider }}_enable" value="0">
                                <label>
                                    <input type="checkbox" class="hrv-checkbox enable-social-login-option" value="1"
                                        @if (SocialService::getProviderEnabled($provider)) checked @endif name="social_login_{{ $provider }}_enable">
                                    {{ trans('plugins/social-login::social-login.settings.enable') }}
                                </label>
                            </div>
                            <div class="enable-social-login-option-wrapper" @if (!SocialService::getProviderEnabled($provider)) style="display:none;" @endif>
                                @foreach ($item['data'] as $input)
                                    @if (in_array(app()->environment(), SocialService::getEnvDisableData()) && in_array($input, Arr::get($item, 'disable', [])))
                                        <div class="form-group mb-3">
                                            <label class="text-title-field">{{ trans('plugins/social-login::social-login.settings.' . $provider . '.' . $input) }}</label>
                                            <input type="text" disabled readonly class="next-input" value="{{ SocialService::getDataDisable($provider . '_' . $input) }}">
                                        </div>
                                    @else
                                        <div class="form-group mb-3">
                                            <label class="text-title-field"
                                                for="social_login_{{ $provider }}_{{ $input }}">{{ trans('plugins/social-login::social-login.settings.' . $provider . '.' . $input) }}</label>
                                            <input data-counter="120" type="text" class="next-input" name="social_login_{{ $provider }}_{{ $input }}" id="social_login_{{ $provider }}_{{ $input }}"
                                                value="{{ SocialService::setting($provider . '_' . $input) }}">
                                        </div>
                                    @endif
                                @endforeach
                                {!! Form::helper(trans('plugins/social-login::social-login.settings.' . $provider . '.helper', ['callback' => '<code>' . route('auth.social.callback', $provider) . '</code>'])) !!}
                            </div>

                        </div>
                    </div>
                </div>
            @endforeach
        </div>

        <div class="flexbox-annotated-section" style="border: none">
            <div class="flexbox-annotated-section-annotation">
                &nbsp;
            </div>
            <div class="flexbox-annotated-section-content">
                <button class="btn btn-info" type="submit">{{ trans('core/setting::setting.save_settings') }}</button>
            </div>
        </div>
    </div>
    {!! Form::close() !!}
@endsection
