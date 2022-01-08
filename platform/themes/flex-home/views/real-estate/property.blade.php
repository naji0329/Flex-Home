@php
    Theme::asset()->usePath()->add('leaflet-css', 'libraries/leaflet.css');
    Theme::asset()->container('footer')->usePath()->add('leaflet-js', 'libraries/leaflet.js');
    Theme::asset()->usePath()->add('magnific-css', 'libraries/magnific/magnific-popup.css');
    Theme::asset()->container('footer')->usePath()->add('magnific-js', 'libraries/magnific/jquery.magnific-popup.min.js');
    Theme::asset()->container('footer')->usePath()->add('property-js', 'js/property.js');
@endphp
<main class="detailproject bg-white">
    <div data-property-id="{{ $property->id }}"></div>
    @include(Theme::getThemeNamespace() . '::views.real-estate.includes.slider', ['object' => $property])

    <div class="container-fluid w90 padtop20">
        <h1 class="titlehouse">{{ $property->name }}</h1>
        <p class="addresshouse">
            <i class="fas fa-map-marker-alt"></i> {{ $property->city_name }}
            @if (setting('real_estate_display_views_count_in_detail_page', 0) == 1)
                <span class="d-inline-block" style="margin-left: 10px"><i class="fa fa-eye"></i> {{ $property->views }} {{ __('views') }}</span>
            @endif
            <span class="d-inline-block" style="margin-left: 10px"><i class="fa fa-calendar-alt"></i> {{ $property->created_at->format('M d, Y') }}</span>
        </p>
        <p class="pricehouse"> {{ $property->price_html }} {!! $property->status_html !!}</p>
        <div class="row">
            <div class="col-md-8">
                <div class="row pt-3">
                    <div class="col-sm-12">
                        <h5 class="headifhouse">{{ __('Overview') }}</h5>
                        <div class="row py-2">
                            <div class="col-sm-12">
                                <table class="table table-striped table-bordered">
                                    @if ($property->categories()->count())
                                        <tr>
                                            <td>{{ __('Category') }}</td>
                                            <td>
                                                <strong>{{ implode(', ', array_unique($property->categories()->pluck('name')->all())) }}</strong>
                                            </td>
                                        </tr>
                                    @endif
                                    @if ($property->square)
                                        <tr>
                                            <td>{{ __('Square') }}</td>
                                            <td><strong>{{ $property->square_text }}</strong></td>
                                        </tr>
                                    @endif
                                    @if ($property->number_bedroom)
                                        <tr>
                                            <td>{{ __('Number of bedrooms') }}</td>
                                            <td><strong>{{ number_format($property->number_bedroom) }}</strong></td>
                                        </tr>
                                    @endif
                                    @if ($property->number_bathroom)
                                        <tr>
                                            <td>{{ __('Number of bathrooms') }}</td>
                                            <td><strong>{{ number_format($property->number_bathroom) }}</strong></td>
                                        </tr>
                                    @endif
                                    @if ($property->number_floor)
                                        <tr>
                                            <td>{{ __('Number of floors') }}</td>
                                            <td><strong>{{ number_format($property->number_floor) }}</strong></td>
                                        </tr>
                                    @endif
                                    <tr>
                                        <td>{{ __('Price') }}</td>
                                        <td><strong>{{ $property->price_html }}</strong></td>
                                    </tr>
                                    {!! apply_filters('property_details_extra_info', null, $property) !!}
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                @if ($property->content)
                    <div class="row">
                        <div class="col-sm-12">
                            <h5 class="headifhouse">{{ __('Description') }}</h5>
                            {!! clean($property->content) !!}
                        </div>
                    </div>
                @endif
                @if ($property->features->count())
                    <div class="row">
                        <div class="col-sm-12">
                            <h5 class="headifhouse">{{ __('Features') }}</h5>
                            <div class="row">
                                @php $property->features->loadMissing('metadata'); @endphp
                                @foreach($property->features as $feature)
                                    <div class="col-sm-4">
                                        @if ($feature->getMetaData('icon_image', true))
                                            <p><i><img src="{{ RvMedia::getImageUrl($feature->getMetaData('icon_image', true)) }}" style="vertical-align: top; margin-top: 3px;" alt="{{ $feature->name }}" width="18" height="18"></i> {{ $feature->name }}</p>
                                        @else
                                            <p><i class="@if ($feature->icon) {{ $feature->icon }} @else fas fa-check @endif text-orange text0i"></i>  {{ $feature->name }}</p>
                                        @endif
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                @endif
                <br>
                @if ($property->facilities->count())
                    <div class="row">
                        <div class="col-sm-12">
                            <h5 class="headifhouse">{{ __('Distance key between facilities') }}</h5>
                            <div class="row">
                                @php $property->facilities->loadMissing('metadata'); @endphp
                                @foreach($property->facilities as $facility)
                                    <div class="col-sm-4">
                                        @if ($facility->getMetaData('icon_image', true))
                                            <p><i><img src="{{ RvMedia::getImageUrl($facility->getMetaData('icon_image', true)) }}" alt="{{ $facility->name }}" style="vertical-align: top; margin-top: 3px;" width="18" height="18"></i> {{ $facility->name }} - {{ $facility->pivot->distance }} {{ __('km') }}</p>
                                        @else
                                            <p><i class="@if ($facility->icon) {{ $facility->icon }} @else fas fa-check @endif text-orange text0i"></i> {{ $facility->name }} - {{ $facility->pivot->distance }} {{ __('km') }}</p>
                                        @endif
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                @endif
                @if ($property->project_id && $project = $property->project)
                    <div class="row pb-3">
                        <div class="col-sm-12">
                            <h5 class="headifhouse">{{ __('Project\'s information') }}</h5>
                        </div>
                        <div class="col-sm-12">
                            <div class="row item">
                                <div class="col-md-4 col-sm-5 pr-sm-0">
                                    <div class="img h-100 bg-light">
                                        <a href="{{ $project->url }}">
                                            <img class="thumb lazy"
                                                data-src="{{ RvMedia::getImageUrl($project->image, null, false, RvMedia::getDefaultImage()) }}"
                                                src="{{ RvMedia::getImageUrl($project->image, null, false, RvMedia::getDefaultImage()) }}"
                                                alt="{{ $project->name }}">
                                        </a>
                                    </div>
                                </div>
                                <div class="col-md-8 col-sm-7 pt-2 pr-sm-0 bg-light">
                                    <h5><a href="{{ $project->url }}" class="font-weight-bold text-dark">{{ $project->name }}</a></h5>
                                    <div>{{ Str::limit($project->description, 120) }}</div>
                                    <p><a href="{{ $project->url }}">{{ __('Read more') }}</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                @endif
                <br>
                @if ($property->latitude && $property->longitude)
                    {!! Theme::partial('real-estate.elements.traffic-map-modal', ['location' => $property->location . ', ' . $property->city_name]) !!}
                @else
                    {!! Theme::partial('real-estate.elements.gmap-canvas', ['location' => $property->location]) !!}
                @endif
                @if ($property->video_url)
                    {!! Theme::partial('real-estate.elements.video', ['object' => $property, 'title' => __('Property video')]) !!}
                @endif
                <br>
                {!! Theme::partial('share', ['title' => __('Share this property'), 'description' => $property->description]) !!}
                <div class="clearfix"></div>
            </div>
            <div class="col-md-4">
                @if ($author = $property->author)
                    <div class="boxright p-3">
                        <div class="head">
                            {{ __('Contact agency') }}
                        </div>

                        <div class="row rowm10 itemagent">
                            <div class="col-lg-4 colm10">
                                @if ($author->username)
                                    <a href="{{ route('public.agent', $author->username) }}">
                                        @if ($author->avatar->url)
                                            <img src="{{ RvMedia::getImageUrl($author->avatar->url, 'thumb') }}" alt="{{ $author->name }}" class="img-thumbnail">
                                        @else
                                            <img src="{{ $author->avatar_url }}" alt="{{ $author->name }}" class="img-thumbnail">
                                        @endif
                                    </a>
                                @else
                                    @if ($author->avatar->url)
                                        <img src="{{ RvMedia::getImageUrl($author->avatar->url, 'thumb') }}" alt="{{ $author->name }}" class="img-thumbnail">
                                    @else
                                        <img src="{{ $author->avatar_url }}" alt="{{ $author->name }}" class="img-thumbnail">
                                    @endif
                                @endif
                            </div>
                            <div class="col-lg-8 colm10">
                                <div class="info">
                                    <p>
                                        <strong>
                                            @if ($author->username)
                                                <a href="{{ route('public.agent', $author->username) }}">{{ $author->name }}</a>
                                            @else
                                                {{ $author->name }}
                                            @endif
                                        </strong>
                                    </p>
                                    <p class="mobile">{{ $author->phone }}</p>
                                    <p>{{ $author->email }}</p>
                                    @if ($author->username)
                                        <p><span class="fas fa-arrow-circle-right"></span> <a href="{{ route('public.agent', $author->username) }}">{{ __('More properties by this agent') }}</a></p>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                @endif
                <div class="boxright p-3">
                    {!! Theme::partial('consult-form', ['type' => 'property', 'data' => $property]) !!}
                </div>
            </div>
        </div>
        <br>
        <h5 class="headifhouse">{{ __('Related properties') }}</h5>
        <div class="projecthome mb-3">
            <property-component type="related" url="{{ route('public.ajax.properties') }}" :property_id="{{ $property->id }}"></property-component>
        </div>
    </div>
</main>

<script id="traffic-popup-map-template" type="text/x-custom-template">
    {!! Theme::partial('real-estate.properties.map', ['property' => $property]) !!}
</script>
