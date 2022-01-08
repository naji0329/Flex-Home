<div class="padtop70">
    <div class="box_shadow">
        <div class="container-fluid w90">
            <div class="homehouse projecthome">
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
                <featured-agents-component url="{{ route('public.ajax.featured-agents') }}" :limit="{{ $limit ? (int)$limit : 4 }}"></featured-agents-component>
            </div>
        </div>
    </div>
</div>
