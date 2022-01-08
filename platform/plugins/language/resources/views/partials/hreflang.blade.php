@if (!empty($urls))
    @foreach($urls as $item)
        <link rel="alternate" href="{{ $item['url'] }}" hreflang="{{ $item['lang_code'] }}" />
    @endforeach
@else
    @foreach(Language::getSupportedLocales() as $localeCode => $properties)
        @if ($localeCode != Language::getCurrentLocale())
            <link rel="alternate" href="{{ Language::getLocalizedURL($localeCode, url()->current(), [], false) }}" hreflang="{{ $localeCode }}" />
        @endif
    @endforeach
@endif
