@php
    use Botble\RealEstate\Enums\ProjectStatusEnum;
    use Botble\RealEstate\Repositories\Interfaces\ProjectInterface;

    $projects = collect([]);

    if (is_plugin_active('real-estate')) {
        $projects = app(ProjectInterface::class)->advancedGet([
            'condition' => [
                're_projects.is_featured' => true,
                ['re_projects.status', 'NOT_IN', [ProjectStatusEnum::NOT_AVAILABLE]],
            ],
            'take'      => (int)theme_option('number_of_featured_projects', 4),
            'with'      => RealEstateHelper::getProjectRelationsQuery(),
            'order_by' => ['re_projects.created_at' => 'DESC'],
        ]);
     }
@endphp
@if ($projects->count())
    <div class="box_shadow" style="margin-top: 0;">
        <div class="container-fluid w90">
            <div class="projecthome">
                <div class="row">
                    <div class="col-12">
                        <h2>{{ __('Featured projects') }}</h2>
                        <p style="margin: 0; margin-bottom: 10px">{{ theme_option('home_project_description') }}</p>
                    </div>
                </div>
                <div class="row rowm10">
                    @foreach ($projects as $project)
                        <div class="col-6 col-sm-4  col-md-3 colm10">
                            {!! Theme::partial('real-estate.projects.item', compact('project')) !!}
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
@endif
