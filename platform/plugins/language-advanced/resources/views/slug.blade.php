<div class="form-group mb-3 @if ($errors->has('slug')) has-error @endif">
    {!! Form::permalink('slug', $object->slug, $object->slug_id, $prefix, false, [], false) !!}
    {!! Form::error('slug', $errors) !!}
</div>
