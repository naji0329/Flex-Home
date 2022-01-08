<li class="dropdown dropdown-extended dropdown-inbox" id="header_inbox_bar">
    <a href="javascript:;" class="dropdown-toggle dropdown-header-name" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <i class="icon-envelope-open"></i>
        <span class="badge badge-default"> {{ $consults->total() }} </span>
    </a>
    <ul class="dropdown-menu dropdown-menu-right">
        <li class="external">
            <h3>{!! trans('plugins/real-estate::consult.new_consult_notice', ['count' => $consults->total()]) !!}</h3>
            <a href="{{ route('consult.index') }}">{{ trans('plugins/real-estate::consult.view_all') }}</a>
        </li>
        <li>
            <ul class="dropdown-menu-list scroller" style="height: {{ $consults->total() * 70 }}px;" data-handle-color="#637283">
                @foreach($consults as $consult)
                    <li>
                        <a href="{{ route('consult.edit', $consult->id) }}">
                            <span class="photo">
                                <img src="{{ $consult->avatar_url }}" class="rounded-circle" alt="{{ $consult->name }}">
                            </span>
                            <span class="subject"><span class="from"> {{ $consult->name }} </span><span class="time">{{ $consult->created_at->toDateTimeString() }} </span></span>
                            <span class="message"> {{ $consult->phone }} - {{ $consult->email }} </span>
                        </a>
                    </li>
                @endforeach

                @if ($consults->total() > 10)
                    <li class="text-center"><a href="{{ route('contacts.index') }}">{{ trans('plugins/contact::contact.view_all') }}</a></li>
                @endif
            </ul>
        </li>
    </ul>
</li>
