@extends('plugins/real-estate::account.layouts.skeleton')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card login-form">
                    <div class="card-body">
                        <h4 class="text-center">{{ trans('plugins/real-estate::account.forgot_password') }}</h4>
                        <br>
                        <form method="POST" action="{{ route('public.account.password.email') }}">
                            @csrf
                            <div class="form-group mb-3">
                                <input id="email" type="email"
                                       class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}"
                                       name="email" value="{{ old('email') }}" required placeholder="{{ trans('plugins/real-estate::dashboard.email') }}">
                                @if ($errors->has('email'))
                                    <span class="invalid-feedback">
                                    <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                            </div>
                            <div class="form-group mb-0">
                                    <button type="submit" class="btn btn-blue btn-full fw6">
                                        {{ trans('plugins/real-estate::dashboard.reset-password-cta') }}
                                    </button>
                                    <div class="text-center">
                                        <a href="{{ route('public.account.login') }}"
                                           class="btn btn-link">{{ trans('plugins/real-estate::dashboard.back-to-login') }}</a>
                                    </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
