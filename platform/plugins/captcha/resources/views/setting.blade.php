<div class="flexbox-annotated-section">
    <div class="flexbox-annotated-section-annotation">
        <div class="annotated-section-title pd-all-20">
            <h2>{{ trans('plugins/captcha::captcha.settings.title') }}</h2>
        </div>
        <div class="annotated-section-description pd-all-20 p-none-t">
            <p class="color-note">{{ trans('plugins/captcha::captcha.settings.description') }}</p>
        </div>
    </div>

    <div class="flexbox-annotated-section-content">
        <div class="wrapper-content pd-all-20">
            <div class="form-group mb-3">
                <label class="text-title-field"
                       for="enable_captcha">{{ trans('plugins/captcha::captcha.settings.enable_captcha') }}
                </label>
                <label class="me-2">
                    <input type="radio" name="enable_captcha"
                                                value="1"
                                                @if (setting('enable_captcha')) checked @endif>{{ trans('core/setting::setting.general.yes') }}
                </label>
                <label>
                    <input type="radio" name="enable_captcha"
                                                value="0"
                                                @if (!setting('enable_captcha')) checked @endif>{{ trans('core/setting::setting.general.no') }}
                </label>
            </div>

            <div class="form-group mb-3">
                <label class="text-title-field"
                       for="captcha_type">{{ trans('plugins/captcha::captcha.settings.type') }}
                </label>
                <label class="me-2">
                    <input type="radio" name="captcha_type"
                           value="v2"
                           @if (setting('captcha_type', 'v2') == 'v2') checked @endif>{{ trans('plugins/captcha::captcha.settings.v2_description') }}
                </label>
                <label>
                    <input type="radio" name="captcha_type"
                           value="v3"
                           @if (setting('captcha_type', 'v2') == 'v3') checked @endif>{{ trans('plugins/captcha::captcha.settings.v3_description') }}
                </label>
            </div>

            <div class="form-group mb-3">
                <label class="text-title-field"
                       for="captcha_hide_badge">{{ trans('plugins/captcha::captcha.settings.hide_badge') }}
                </label>
                <label class="me-2">
                    <input type="radio" name="captcha_hide_badge"
                           value="1"
                           @if (setting('captcha_hide_badge')) checked @endif>{{ trans('core/setting::setting.general.yes') }}
                </label>
                <label>
                    <input type="radio" name="captcha_hide_badge"
                           value="0"
                           @if (!setting('captcha_hide_badge')) checked @endif>{{ trans('core/setting::setting.general.no') }}
                </label>
            </div>

            <div class="form-group mb-3">
                <label class="text-title-field"
                       for="captcha_site_key">{{ trans('plugins/captcha::captcha.settings.captcha_site_key') }}</label>
                <input data-counter="120" type="text" class="next-input" name="captcha_site_key" id="captcha_site_key"
                       value="{{ setting('captcha_site_key', config('plugins.captcha.general.site_key')) }}" placeholder="{{ trans('plugins/captcha::captcha.settings.captcha_site_key') }}">
            </div>
            <div class="form-group mb-3">
                <label class="text-title-field"
                       for="captcha_secret">{{ trans('plugins/captcha::captcha.settings.captcha_secret') }}</label>
                <input data-counter="120" type="text" class="next-input" name="captcha_secret" id="captcha_secret"
                       value="{{ setting('captcha_secret', config('plugins.captcha.general.secret')) }}" placeholder="{{ trans('plugins/captcha::captcha.settings.captcha_secret') }}">
            </div>
            <div class="form-group mb-3">
                <span class="help-ts">{{ trans('plugins/captcha::captcha.settings.helper') }}</span>
            </div>
        </div>
    </div>
</div>
