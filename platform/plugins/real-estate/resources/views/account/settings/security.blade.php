@extends('plugins/real-estate::account.layouts.skeleton')
@section('content')
  <div class="settings">
    <div class="container">
      <div class="row">
        @include('plugins/real-estate::account.settings.sidebar')
        <div class="col-12 col-md-9">
            <div class="main-dashboard-form">
          <div class="mb-5">
            <!-- Title -->
            <div class="row">
              <div class="col-12">
                <h4 class="with-actions">{{ trans('plugins/real-estate::dashboard.security_title') }}</h4>
              </div>
            </div>

            <!-- Content -->
            <div class="row">
              <div class="col-lg-8">
                @if (session('status'))
                  <div class="alert alert-success alert-dismissible fade show" role="alert">
                    {{ session('status') }}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
                    </button>
                  </div>
                @endif
                <form method="POST" action="{{ route('public.account.post.security') }}" class="settings-reset">
                  @method('PUT')
                  @csrf
                  <div class="form-group mb-3">
                    <label for="password">{{ trans('plugins/real-estate::dashboard.password_new') }}</label>
                    <input type="password" class="form-control" name="password" id="password">
                  </div>
                  <div class="form-group mb-3">
                    <label for="password_confirmation">{{ trans('plugins/real-estate::dashboard.password_new_confirmation') }}</label>
                    <input type="password" class="form-control" name="password_confirmation" id="password_confirmation">
                  </div>
                  <button type="submit" class="btn btn-primary fw6">{{ trans('plugins/real-estate::dashboard.password_update_btn') }}</button>
                </form>
              </div>
            </div>
          </div>
            </div>
        </div>
      </div>
    </div>
  </div>
@endsection
@push('scripts')
  <!-- Laravel Javascript Validation -->
  <script type="text/javascript" src="{{ asset('vendor/core/core/js-validation/js/js-validation.js')}}"></script>
  {!! JsValidator::formRequest(\Botble\RealEstate\Http\Requests\UpdatePasswordRequest::class); !!}
@endpush
