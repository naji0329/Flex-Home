@php
    Theme::asset()->usePath()->add('leaflet-css', 'libraries/leaflet.css');
    Theme::asset()->container('footer')->usePath()->add('leaflet-js', 'libraries/leaflet.js');
    Theme::asset()->usePath()->add('magnific-css', 'libraries/magnific/magnific-popup.css');
    Theme::asset()->container('footer')->usePath()->add('magnific-js', 'libraries/magnific/jquery.magnific-popup.min.js');
@endphp
<main class="detailproject">
    @include(Theme::getThemeNamespace() . '::views.real-estate.includes.slider', ['object' => $project])

    <div class="container-fluid bgmenupro">
        <div class="container-fluid w90 padtop30" style="padding: 15px 0;">
            <div class="col-12">
                <h1 class="title" style="font-size: 1.5rem; font-weight: bold; margin-bottom: 0;">{{ $project->name }}</h1>
                <p class="addresshouse">
                    <i class="fas fa-map-marker-alt"></i> {{ $project->city->name }}, {{ $project->city->state->name }}
                    @if (setting('real_estate_display_views_count_in_detail_page', 0) == 1)
                        <span class="d-inline-block" style="margin-left: 10px"><i class="fa fa-eye"></i> {{ $project->views }} {{ __('views') }}</span>
                    @endif
                    <span class="d-inline-block" style="margin-left: 10px"><i class="fa fa-calendar-alt"></i> {{ $project->created_at->format('M d, Y') }}</span>
                </p>
            </div>
        </div>
    </div>

    <div class="container-fluid w90 padtop30 single-post">
        <section class="general">
            <div class="row">
                <div class="col-md-8">
                    <div class="head">{{ __('Overview') }}</div>
                    <span class="line_title"></span>
                    <div class="row">
                        <div class="col-sm-6 lineheight220">
                            <div><span>{{ __('Status') }}:</span> <b>{{ $project->status->label() }}</b></div>
                            @if ($project->categories()->count()) <div><span>{{ __('Category') }}:</span> <strong>{{ implode(', ', array_unique($project->categories()->pluck('name')->all())) }}</strong></div> @endif
                            @if ($project->investor->name) <div><span>{{ __('Investor') }}:</span> <b>{{ $project->investor->name }}</b></div> @endif
                            @if ($project->price_from || $project->price_to)
                            <div>
                                <span>{{ __('Price') }}:</span>
                                <b>@if ($project->price_from)
                                    <span class="from">{{ __('From') }}</span>
                                    {{ format_price($project->price_from, $project->currency)  }} @endif
                                    @if ($project->price_to) - {{ format_price($project->price_to, $project->currency) }} @endif
                                </b>
                            </div>
                            @endif
                        </div>
                        <div class="col-sm-6 lineheight220">
                            @if ($project->number_block) <div><span>{{ __('Number of blocks') }}:</span> <b>{{ number_format($project->number_block) }}</b></div> @endif
                            @if ($project->number_floor) <div><span>{{ __('Number of floors') }}:</span> <b>{{ number_format($project->number_floor) }}</b></div>@endif
                            @if ($project->number_flat) <div><span>{{ __('Number of flats') }}:</span> <b>{{ number_format($project->number_flat) }}</b></div>@endif
                        </div>
                    </div>

                    <div class="head">{{ __('Description') }}</div>
                    @if ($project->content)
                        {!! clean($project->content) !!}
                    @endif
                    @if ($project->features->count())
                        <div class="head">{{ __('Features') }}</div>
                        <div class="row">
                            @php $project->features->loadMissing('metadata'); @endphp
                            @foreach($project->features as $feature)
                                <div class="col-sm-4">
                                    @if ($feature->getMetaData('icon_image', true))
                                        <p><i><img src="{{ RvMedia::getImageUrl($feature->getMetaData('icon_image', true)) }}" alt="{{ $feature->name }}" style="vertical-align: top; margin-top: 3px;" width="18" height="18"></i> {{ $feature->name }}</p>
                                    @else
                                        <p><i class="@if ($feature->icon) {{ $feature->icon }} @else fas fa-check @endif text-orange text0i"></i>  {{ $feature->name }}</p>
                                    @endif
                                </div>
                            @endforeach
                        </div>
                    @endif
                    <br>
                    @if ($project->facilities->count())
                        <div class="row">
                            <div class="col-sm-12">
                                <h5 class="headifhouse">{{ __('Distance key between facilities') }}</h5>
                                <div class="row">
                                    @php $project->facilities->loadMissing('metadata'); @endphp
                                    @foreach($project->facilities as $facility)
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
                    <br>
                    @if ($project->latitude && $project->longitude)
                        {!! Theme::partial('real-estate.elements.traffic-map-modal', ['location' => $project->location . ', ' . $project->city_name]) !!}
                    @else
                        {!! Theme::partial('real-estate.elements.gmap-canvas', ['location' => $project->location]) !!}
                    @endif
                    @if ($project->video_url)
                        {!! Theme::partial('real-estate.elements.video', ['object' => $project, 'title' => __('Project video')]) !!}
                    @endif
                    <br>
                    {!! Theme::partial('share', ['title' => __('Share this project'), 'description' => $project->description]) !!}
                    <div class="clearfix"></div>
                    <br>
                </div>
                <div class="col-md-4 padtop10">
                    <div class="boxright p-3">
                        {!! Theme::partial('consult-form', ['type' => 'project', 'data' => $project]) !!}
                    </div>
                </div>
            </div>

            <h5  class="headifhouse">{{ __('Properties For Sale') }}</h5>
            <div class="projecthome mb-2">
                <property-component type="project-properties-for-sell" :project_id="{{ $project->id }}" url="{{ route('public.ajax.properties') }}" :show_empty_string="true"></property-component>
            </div>

            <h5  class="headifhouse">{{ __('Properties For Rent') }}</h5>
            <div class="projecthome mb-4">
                <property-component type="project-properties-for-rent" :project_id="{{ $project->id }}" url="{{ route('public.ajax.properties') }}" :show_empty_string="true"></property-component>
            </div>
        </section>

    </div>
</main>

<script id="traffic-popup-map-template" type="text/x-custom-template">
    {!! Theme::partial('real-estate.projects.map', ['project' => $project]) !!}
</script>
