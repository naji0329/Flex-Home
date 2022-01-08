@extends('plugins/real-estate::account.layouts.skeleton')
@section('content')
  <div class="settings" id="app-real-estate">
    <div class="container">
      <div class="row">
        @include('plugins/real-estate::account.settings.sidebar')
        <div class="col-12 col-md-9">
            <div class="main-dashboard-form">
          <div class="mb-5">
            <!-- Title -->
            <div class="row">
              <div class="col-12">
                <h4 class="with-actions">{{ trans('plugins/real-estate::dashboard.packages_title') }}</h4>
              </div>
            </div>

            <!-- Content -->
                @if (session('status'))
                  <div class="alert alert-success alert-dismissible fade show" role="alert">
                    {{ session('status') }}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
                    </button>
                  </div>
                @endif

                <packages-component url="{{ route('public.account.ajax.packages') }}" subscribe_url="{{ route('public.account.ajax.package.subscribe') }}"></packages-component>

              </div>
            </div>

            <div class="main-dashboard-form">
                <div class="mb-5">
                    <!-- Title -->
                    <div class="row">
                        <div class="col-12">
                            <h4 class="with-actions">{{ trans('plugins/real-estate::dashboard.transactions_title') }}</h4>
                        </div>
                    </div>

                    <!-- Content -->
                    @if (session('status'))
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            {{ session('status') }}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
                            </button>
                        </div>
                    @endif

                    <payment-history-component></payment-history-component>
                </div>
            </div>
        </div>
      </div>
    </div>
  </div>
@endsection
