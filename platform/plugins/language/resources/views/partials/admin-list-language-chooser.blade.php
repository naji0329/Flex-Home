@php
$languages = Language::getActiveLanguage(['lang_id', 'lang_name', 'lang_code', 'lang_flag']);
@endphp

@if (count($languages) > 1)
    <span class="admin-list-language-chooser">
        <span>{{ trans('plugins/language::language.translations') }}: </span>
        @foreach ($languages as $language)
            @if ($language->lang_code !== Language::getCurrentAdminLocaleCode())
                <span>
                    {!! language_flag($language->lang_flag, $language->lang_name) !!}
                    <a href="{{ route($route, $language->lang_code == Language::getDefaultLocaleCode() ? [] : ['ref_lang' => $language->lang_code]) }}">{{ $language->lang_name }}</a>
                </span>&nbsp;
            @endif
        @endforeach
        <input type="hidden" name="ref_lang" value="{{ request()->input('ref_lang') }}">
    </span>
@endif
