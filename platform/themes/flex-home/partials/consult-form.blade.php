<form action="{{ route('public.send.consult') }}" method="post" id="contact-form" class="generic-form">
    @csrf
    <input type="hidden" value="{{ $type }}" name="type">
    <input type="hidden" value="{{ $data->id }}" name="data_id">
    <div class="head">{{ __('Contact') }}</div>
    <div class="form-group">
        <input type="text" name="name" class="form-control" placeholder="{{ __('Name') }} *"
               data-validation-engine="validate[required]"
               data-errormessage-value-missing="{{ __('Please enter name') }}!">
    </div>
    <div class="form-group">
        <input type="text" name="phone" class="form-control" placeholder="{{ __('Phone') }} *"
               data-validation-engine="validate[required]"
               data-errormessage-value-missing="{{ __('Please enter phone number') }}!">
    </div>
    <div class="form-group">
        <input type="text" name="email" class="form-control " placeholder="{{ __('Email') }}">
    </div>
    <div class="form-group">
        <input type="text" class="form-control" placeholder="{{ __('Subject') }} *" value="{{ $data->name }}" readonly>
    </div>
    <div class="form-group">
        <textarea name="content" class="form-control" rows="5" placeholder="{{ __('Message') }}"></textarea>
    </div>
    @if (setting('enable_captcha') && is_plugin_active('captcha'))
        <div class="form-group">
            {!! Captcha::display() !!}
        </div>
    @endif
    <div class="form-group">
        <button type="submit" class="btn btn-lg btn-orange btn-block">{{ __('Send') }}</button>
    </div>
    <div class="clearfix"></div>

    {!! apply_filters('consult_form_extra_info', null, $data) !!}
    <br>
    <div class="alert alert-success text-success text-left" style="display: none;">
        <span></span>
    </div>
    <div class="alert alert-danger text-danger text-left" style="display: none;">
        <span></span>
    </div>
</form>
