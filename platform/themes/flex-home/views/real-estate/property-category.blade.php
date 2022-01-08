<section class="main-homes">
    <div class="bgheadproject hidden-xs" style="background: url('{{ theme_option('breadcrumb_background') ? RvMedia::url(theme_option('breadcrumb_background')) : Theme::asset()->url('images/banner-du-an.jpg') }}')">
        <div class="description">
            <div class="container-fluid w90">
                <h1 class="text-center">{{ $category->name }}</h1>
                <p class="text-center d-none d-sm-inline-block">{{ $category->description }}</p>
                {!! Theme::partial('breadcrumb') !!}
            </div>
        </div>
    </div>
    <div class="container-fluid w90 padtop30">
        <div class="projecthome">
            <div class="rowm10">
                    @if ($properties->count())
                    <h5 class="headifhouse">{{ __('Properties in :name', ['name' => $category->name]) }}</h5>
                        <div class="row">
                            @foreach ($properties as $property)
                                <div class="col-6 col-sm-6 col-md-3 colm10" style="margin-bottom: 20px;">
                                    <div class="item">
                                        <div class="blii">
                                            <div class="img"><img class="thumb" data-src="{{ RvMedia::getImageUrl($property->image, 'small', false, RvMedia::getDefaultImage()) }}" src="{{ RvMedia::getImageUrl($property->image, 'small', false, RvMedia::getDefaultImage()) }}" alt="{{ $property->name }}">
                                            </div>
                                            <a href="{{ $property->url }}" class="linkdetail"></a>
                                            <div class="media-count-wrapper">
                                                <div class="media-count">
                                                    <img src="{{ Theme::asset()->url('images/media-count.svg') }}" alt="media">
                                                    <span>{{ count($property->images) }}</span>
                                                </div>
                                            </div>
                                            <div class="status">{!! $property->status->toHtml() !!}</div>
                                        </div>

                                        <div class="description">
                                            <a href="{{ $property->url }}"><h5>{{ $property->name }}</h5>
                                                <p class="dia_chi"><i class="fas fa-map-marker-alt"></i> {{ $property->city->name }}, {{ $property->city->state->name }}</p>
                                                <p class="bold500">{{ __('Price') }}: {{ format_price($property->price, $property->currency) }}</p>
                                            </a>
                                            <p class="threemt bold500">
                                                @if ($property->number_bedroom)
                                                    <span data-toggle="tooltip" data-placement="top" data-original-title="{{ __('Number of rooms') }}"> <i><img src="{{ Theme::asset()->url('images/bed.svg') }}" alt="icon"></i> <i class="vti">{{ $property->number_bedroom }}</i> </span>
                                                @endif
                                                @if ($property->number_bathroom)
                                                    <span data-toggle="tooltip" data-placement="top" data-original-title="{{ __('Number of rest rooms') }}">  <i><img src="{{ Theme::asset()->url('images/bath.svg') }}" alt="icon"></i> <i class="vti">{{ $property->number_bathroom }}</i></span>
                                                @endif
                                                @if ($property->square)
                                                    <span data-toggle="tooltip" data-placement="top" data-original-title="{{ __('Square') }}"> <i><img src="{{ Theme::asset()->url('images/area.svg') }}" alt="icon"></i> <i class="vti">{{ $property->square_text }}</i> </span>
                                                @endif
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    @else
                        <p class="item">{{ __('0 results') }}</p>
                    @endif
                </div>
            </div>
        </div>
</section>
<br>
<div class="col-sm-12">
    <nav class="d-flex justify-content-center pt-3" aria-label="Page navigation example">
        {!! $properties->withQueryString()->links() !!}
    </nav>
</div>
<br>
<br>
