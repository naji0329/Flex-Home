@if (is_plugin_active('blog'))
    <h5 class="padtop40 titlenewnews">{{ $config['name'] }}</h5>

    @foreach (get_recent_posts($config['number_display']) as $post)
        <div class="mb-4 w-100 float-left lastestnews">
            <a href="{{ $post->url }}" class="text-dark">
                <img class="img-thumbnail float-left mr-2" data-src="{{ RvMedia::getImageUrl($post->image, 'thumb', false, RvMedia::getDefaultImage()) }}" src="{{ RvMedia::getImageUrl($post->image, 'thumb', false, RvMedia::getDefaultImage()) }}" width="90" alt="{{ $post->name }}">
                {{ $post->name }}
            </a>
        </div>
    @endforeach
@endif
