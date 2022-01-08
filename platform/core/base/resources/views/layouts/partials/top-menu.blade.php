<div class="top-menu">
    <ul class="nav navbar-nav float-end">
        @auth
            @if (BaseHelper::getAdminPrefix() != '')
                <li class="dropdown">
                    <a class="dropdown-toggle dropdown-header-name" style="padding-right: 10px" href="{{ url('/') }}" target="_blank"><i class="fa fa-globe"></i> <span @if (isset($themes) && is_array($themes) && count($themes) > 1 && setting('enable_change_admin_theme') != false) class="d-none d-sm-inline" @endif>{{ trans('core/base::layouts.view_website') }}</span> </a>
                </li>
            @endif
            @if (Auth::check())
                {!! apply_filters(BASE_FILTER_TOP_HEADER_LAYOUT, null) !!}
            @endif

            @if (isset($themes) && is_array($themes) && count($themes) > 1 && setting('enable_change_admin_theme') != false)
                <li class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle dropdown-header-name" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span>{{ trans('core/base::layouts.theme') }}</span>
                        <i class="fa fa-angle-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right icons-right">

                        @foreach ($themes as $name => $file)
                            @if ($activeTheme === $name)
                                <li class="active"><a href="{{ route('admin.theme', [$name]) }}">{{ Str::studly($name) }}</a></li>
                            @else
                                <li><a href="{{ route('admin.theme', [$name]) }}">{{ Str::studly($name) }}</a></li>
                            @endif
                        @endforeach

                    </ul>
                </li>
            @endif

            <li class="dropdown dropdown-user">
                <a href="javascript:void(0)" class="dropdown-toggle dropdown-header-name" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <img alt="{{ Auth::user()->name }}" class="rounded-circle" src="{{ Auth::user()->avatar_url }}" />
                    <span class="username"> {{ Auth::user()->name }} </span>
                    <i class="fa fa-angle-down"></i>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="{{ route('users.profile.view', Auth::id()) }}"><i class="icon-user"></i> {{ trans('core/base::layouts.profile') }}</a></li>
                    <li><a href="{{ route('access.logout') }}" class="btn-logout"><i class="icon-key"></i> {{ trans('core/base::layouts.logout') }}</a></li>
                </ul>
            </li>
        @endauth
    </ul>
</div>
