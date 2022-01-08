<div class="widget meta-boxes">
    <div class="widget-title">
        <h4><span>{{ isset($title) ? $title : trans('core/base::forms.image') }}</span></h4>
    </div>
    <div class="widget-body">
        {!! Form::mediaImage(isset($name) ? $name : 'image', $value) !!}
        {!! Form::error(isset($name) ? $name : 'image', $errors) !!}
    </div>
</div>