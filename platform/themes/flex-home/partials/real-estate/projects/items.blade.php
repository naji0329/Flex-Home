<div id="loading">
    <div class="half-circle-spinner">
        <div class="circle circle-1"></div>
        <div class="circle circle-2"></div>
    </div>
</div>

<input type="hidden" name="page" data-value="{{ $projects->currentPage() }}">
@if ($projects->count())
    <div class="row">
        @foreach ($projects as $project)
            <div class="col-12 col-sm-6 col-md-4 col-lg-3 colm10">
                {!! Theme::partial('real-estate.projects.item', compact('project')) !!}
            </div>
        @endforeach
    </div>
@else
    <div class="alert alert-warning" role="alert">
        {{ __('0 results') }}
    </div>
@endif
