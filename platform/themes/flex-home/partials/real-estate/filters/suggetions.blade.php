<ul class="list-of-suggetions mt-4">
    @foreach ($collections as $key => $value)
        <li data-value="{{ $key }}">{!! $value !!}</li>
    @endforeach
    <li data-value="">{{ $labelAll }}</li>
</ul>