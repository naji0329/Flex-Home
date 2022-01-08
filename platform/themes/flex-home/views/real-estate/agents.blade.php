<section class="main-homes">
    <div class="bgheadproject hidden-xs" style="background: url('{{ theme_option('breadcrumb_background') ? RvMedia::url(theme_option('breadcrumb_background')) : Theme::asset()->url('images/banner-du-an.jpg') }}')">
        <div class="description">
            <div class="container-fluid w90">
                <h1 class="text-center">{{ __('Agents') }}</h1>
                {!! Theme::partial('breadcrumb') !!}
            </div>
        </div>
    </div>
    <div class="container-fluid w90 padtop30">
        <div class="rowm10">
            @if ($accounts->count())
                <div class="container-fluid">
                    <div class="row rowm10 list-agency">
                        @foreach($accounts as $account)
                            <div class="col-lg-3 col-md-4 col-sm-6">
                                {!! Theme::partial('real-estate.agents.item', compact('account')) !!}
                            </div>
                        @endforeach
                        <div class="colm10 col-sm-12">
                            <nav class="d-flex justify-content-center pt-3">
                                {!! $accounts->withQueryString()->links() !!}
                            </nav>
                        </div>
                    </div>
                </div>
            @else
                <p class="item">{{ __('0 results') }}</p>
            @endif
        </div>
    </div>
</section>
<br>
<br>
