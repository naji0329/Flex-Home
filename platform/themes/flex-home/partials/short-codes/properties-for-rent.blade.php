<div class="container-fluid w90">
    <div class="homehouse padtop30 projecthome">
        <div class="row">
            <div class="col-12">
                <h2>{{ __('Properties For Rent') }}</h2>
                <p>{{ theme_option('home_description_for_properties_for_rent') }}</p>
            </div>
        </div>
        <property-component type="rent" url="{{ route('public.ajax.properties') }}"></property-component>
    </div>
</div>
