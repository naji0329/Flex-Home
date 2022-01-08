@extends('core/base::errors.master')

@section('content')

    <div class="m-50">
        <div class="col-md-10">
            <h3>{{ trans('core/base::errors.401_title') }}</h3>
            <p>{{ trans('core/base::errors.reasons') }}</p>
            <ul>
                {!! clean(trans('core/base::errors.401_msg')) !!}
            </ul>

            <p>{!! clean(trans('core/base::errors.try_again')) !!}</p>
        </div>
    </div>

@stop
