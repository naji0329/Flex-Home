@foreach ($features as $feature)
    <label class="checkbox-inline">
        <input name="features[]" type="checkbox" value="{{ $feature->id }}" @if (in_array($feature->id, $selectedFeatures)) checked @endif>{{ $feature->name }}
    </label>&nbsp;
@endforeach
