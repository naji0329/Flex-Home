<div class="form-group mb-3">
    <label for="name" class="control-label required">{{ trans('core/base::forms.name') }}</label>
    {!! Form::text('name', old('name'), ['class' => 'form-control', 'id' => 'name', 'placeholder' => trans('core/base::forms.name'), 'data-counter' => 120]) !!}
</div>

<div class="form-group mb-3">
    <label for="description" class="control-label">{{ trans('core/base::forms.description') }}</label>
    {!! Form::textarea('description', old('description'), ['class' => 'form-control', 'rows' => 4, 'id' => 'description', 'placeholder' => trans('core/base::forms.description'), 'data-counter' => 400]) !!}
</div>
