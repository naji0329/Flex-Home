<meta name="csrf-token" content="{{ csrf_token() }}">

@foreach(RvMedia::getConfig('libraries.stylesheets', []) as $css)
    <link href="{{ url($css) }}" rel="stylesheet" type="text/css"/>
@endforeach

@include('core/media::config')
