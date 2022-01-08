<div class="bgheadproject hidden-xs" style="background: url('{{ theme_option('breadcrumb_background') ? RvMedia::url(theme_option('breadcrumb_background')) : Theme::asset()->url('images/banner-du-an.jpg') }}')">
    <div class="description">
        <div class="container-fluid w90 text-center">
            <h1>{{ $tag->name }}</h1>
            <p>{{ $tag->description }}</p>
            {!! Theme::partial('breadcrumb') !!}
        </div>
    </div>
</div>
<div class="container padtop50">
    <div class="row">
        <div class="col-sm-9">
            <div class="blog-container" style="margin-top: 15px;">
                <div class="row">
                    @foreach($posts as $post)
                        <div class="col-md-6 col-sm-6 container-grid" style="margin-bottom: 30px;">
                            <div class="grid-in">
                                <div class="grid-shadow">
                                    <div class="hourseitem" style="margin-top: 0;">
                                        <div class="blii">
                                            <div class="img">
                                                <img
                                                    data-src="{{ RvMedia::getImageUrl($post->image, 'small', false, RvMedia::getDefaultImage()) }}"
                                                    src="{{ RvMedia::getImageUrl($post->image, 'small', false, RvMedia::getDefaultImage()) }}"
                                                    alt="{{ $post->name }}" class="thumb"
                                                    style="border-radius: 0;"></div>
                                            <a href="{{ $post->url }}" title="{{ $post->name }}" class="linkdetail"></a></div>
                                    </div>
                                    <div class="grid-h" data-mh="blog-post">
                                        <div class="blog-title">
                                            <a href="{{ $post->url }}" title="{{ $post->name }}"><h2>{{ $post->name }}</h2></a>
                                            {!! Theme::partial('post-meta', compact('post')) !!}
                                        </div>
                                        <div class="blog-excerpt">
                                            <p>{{ Str::words($post->description, 50) }}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
            <br>
            <div class="pagination">
                {!! $posts->withQueryString()->links() !!}
            </div>
        </div>
        <div class="col-sm-3">
            {!! dynamic_sidebar('primary_sidebar') !!}
        </div>
    </div>
</div>
<br>
<br>
