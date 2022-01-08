<div id="contact">
    <div class="row">
        <div class="col-md-6">
            <div class="wrapper"><h2 class="h2">{{ __('Contact information') }}</h2>
                <div class="contact-main">
                    <p>{{ theme_option('about-us') }}</p>
                    <div class="contact-name" style="text-transform: uppercase">{{ theme_option('company_name') }}</div>
                    <div class="contact-address">{{ __('Address') }}: {{ theme_option('address') }}
                    </div>
                    <div class="contact-phone">{{ __('Hotline') }}: {{ theme_option('hotline') }}</div>
                    <div class="contact-email">{{ __('Email') }}: {{ theme_option('email') }}</div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <form action="{{ route('public.send.contact') }}" method="post" class="generic-form">
                <div class="wrapper">
                    <h2 class="h2">{{ __('HOW WE CAN HELP YOU?') }}</h2>
                    @csrf
                    <div class="form-group">
                        <input class="form-control" type="text" name="name" placeholder="{{ __('Name') }} *"
                               required="">
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="text" name="email"
                               placeholder="{{ __('Email') }} *" required="">
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="text" name="phone"
                               placeholder="{{ __('Phone') }}">
                    </div>
                    <div class="form-group">
                                <textarea class="form-control" name="content" rows="6" minlength="10"
                                              placeholder="{{ __('Message') }} *" required=""></textarea>
                    </div>
                    @if (setting('enable_captcha') && is_plugin_active('captcha'))
                        <div class="form-group">
                            {!! Captcha::display() !!}
                        </div>
                    @endif
                    <div class="alert alert-success text-success text-left" style="display: none;">
                        <span></span>
                    </div>
                    <div class="alert alert-danger text-danger text-left" style="display: none;">
                        <span></span>
                    </div>
                    <br>
                    <div class="form-actions">
                        <button class="btn-special" type="submit">{{ __('Send message') }}</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
