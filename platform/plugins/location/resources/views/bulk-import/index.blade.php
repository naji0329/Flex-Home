@extends(BaseHelper::getAdminMasterLayoutTemplate())
@section('content')
    {!! Form::open(['class' => 'form-import-data', 'files' => 'true']) !!}
        <div class="row justify-content-center">
            <div class="col-xxl-6 col-xl-8 col-lg-10 col-12">
                <div class="widget meta-boxes">
                    <div class="widget-title pl-2">
                        <h4>{{ trans('plugins/location::bulk-import.menu') }}</h4>
                    </div>
                    <div class="widget-body">
                        <div class="form-group mb-3 @if ($errors->has('type')) has-error @endif">
                            <label class="control-label required" for="type">
                                {{ __('Type') }}
                            </label>
                            {!! Form::customSelect('type', [
                                    'all'       => __('All'),
                                    'countries' => __('Countries'),
                                    'states'    => __('States'),
                                    'cities'    => __('Cities')
                                ], null, ['required' => true]) !!}
                            {!! Form::error('type', $errors) !!}
                        </div>
                        <div class="form-group mb-3 @if ($errors->has('file')) has-error @endif">
                            <label class="control-label required" for="input-group-file">
                                {{ trans('plugins/location::bulk-import.choose_file')}}
                            </label>
                            {!! Form::file('file', [
                                'required'         => true,
                                'class'            => 'form-control',
                                'id'               => 'input-group-file',
                                'aria-describedby' => 'input-group-addon',
                            ]) !!}
                            <label class="d-block mt-1 help-block" for="input-group-file">
                                {{ trans('plugins/location::bulk-import.choose_file_with_mime', ['types' =>  implode(', ', config('plugins.location.general.bulk-import.mimes', []))])}}
                            </label>

                            {!! Form::error('file', $errors) !!}
                            <div class="mt-3 text-center p-2 border bg-light">
                                <a href="#" class="download-template"
                                    data-url="{{ route('location.bulk-import.download-template') }}"
                                    data-extension="csv"
                                    data-filename="template_locations_import.csv"
                                    data-downloading="<i class='fas fa-spinner fa-spin'></i> {{ trans('plugins/location::bulk-import.downloading') }}">
                                    <i class="fas fa-file-csv"></i>
                                    {{ trans('plugins/location::bulk-import.download-csv-file') }}
                                </a> &nbsp; | &nbsp;
                                <a href="#" class="download-template"
                                    data-url="{{ route('location.bulk-import.download-template') }}"
                                    data-extension="xlsx"
                                    data-filename="template_locations_import.xlsx"
                                    data-downloading="<i class='fas fa-spinner fa-spin'></i> {{ trans('plugins/location::bulk-import.downloading') }}">
                                    <i class="fas fa-file-excel"></i>
                                    {{ trans('plugins/location::bulk-import.download-excel-file') }}
                                </a>
                            </div>
                        </div>
                        <div class="form-group mb-3 d-grid">
                            <button type="submit" class="btn btn-info"
                                    data-choose-file="{{ trans('plugins/location::bulk-import.please_choose_the_file')}}"
                                    data-loading-text="{{ trans('plugins/location::bulk-import.loading_text') }}"
                                    data-complete-text="{{ trans('plugins/location::bulk-import.imported_successfully') }}"
                                    id="input-group-addon">
                                {{ trans('plugins/location::bulk-import.start_import') }}
                            </button>
                        </div>
                    </div>
                </div>
                <div class="hidden main-form-message">
                    <p id="imported-message"></p>
                    <div class="show-errors hidden">
                        <h3 class="text-warning text-center">{{ trans('plugins/location::bulk-import.failures') }}</h3>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                  <th scope="col">#_Row</th>
                                  <th scope="col">Attribute</th>
                                  <th scope="col">Errors</th>
                                </tr>
                            </thead>
                            <tbody id="imported-listing">
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    {!! Form::close() !!}

    @if (defined('LANGUAGE_MODULE_SCREEN_NAME'))
        @php
            $supportedLocales = Language::getSupportedLocales();
        @endphp
    @endif
    <div class="widget meta-boxes">
        <div class="widget-title pl-2">
            <h4 class="text-info">{{ trans('plugins/location::bulk-import.template') }}</h4>
        </div>
        <div class="widget-body">
            <div class="table-responsive">
                <table class="table text-start table-striped table-bordered">
                    <thead>
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Slug</th>
                        <th scope="col">Abbreviation</th>
                        <th scope="col">State</th>
                        <th scope="col">Country</th>
                        <th scope="col">Import Type</th>
                        <th scope="col">Status</th>
                        <th scope="col">Order</th>
                        @if (defined('LANGUAGE_MODULE_SCREEN_NAME'))
                            @foreach ($supportedLocales as $localeCode => $properties)
                                @if ($localeCode != Language::getCurrentLocale())
                                    <th scope="col">Name {{ Str::upper($properties['lang_code']) }}</th>
                                @endif
                            @endforeach
                        @endif
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Texas</td>
                            <td></td>
                            <td>TX</td>
                            <td></td>
                            <td>United States</td>
                            <td>state</td>
                            <td>published</td>
                            <td>0</td>
                            @if (defined('LANGUAGE_MODULE_SCREEN_NAME'))
                                @foreach ($supportedLocales as $localeCode => $properties)
                                    @if ($localeCode != Language::getCurrentLocale())
                                        <td>Texas {{ Str::upper($properties['lang_code']) }}</td>
                                    @endif
                                @endforeach
                            @endif
                        </tr>
                        <tr>
                            <td>Washington</td>
                            <td></td>
                            <td>WA</td>
                            <td></td>
                            <td>United States</td>
                            <td>state</td>
                            <td>published</td>
                            <td>0</td>
                            @if (defined('LANGUAGE_MODULE_SCREEN_NAME'))
                                @foreach ($supportedLocales as $localeCode => $properties)
                                    @if ($localeCode != Language::getCurrentLocale())
                                        <td></td>
                                    @endif
                                @endforeach
                            @endif
                        </tr>
                        <tr>
                            <td>Houston</td>
                            <td>houston</td>
                            <td></td>
                            <td>Texas</td>
                            <td>United States</td>
                            <td>city</td>
                            <td>published</td>
                            <td>0</td>
                            @if (defined('LANGUAGE_MODULE_SCREEN_NAME'))
                                @foreach ($supportedLocales as $localeCode => $properties)
                                    @if ($localeCode != Language::getCurrentLocale())
                                        <td></td>
                                    @endif
                                @endforeach
                            @endif
                        </tr>
                        <tr>
                            <td>San Antonio</td>
                            <td>san-antonio</td>
                            <td></td>
                            <td>Texas</td>
                            <td>United States</td>
                            <td>city</td>
                            <td>published</td>
                            <td>0</td>
                            @if (defined('LANGUAGE_MODULE_SCREEN_NAME'))
                                @foreach ($supportedLocales as $localeCode => $properties)
                                    @if ($localeCode != Language::getCurrentLocale())
                                        <td></td>
                                    @endif
                                @endforeach
                            @endif
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="widget meta-boxes mt-4">
        <div class="widget-title pl-2">
            <h4 class="text-info">{{ trans('plugins/location::bulk-import.rules') }}</h4>
        </div>
        <div class="widget-body">
            <table class="table text-start table-bordered">
                <thead>
                    <tr>
                        <th scope="col">Column</th>
                        <th scope="col">Rules</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">Name</th>
                        <td>(required)</td>
                    </tr>
                    <tr>
                        <th scope="row">Slug</th>
                        <td>(nullable)</td>
                    </tr>
                    <tr>
                        <th scope="row">Abbreviation</th>
                        <td>(nullable|max:2)</td>
                    </tr>
                    <tr>
                        <th scope="row">State</th>
                        <td>(nullable|required_if:type,city)</td>
                    </tr>
                    <tr>
                        <th scope="row">Country</th>
                        <td>(nullable|required_if:type,state,city)</td>
                    </tr>
                    <tr>
                        <th scope="row">Import Type</th>
                        <td>(nullable|enum:country,state,city|default:state)</td>
                    </tr>
                    <tr>
                        <th scope="row">Status</th>
                        <td>(required|enum:{{ implode(',', Botble\Base\Enums\BaseStatusEnum::values()) }}|default:{{ Botble\Base\Enums\BaseStatusEnum::PUBLISHED }})</td>
                    </tr>
                    <tr>
                        <th scope="row">Order</th>
                        <td>(nullable|integer|min:0|max:127|default:0)</td>
                    </tr>
                    <tr>
                        <th scope="row">Nationality</th>
                        <td>(required_if:import_type,country|max:120)</td>
                    </tr>
                    @if (defined('LANGUAGE_MODULE_SCREEN_NAME'))
                        @foreach ($supportedLocales as $localeCode => $properties)
                            @if ($localeCode != Language::getCurrentLocale())
                                <tr>
                                    <th scope="row">Name {{ $properties['lang_code'] }}
                                        <i class="fas fa-info-circle" data-bs-toggle="tooltip" data-bs-placement="top" title="{{ trans('plugins/location::bulk-import.available_enable_multi_language') }}"></i>
                                    </th>
                                    <td>(nullable|default:{Name})</td>
                                </tr>
                            @endif
                        @endforeach
                    @endif
                </tbody>
            </table>
        </div>
    </div>
    <script type="text/x-custom-template" id="failure-template">
        <tr>
            <td scope="row">__row__</td>
            <td>__attribute__</td>
            <td>__errors__</td>
        </tr>
    </script>
@stop
