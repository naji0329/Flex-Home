@php
    if (theme_option('show_map_on_properties_page', 'yes') == 'yes') {
        Theme::asset()->usePath()->add('leaflet-css', 'libraries/leaflet.css');
        Theme::asset()->container('footer')->usePath()->add('leaflet-js', 'libraries/leaflet.js');
        Theme::asset()->container('footer')->usePath()->add('leaflet.markercluster-src-js', 'libraries/leaflet.markercluster-src.js');
    }
@endphp

<section class="main-homes pb-3">
    <div class="bgheadproject hidden-xs" style="background: url('{{ theme_option('breadcrumb_background') ? RvMedia::url(theme_option('breadcrumb_background')) : Theme::asset()->url('images/banner-du-an.jpg') }}')">
        <div class="description">
            <div class="container-fluid w90">
                <h1 class="text-center">{{ SeoHelper::getTitle() }}</h1>
                <p class="text-center">{{ theme_option('properties_description') }}</p>
                {!! Theme::partial('breadcrumb') !!}
            </div>
        </div>
    </div>
    <div class="container-fluid w90 padtop30">
        <div class="projecthome">
            <form action="{{ url()->current() }}" method="get" id="ajax-filters-form">
                @include(Theme::getThemeNamespace() . '::views.real-estate.includes.search-box', ['type' => 'property', 'categories' => $categories])
                <div class="row rowm10">
                    <div class="@if (theme_option('show_map_on_properties_page', 'yes') == 'yes' && Arr::get($_COOKIE, 'show_map_on_properties', 1)) col-lg-7 left-page-content @else col-lg-12 full-page-content @endif"
                        @if (theme_option('show_map_on_properties_page', 'yes') == 'yes')
                            data-class-full="col-lg-12 full-page-content"
                            data-class-left="col-lg-7 left-page-content"
                        @endif
                         id="properties-list">
                        @include(Theme::getThemeNamespace() . '::views.real-estate.includes.filters', ['isChangeView' => theme_option('show_map_on_properties_page', 'yes') == 'yes'])
                        <div class="data-listing mt-2">
                            {!! Theme::partial('real-estate.properties.items', compact('properties')) !!}
                        </div>
                    </div>
                    @if (theme_option('show_map_on_properties_page', 'yes') == 'yes')
                        <div class="col-md-5 @if (!Arr::get($_COOKIE, 'show_map_on_properties', 1)) d-none @endif" id="properties-map">
                            <div class="rightmap h-100">
                                <div
                                    id="map"
                                    data-type="{{ request()->input('type') }}"
                                    data-url="{{ route('public.ajax.properties.map') }}{{ isset($city) && $city ? '?city_id=' . $city->id : '' }}"
                                    data-center="{{ json_encode([43.615134, -76.393186]) }}"></div>
                            </div>
                        </div>
                    @endif
                </div>
            </form>
        </div>
    </div>
</section>

@if (theme_option('show_map_on_properties_page', 'yes') == 'yes')
    <script id="traffic-popup-map-template" type="text/x-custom-template">
        {!! Theme::partial('real-estate.properties.map', ['property' => get_object_property_map()]) !!}
    </script>
@endif
