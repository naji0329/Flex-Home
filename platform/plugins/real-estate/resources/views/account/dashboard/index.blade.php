@extends('plugins/real-estate::account.layouts.skeleton')
@section('content')
  <div class="dashboard crop-avatar">
    <div class="container">
      <div class="row">
        <div class="col-md-3 mb-3 dn db-ns">
          <div class="mb3">
            <div class="sidebar-profile">
              <div class="avatar-container mb-2">
                <div class="profile-image">
                  <div class="avatar-view mt-card-avatar mt-card-avatar-circle" style="max-width: 150px">
                    <img src="{{ $user->avatar->url ? RvMedia::getImageUrl($user->avatar->url, 'thumb') : $user->avatar_url }}" alt="{{ $user->name }}" class="br-100" style="width: 150px;">
                    <div class="mt-overlay br2">
                      <span><i class="fa fa-edit"></i></span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="f4 b">{{ $user->name }}</div>
              <div class="f6 mb3 light-gray-text">
                <i class="fas fa-envelope mr2"></i><a href="mailto:{{ $user->email }}" class="gray-text">{{ $user->email }}</a>
              </div>
              <div class="mb3">
                <div class="light-gray-text mb2">
                  <i class="fas fa-calendar-alt mr2"></i>{{ trans('plugins/real-estate::dashboard.joined_on', ['date' => $user->created_at->format('F d, Y')]) }}
                </div>
                @if ($user->dob)
                  <div class="light-gray-text mb2">
                    <i class="fas fa-child mr2"></i>{{ trans('plugins/real-estate::dashboard.dob', ['date' => $user->dob->format('F d, Y')]) }}
                  </div>
                @endif
              </div>
            </div>
          </div>
        </div>
          <div class="col-md-9 mb-3">
            {!! apply_filters(ACCOUNT_TOP_STATISTIC_FILTER, null) !!}
              <div class="row">
                  <div class="col-md-4">
                      <div class="white">
                          <div class="br2 pa3 bg-light-blue mb3" style="box-shadow: 0 1px 1px #ccc;">
                              <div class="media-body">
                                  <div class="f3">
                                      <span class="fw6">{{ $user->properties()->where('moderation_status', \Botble\RealEstate\Enums\ModerationStatusEnum::APPROVED)->count() }}</span>
                                      <span class="fr"><i class="far fa-check-circle"></i></span>
                                  </div>
                                  <p>{{ trans('plugins/real-estate::dashboard.approved_properties') }}</p>
                              </div>
                          </div>
                      </div>
                  </div>
                  <div class="col-md-4">
                      <div class="white">
                          <div class="br2 pa3 bg-light-red mb3" style="box-shadow: 0 1px 1px #ccc;">
                              <div class="media-body">
                                  <div class="f3">
                                      <span class="fw6">{{ $user->properties()->where('moderation_status', \Botble\RealEstate\Enums\ModerationStatusEnum::PENDING)->count() }}</span>
                                      <span class="fr"><i class="fas fa-user-clock"></i></span>
                                  </div>
                                  <p>{{ trans('plugins/real-estate::dashboard.pending_approve_properties') }}</p>
                              </div>
                          </div>
                      </div>
                  </div>
                  <div class="col-md-4">
                      <div class="white">
                          <div class="br2 pa3 bg-light-silver mb3" style="box-shadow: 0 1px 1px #ccc;">
                              <div class="media-body">
                                  <div class="f3">
                                      <span class="fw6">{{ $user->properties()->where('moderation_status', \Botble\RealEstate\Enums\ModerationStatusEnum::REJECTED)->count() }}</span>
                                      <span class="fr"><i class="far fa-edit"></i></span>
                                  </div>
                                  <p>{{ trans('plugins/real-estate::dashboard.rejected_properties') }}</p>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
              <div id="app-real-estate">
                    <activity-log-component default-active-tab="activity-logs"></activity-log-component>
              </div>
          </div>
      </div>
    </div>
    @include('plugins/real-estate::account.modals.avatar')
  </div>
@endsection
