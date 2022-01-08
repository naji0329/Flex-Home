@extends(BaseHelper::getAdminMasterLayoutTemplate())
@section('content')
    <div class="widget meta-boxes">
        <div class="widget-title">
            <h4>&nbsp; {{ trans('plugins/translation::translation.theme-translations') }}</h4>
        </div>
        <div class="widget-body box-translation">
            @if (count(\Botble\Base\Supports\Language::getAvailableLocales()) > 0)
                {!! Form::open(['role' => 'form', 'route' => 'translations.theme-translations', 'method' => 'POST']) !!}
                    <input type="hidden" name="locale" value="{{ $group['locale'] }}">
                    <div class="row">
                        <div class="col-md-6">
                            <p>{{ trans('plugins/translation::translation.translate_from') }} <strong class="text-info">{{ $defaultLanguage ? $defaultLanguage['name'] : 'en' }}</strong> {{ trans('plugins/translation::translation.to') }} <strong class="text-info">{{ $group['name'] }}</strong></p>
                        </div>
                        <div class="col-md-6">
                            <div class="text-end">
                                @include('plugins/translation::partials.list-theme-languages-to-translate', compact('groups', 'group'))
                            </div>
                        </div>
                    </div>
                    <p class="note note-warning">{{ trans('plugins/translation::translation.theme_translations_instruction') }}</p>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>{{ $defaultLanguage ? $defaultLanguage['name'] : 'en' }}</th>
                                <th>{{ $group['name'] }}</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach ($translations as $key => $translation)
                                <tr>
                                    <td class="text-start" style="width: 50%">
                                        {!! htmlentities($key, ENT_QUOTES, 'UTF-8', false) !!}
                                    </td>
                                    <td class="text-start" style="width: 50%">
                                        <a href="#" class="editable"
                                           data-name="{{ $key }}"
                                           data-type="textarea" data-pk="{{ $group['locale'] }}" data-url="{{ route('translations.theme-translations') }}"
                                           data-title="{{ trans('plugins/translation::translation.edit_title') }}">{!! htmlentities($translation, ENT_QUOTES, 'UTF-8', false) !!}</a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                    <br>
                    <div class="form-group mb-3">
                        <button type="submit" class="btn btn-info button-save-theme-translations">{{ trans('core/base::forms.save') }}</button>
                    </div>
                {!! Form::close() !!}
            @else
                <p class="text-warning">{{ trans('plugins/translation::translation.no_other_languages') }}</p>
            @endif
        </div>
        <div class="clearfix"></div>
    </div>
@stop
