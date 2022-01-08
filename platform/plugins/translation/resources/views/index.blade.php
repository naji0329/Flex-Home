@extends(BaseHelper::getAdminMasterLayoutTemplate())
@section('content')
    <div class="widget meta-boxes">
        <div class="widget-title">
            <h4>&nbsp; {{ trans('plugins/translation::translation.translations') }}</h4>
        </div>
        <div class="widget-body box-translation">
            @if (empty($group))
                {!! Form::open(['route' => 'translations.import', 'class' => 'form-inline', 'role' => 'form']) !!}
                    <div class="ui-select-wrapper d-inline-block">
                        <select name="replace" class="form-control ui-select">
                            <option value="0">{{ trans('plugins/translation::translation.append_translation') }}</option>
                            <option value="1">{{ trans('plugins/translation::translation.replace_translation') }}</option>
                        </select>
                        <svg class="svg-next-icon svg-next-icon-size-16">
                            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#select-chevron"></use>
                        </svg>
                    </div>
                    <button type="submit" class="btn btn-primary button-import-groups">{{ trans('plugins/translation::translation.import_group') }}</button>
                {!! Form::close() !!}
                <br>
            @endif
            @if (!empty($group))
                <form method="POST" action="{{ route('translations.group.publish', compact('group')) }}" class="form-inline" role="form">
                    @csrf
                    <button type="submit" class="btn btn-info button-publish-groups">{{ trans('plugins/translation::translation.publish_translations') }}</button>
                    <a href="{{ route('translations.index') }}" class="btn btn-secondary translation-back">{{ trans('plugins/translation::translation.back') }}</a>
                </form>
                <p class="text-info">{{ trans('plugins/translation::translation.export_warning') }}</p>
            @endif
            {!! Form::open(['role' => 'form']) !!}
                <div class="ui-select-wrapper">
                    <select name="group" id="group" class="form-control ui-select group-select select-search-full">
                        @foreach($groups as $key => $value)
                            <option value="{{ $key }}"{{ $key == $group ? ' selected' : '' }}>{{ $value }}</option>
                        @endforeach
                    </select>
                    <svg class="svg-next-icon svg-next-icon-size-16">
                        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#select-chevron"></use>
                    </svg>
                </div>
                <br>
            {!! Form::close() !!}
            @if (!empty($group))
                <hr>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            @foreach($locales as $locale)
                                <th>{{ $locale }}</th>
                            @endforeach
                        </tr>
                        </thead>
                        <tbody>
                        @foreach ($translations as $key => $translation)
                            <tr id="{{ $key }}">
                                @foreach($locales as $locale)
                                    @php $item = isset($translation[$locale]) ? $translation[$locale] : null @endphp
                                    <td class="text-start">
                                        <a href="#edit" class="editable status-{{ $item ? $item->status : 0 }} locale-{{ $locale }}"
                                           data-locale="{{ $locale }}" data-name="{{ $locale . '|' . $key }}"
                                           data-type="textarea" data-pk="{{ $item ? $item->id : 0 }}" data-url="{{ $editUrl }}"
                                           data-title="{{ trans('plugins/translation::translation.edit_title') }}">{!! ($item ? htmlentities($item->value, ENT_QUOTES, 'UTF-8', false) : '') !!}</a>
                                    </td>
                                @endforeach
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            @else
                <p class="text-info">{{ trans('plugins/translation::translation.choose_group_msg') }}</p>
            @endif
        </div>
        <div class="clearfix"></div>
    </div>
    @if (!empty($group))
        {!! Form::modalAction('confirm-publish-modal', trans('plugins/translation::translation.publish_translations'), 'warning', trans('plugins/translation::translation.confirm_publish_group', ['group' => $group]), 'button-confirm-publish-groups', trans('core/base::base.yes')) !!}
    @endif
@stop
