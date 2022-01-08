<section class="main-homes">
    <div class="bgheadproject hidden-xs" style="background: url('{{ theme_option('breadcrumb_background') ? RvMedia::url(theme_option('breadcrumb_background')) : Theme::asset()->url('images/banner-du-an.jpg') }}')">
        <div class="description">
            <div class="container-fluid w90">
                <h1 class="text-center">{{ __('Discover our projects') }}</h1>
                <p class="text-center">{{ theme_option('home_project_description') }}</p>
                {!! Theme::partial('breadcrumb') !!}
            </div>
        </div>
    </div>
    <div class="container-fluid w90 padtop30">
        <div class="projecthome">
            <form action="{{ route('public.projects') }}" method="get" id="ajax-filters-form">
                @include(Theme::getThemeNamespace() . '::views.real-estate.includes.search-box', ['type' => 'project', 'categories' => $categories])
                <div class="row rowm10">
                    <div class="col-md-12">
                        @include(Theme::getThemeNamespace() . '::views.real-estate.includes.filters')
                        <div class="data-listing mt-2">
                            {!! Theme::partial('real-estate.projects.items', compact('projects')) !!}
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<br>
<div class="col-sm-12">
    <nav class="d-flex justify-content-center pt-3" aria-label="Page navigation example">
        {!! $projects->withQueryString()->onEachSide(1)->links() !!}
    </nav>
</div>
<br>
<br>
