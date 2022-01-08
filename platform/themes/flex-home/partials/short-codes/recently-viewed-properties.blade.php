<div class="container-fluid w90">
    <div class="homehouse padtop30 projecthome">
        <div class="row">
            <div class="col-12">
                <h2>{!! clean($title) !!}</h2>
                @if ($description)
                    <p>{!! clean($description) !!}</p>
                @endif
                @if ($subtitle)
                    <p>{!! clean($subtitle) !!}</p>
                @endif
            </div>
        </div>
        <property-component type="recently-viewed-properties" url="{{ route('public.ajax.properties') }}"></property-component>
    </div>
</div>
