<div class="bgheadproject hidden-xs" style="background: url('{{ theme_option('breadcrumb_background') ? RvMedia::url(theme_option('breadcrumb_background')) : Theme::asset()->url('images/banner-du-an.jpg') }}')">
    <div class="description">
        <div class="container-fluid w90">
            <h1 class="text-center">{{ __('Careers') }}</h1>
            {!! Theme::partial('breadcrumb') !!}
        </div>
    </div>
</div>
<div class="container padtop50">
    <div class="row">
        <div class="col-sm-9">
            <h2 class="titlenews">{{ $career->name }}</h2>
            <div class="job-list">
                <div class="job-item">
                    <div class="job-header"><p><strong>{{ __('Location') }}:</strong>&nbsp;{{ $career->location }}</p>
                        <p><strong>{{ __('Salary') }}:</strong>&nbsp;{{ $career->salary }}</p>
                        <p><strong>{{ __('Posted at') }}:</strong>&nbsp;{{ $career->created_at->translatedFormat('M d, Y') }}</p></div>
                    <div class="job-content">
                        {!! clean($career->content) !!}
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            {!! dynamic_sidebar('primary_sidebar') !!}
        </div>
    </div>
</div>
<br>
<br>
