{!! '<' . '?' . 'xml version="1.0" encoding="UTF-8"?>' . "\n" !!}
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:dc="http://purl.org/dc/elements/1.1/">
    <channel>
        <title><![CDATA[{{ $meta['title'] }}]]></title>
        <link><![CDATA[{{ url($meta['link']) }}]]></link>
        <description><![CDATA[{{ $meta['description'] }}]]></description>
        <language>{{ $meta['language'] }}</language>
        <pubDate>{{ $meta['updated'] }}</pubDate>
        <atom:link href="{{ url($meta['link']) }}" rel="self" type="application/rss+xml" />

        @foreach($items as $item)
            <item>
                <title><![CDATA[{{ $item->title }}]]></title>
                <link>{{ $item->link }}</link>
                <description><![CDATA[{!! $item->summary !!}]]></description>
                <dc:creator><![CDATA[{{ $item->author }}]]></dc:creator>
                <pubDate>{{ $item->updated->toRssString() }}</pubDate>
                <guid>{{ $item->link }}</guid>
                <enclosure url="{{ str_replace('https', 'http', $item->enclosure) }}" length="{{ $item->enclosureLength }}" type="{{ $item->enclosureType }}" />
                <category><![CDATA[{{ is_array($item->category) ? Arr::first($item->category) : $item->category }}]]></category>
            </item>
        @endforeach
    </channel>
</rss>
