<div class="padtop70">
    <div class="box_shadow">
        <div class="container-fluid w90">
            <div class="homehouse projecthome">
                <div class="row">
                    <div class="col-12">
                        <h2>{{ __('Properties For Sale') }}</h2>
                        <p>{{ theme_option('home_description_for_properties_for_sale') }}</p>
                    </div>
                </div>
                <property-component type="sale" url="{{ route('public.ajax.properties') }}"></property-component>
            </div>
        </div>
    </div>
</div>
