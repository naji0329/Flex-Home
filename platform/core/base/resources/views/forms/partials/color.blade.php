<div class="input-group color-picker" data-color="{{ $value ?? '#000' }}">
    {!! Form::text($name, $value ?? '#000', array_merge(['class' => 'form-control'], $attributes)) !!}
    <span class="input-group-text">
    <span class="input-group-text colorpicker-input-addon"><i></i></span>
  </span>
</div>
