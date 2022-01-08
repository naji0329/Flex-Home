<div id="loading">
    <div class="half-circle-spinner">
        <div class="circle circle-1"></div>
        <div class="circle circle-2"></div>
    </div>
</div>

<input type="hidden" name="page" data-value="{{ $properties->currentPage() }}">
@if ($properties->count())
    <div class="row">
        @foreach ($properties as $property)
            <div class="colm10 property-item" data-lat="{{ $property->latitude }}" data-long="{{ $property->longitude }}">
                {!! Theme::partial('real-estate.properties.item', compact('property')) !!}
            </div>
        @endforeach
    </div>
    <br>
@else
    <div class="alert alert-warning" role="alert">
        {{ __('0 results') }}
    </div>
@endif

<div class="col-sm-12">
    <nav class="d-flex justify-content-center pt-3" aria-label="Page navigation example">
        {!! $properties->withQueryString()->onEachSide(1)->links() !!}
    </nav>
</div>
