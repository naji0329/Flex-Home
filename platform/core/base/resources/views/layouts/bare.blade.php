@extends('core/base::layouts.base')

@section ('page')
    <div class="page-wrapper">

        @include('core/base::layouts.partials.top-header')

        <div class="page-container">
            <div class="page-content page-content-transparent">
                @yield('content')
            </div>
            <div class="clearfix"></div>
        </div>

        @include('core/base::layouts.partials.footer')

    </div>
@stop
