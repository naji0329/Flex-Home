<div class="boxsliderdetail">
    <div class="slidetop">
        <div class="owl-carousel" id="listcarousel">
            @foreach ($object->images as $image)
                <div class="item">
                    <img src="{{ RvMedia::getImageUrl($image, null, false, RvMedia::getDefaultImage()) }}"
                        class="showfullimg"
                        rel="{{ $loop->index }}"
                        alt="{{ $object->name }}"
                        title="{{ $object->name }}"
                        data-mfp-src="{{ RvMedia::getImageUrl($image, null, false, RvMedia::getDefaultImage()) }}">
                </div>
            @endforeach
        </div>
    </div>
    <div class="slidebot">
        <div class="row">
            <div class="col-6 col-md-7 col-sm-6">
                <div>
                    <div class="owl-carousel" id="listcarouselthumb">
                        @foreach($object->images as $image)
                            <div class="item cthumb" rel="{{ $loop->index }}">
                                <img src="{{ RvMedia::getImageUrl($image, null, false, RvMedia::getDefaultImage()) }}"
                                    class="showfullimg"
                                    rel="{{ $loop->index }}"
                                    alt="{{ $object->name }}"
                                    data-mfp-src="{{ RvMedia::getImageUrl($image, null, false, RvMedia::getDefaultImage()) }}"
                                    title="{{ $object->name }}">
                            </div>
                        @endforeach
                    </div>
                    <i class="fas fa-chevron-right ar-next"></i>
                    <i class="fas fa-chevron-left ar-prev"></i>
                </div>
            </div>
            <div class="col-6 col-md-5 col-sm-6" style="align-self: center">
                <div class="row control justify-content-sm-end justify-content-center">

                    @if ($object->video_url)
                        <div class="col-6 col-sm-4 col-md-4 col-lg-2 itemct px-1 popup-youtube" href="{{ $object->video_url }}">
                            <div class="icon">
                                <i class="fab fa-youtube"></i>
                                <p>{{ __('Youtube') }}</p>
                            </div>
                        </div>
                    @endif
                    <div class="col-sm-4 col-md-4 col-lg-2 itemct d-none d-sm-block px-1 show-gallery-image">
                        <div class="icon">
                            <i class="fas fa-th"></i>
                            <p>{{ __('Gallery') }}</p>
                        </div>
                    </div>
                    @if ($object->latitude && $object->longitude)
                        <div class="col-6 col-sm-4 col-md-4 col-lg-2 itemct px-1"
                            data-magnific-popup="#trafficMap"
                            data-map-id="trafficMap"
                            data-popup-id="#traffic-popup-map-template"
                            data-map-icon="{{ $object->map_icon }}"
                            data-center="{{ json_encode([$object->latitude, $object->longitude]) }}">
                            <div class="icon">
                                <i class="far fa-map"></i>
                                <p>{{ __('Map') }}</p>
                            </div>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
