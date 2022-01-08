<div>
    <table width="100%">
        <tr>
            <td width="90">
                <div class="blii">
                    <img src="{{ $project->image_thumb }}" width="80" alt="{{ $project->name }}">
                </div>
            </td>
            <td>
                <div class="infomarker">
                    <h5><a href="{{ $project->url }}" target="_blank">{{ $project->name }}</a></h5>
                    <div class="text-info"><strong>{{ $project->category_name }}</strong></div>
                    <div><i class="fas fa-map-marker-alt"></i> {{ $project->city_name }}</div>
                </div>
            </td>
        </tr>
    </table>
</div>
