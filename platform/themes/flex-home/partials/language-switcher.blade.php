@if (is_plugin_active('language'))
    @php
        $supportedLocales = Language::getSupportedLocales();
    @endphp
    @if ($supportedLocales && count($supportedLocales) > 1)
        @php
            $languageDisplay = setting('language_display', 'all');
        @endphp

        <div class="header-deliver">/</div>

        <div class="padtop10 mb-2 language">
            @if (setting('language_switcher_display', 'dropdown') == 'dropdown')
                <div class="language-switcher-wrapper">
                    <div class="d-inline-block d-sm-none language-label">
                        {{ __('Languages') }}:
                    </div>
                    <div class="dropdown d-inline-block">
                        <button class="btn btn-secondary dropdown-toggle btn-select-language" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                            @if (($languageDisplay == 'all' || $languageDisplay == 'flag'))
                                {!! language_flag(Language::getCurrentLocaleFlag(), Language::getCurrentLocaleName()) !!}
                            @endif
                            @if (($languageDisplay == 'all' || $languageDisplay == 'name'))
                                {{ Language::getCurrentLocaleName() }}
                            @endif
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu language_bar_chooser">
                            @foreach ($supportedLocales as $localeCode => $properties)
                                @if ($localeCode != Language::getCurrentLocale())
                                    <li>
                                        <a href="{{ Language::getSwitcherUrl($localeCode, $properties['lang_code']) }}">
                                            @if (($languageDisplay == 'all' || $languageDisplay == 'flag')){!! language_flag($properties['lang_flag'], $properties['lang_name']) !!}@endif
                                            @if (($languageDisplay == 'all' || $languageDisplay == 'name'))<span>{{ $properties['lang_name'] }}</span>@endif
                                        </a>
                                    </li>
                                @endif
                            @endforeach
                        </ul>
                    </div>
                </div>
            @else
                <strong class="language-label">{{ __('Languages') }}: </strong>
                @foreach ($supportedLocales as $localeCode => $properties)
                    @if ($localeCode != Language::getCurrentLocale())
                        <a href="{{ Language::getSwitcherUrl($localeCode, $properties['lang_code']) }}">
                            @if (($languageDisplay == 'all' || $languageDisplay == 'flag')){!! language_flag($properties['lang_flag'], $properties['lang_name']) !!}@endif
                            @if (($languageDisplay == 'all' || $languageDisplay == 'name'))<span>{{ $properties['lang_name'] }}</span>@endif
                        </a> &nbsp;
                    @endif
                @endforeach
            @endif
        </div>
    @endif
@endif
