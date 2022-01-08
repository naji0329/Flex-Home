@extends('plugins/real-estate::account.layouts.skeleton')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ trans('Verify Your Email Address') }}</div>

                <div class="card-body">
                    @if (session('resent'))
                        <div class="alert alert-success" role="alert">
                            {{ trans('A fresh verification link has been sent to your email address.') }}
                        </div>
                    @endif

                    {{ trans('Before proceeding, please check your email for a verification link.') }}
                    {{ trans('If you did not receive the email') }}, <a href="{{ route('public.account.resend_confirmation') }}">{{ trans('click here to request another') }}</a>.
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
