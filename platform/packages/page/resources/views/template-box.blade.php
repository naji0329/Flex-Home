<div class="widget meta-boxes">
    <div class="widget-title">
        <h4><span>{{ trans('core/base::forms.template') }}</span></h4>
    </div>
    <div class="widget-body">
        <div class="form-group mb-3 @if ($errors->has('template')) has-error @endif">
            <div class="ui-select-wrapper">
                {!! Form::select('template', $templates, $selected, ['class' => 'ui-select', 'id' => 'template']) !!}
                <svg class="svg-next-icon svg-next-icon-size-16">
                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#select-chevron"></use>
                </svg>
            </div>
            {!! Form::error('template', $errors) !!}
        </div>
    </div>
</div>
