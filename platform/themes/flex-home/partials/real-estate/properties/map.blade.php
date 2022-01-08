<div>
    <table width="100%">
        <tr>
            <td width="90">
                <div class="blii"><img src="{{ $property->image_thumb }}" width="80" alt="{{ $property->name }}">
                    <div class="status">{!! $property->status_html !!}</div>
                </div>
            </td>
            <td>
                <div class="infomarker">
                    <h5><a href="{{ $property->url }}" target="_blank">{{ $property->name }}</a></h5>
                    <div class="text-info"><strong>{{ $property->price_html }}</strong></div>
                    <div>{{ $property->city_name }}</div>
                    <div>
                        <span>{{ $property->square_text }}</span> &nbsp; &nbsp;
                        <span>
                            <i><img src="{{ Theme::asset()->url('images/bed.svg') }}" alt="icon"></i>
                            <i class="vti">{{ $property->number_bedroom }}</i></span> &nbsp; &nbsp; <span>
                            <i><img src="{{ Theme::asset()->url('images/bath.svg') }}" alt="icon"></i>
                            <i class="vti">{{ $property->number_bathroom }}</i>
                        </span>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</div>
