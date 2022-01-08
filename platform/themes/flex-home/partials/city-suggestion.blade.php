<ul>
    @foreach($items as $item)
        <li>
            <a href="#" data-id="{{ $item->id }}">{{ $item->name }}, {{ $item->state->name }}</a>
        </li>
    @endforeach
</ul>
