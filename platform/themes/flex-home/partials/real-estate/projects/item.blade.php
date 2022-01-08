<div class="item">
    <div class="blii">
        <div class="img"><img class="thumb" data-src="{{ RvMedia::getImageUrl($project->image, 'small', false, RvMedia::getDefaultImage()) }}" src="{{ RvMedia::getImageUrl($project->image, 'small', false, RvMedia::getDefaultImage()) }}" alt="{{ $project->name }}">
        </div>
        <a href="{{ $project->url }}" class="linkdetail"></a>
        <ul class="item-price-wrap hide-on-list"><li class="h-type"><span>{{ $project->category->name }}</span></li></ul>
    </div>

    <div class="description">
        <a href="{{ $project->url }}"><h5>{{ $project->name }}</h5>
            <p class="dia_chi"><i class="fas fa-map-marker-alt"></i> {{ $project->city->name }}, {{ $project->city->state->name }}</p>
            @if ($project->price_from || $project->price_to)
                <p class="bold500">{{ __('Price') }}: @if ($project->price_from) <span class="from">{{ __('From') }}</span> {{ format_price($project->price_from, $project->currency) }} @endif @if ($project->price_to) - {{ format_price($project->price_to, $project->currency) }} @endif</p>
            @endif
        </a>
    </div>
</div>