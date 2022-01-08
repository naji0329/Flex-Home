<ul class="breadcrumb">
    @foreach ($crumbs = Theme::breadcrumb()->getCrumbs() as $i => $crumb)
        @if ($i != (count($crumbs) - 1))
            <li class="breadcrumb-item"><a href="{{ $crumb['url'] }}">{!! $crumb['label'] !!}</a></li>
        @else
            <li class="breadcrumb-item active">{!! $crumb['label'] !!}</li>
        @endif
    @endforeach
</ul>
