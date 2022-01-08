@extends(BaseHelper::getAdminMasterLayoutTemplate())
@section('content')
    {!! Form::open(['route' => ['settings.media']]) !!}
    <div class="max-width-1200">
        <div class="flexbox-annotated-section">

            <div class="flexbox-annotated-section-annotation">
                <div class="annotated-section-title pd-all-20">
                    <h2>{{ trans('core/setting::setting.media.title') }}</h2>
                </div>
                <div class="annotated-section-description pd-all-20 p-none-t">
                    <p class="color-note">{{ trans('core/setting::setting.media.description') }}</p>
                </div>
            </div>

            <div class="flexbox-annotated-section-content">
                <div class="wrapper-content pd-all-20">
                    <div class="form-group mb-3">
                        <label class="text-title-field"
                               for="media_driver">{{ trans('core/setting::setting.media.driver') }}
                        </label>
                        <div class="ui-select-wrapper">
                            <select name="media_driver" class="ui-select setting-select-options" id="media_driver">
                                <option value="public" @if (config('filesystems.default') === 'public') selected @endif>Local disk</option>
                                <option value="s3" @if (config('filesystems.default') === 's3') selected @endif>Amazon S3</option>
                                <option value="do_spaces" @if (config('filesystems.default') === 'do_spaces') selected @endif>DigitalOcean Spaces</option>
                                <option value="wasabi" @if (config('filesystems.default') === 'wasabi') selected @endif>Wasabi</option>
                                <option value="bunnycdn" @if (config('filesystems.default') === 'bunnycdn') selected @endif>BunnyCDN</option>
                            </select>
                            <svg class="svg-next-icon svg-next-icon-size-16">
                                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#select-chevron"></use>
                            </svg>
                        </div>
                    </div>

                    <div data-type="s3" class="setting-wrapper @if (setting('media_driver', config('filesystems.default')) !== 's3') hidden @endif">
                        <div class="form-group mb-3">
                            <label class="text-title-field"
                                   for="media_aws_access_key_id">{{ trans('core/setting::setting.media.aws_access_key_id') }}</label>
                            <input type="text" class="next-input" name="media_aws_access_key_id" id="media_aws_access_key_id"
                                   value="{{ config('filesystems.disks.s3.key') }}" placeholder="Ex: AKIAIKYXBSNBXXXXXX">
                        </div>
                        <div class="form-group mb-3">
                            <label class="text-title-field"
                                   for="media_aws_secret_key">{{ trans('core/setting::setting.media.aws_secret_key') }}</label>
                            <input type="text" class="next-input" name="media_aws_secret_key" id="media_aws_secret_key"
                                   value="{{ config('filesystems.disks.s3.secret') }}" placeholder="Ex: +fivlGCeTJCVVnzpM2WfzzrFIMLHGhxxxxxxx">
                        </div>
                        <div class="form-group mb-3">
                            <label class="text-title-field"
                                   for="media_aws_default_region">{{ trans('core/setting::setting.media.aws_default_region') }}</label>
                            <input type="text" class="next-input" name="media_aws_default_region" id="media_aws_default_region"
                                   value="{{ config('filesystems.disks.s3.region') }}" placeholder="Ex: ap-southeast-1">
                        </div>
                        <div class="form-group mb-3">
                            <label class="text-title-field"
                                   for="media_aws_bucket">{{ trans('core/setting::setting.media.aws_bucket') }}</label>
                            <input type="text" class="next-input" name="media_aws_bucket" id="media_aws_bucket"
                                   value="{{ config('filesystems.disks.s3.bucket') }}" placeholder="Ex: botble">
                        </div>
                        <div class="form-group mb-3">
                            <label class="text-title-field"
                                   for="media_aws_url">{{ trans('core/setting::setting.media.aws_url') }}</label>
                            <input type="text" class="next-input" name="media_aws_url" id="media_aws_url"
                                   value="{{ config('filesystems.disks.s3.url') }}" placeholder="Ex: https://s3-ap-southeast-1.amazonaws.com/botble">
                        </div>
                        <div class="form-group mb-3" style="margin-bottom: 1rem;">
                            <label class="text-title-field"
                                   for="media_aws_endpoint">{{ trans('core/setting::setting.media.aws_endpoint') }}</label>
                            <input type="text" class="next-input" name="media_aws_endpoint" id="media_aws_endpoint"
                                   value="{{ config('filesystems.disks.s3.endpoint') }}" placeholder="{{ trans('core/setting::setting.media.optional') }}">
                        </div>
                    </div>

                    <div data-type="do_spaces" class="setting-wrapper @if (setting('media_driver', config('filesystems.default')) !== 'do_spaces') hidden @endif">
                        <div class="form-group mb-3">
                            <label class="text-title-field"
                                   for="media_do_spaces_access_key_id">{{ trans('core/setting::setting.media.do_spaces_access_key_id') }}</label>
                            <input type="text" class="next-input" name="media_do_spaces_access_key_id" id="media_do_spaces_access_key_id"
                                   value="{{ config('filesystems.disks.do_spaces.key') }}" placeholder="Ex: AKIAIKYXBSNBXXXXXX">
                        </div>
                        <div class="form-group mb-3">
                            <label class="text-title-field"
                                   for="media_do_spaces_secret_key">{{ trans('core/setting::setting.media.do_spaces_secret_key') }}</label>
                            <input type="text" class="next-input" name="media_do_spaces_secret_key" id="media_do_spaces_secret_key"
                                   value="{{ config('filesystems.disks.do_spaces.secret') }}" placeholder="Ex: +fivlGCeTJCVVnzpM2WfzzrFIMLHGhxxxxxxx">
                        </div>
                        <div class="form-group mb-3">
                            <label class="text-title-field"
                                   for="media_do_spaces_default_region">{{ trans('core/setting::setting.media.do_spaces_default_region') }}</label>
                            <input type="text" class="next-input" name="media_do_spaces_default_region" id="media_do_spaces_default_region"
                                   value="{{ config('filesystems.disks.do_spaces.region') }}" placeholder="Ex: SGP1">
                        </div>
                        <div class="form-group mb-3">
                            <label class="text-title-field"
                                   for="media_do_spaces_bucket">{{ trans('core/setting::setting.media.do_spaces_bucket') }}</label>
                            <input type="text" class="next-input" name="media_do_spaces_bucket" id="media_do_spaces_bucket"
                                   value="{{ config('filesystems.disks.do_spaces.bucket') }}" placeholder="Ex: botble">
                        </div>
                        <div class="form-group mb-3">
                            <label class="text-title-field"
                                   for="media_do_spaces_endpoint">{{ trans('core/setting::setting.media.do_spaces_endpoint') }}</label>
                            <input type="text" class="next-input" name="media_do_spaces_endpoint" id="media_do_spaces_endpoint"
                                   value="{{ config('filesystems.disks.do_spaces.endpoint') }}" placeholder="Ex: https://sfo2.digitaloceanspaces.com">
                        </div>
                        <div class="form-group mb-3">
                            <input type="hidden" name="media_do_spaces_cdn_enabled" value="0">
                            <label>
                                <input type="checkbox"  value="1" @if (setting('media_do_spaces_cdn_enabled')) checked @endif name="media_do_spaces_cdn_enabled">
                                {{ trans('core/setting::setting.media.do_spaces_cdn_enabled') }}
                            </label>
                        </div>
                        <div class="form-group mb-3" style="margin-bottom: 1rem;">
                            <label class="text-title-field"
                                   for="media_do_spaces_cdn_custom_domain">{{ trans('core/setting::setting.media.media_do_spaces_cdn_custom_domain') }}</label>
                            <input type="text" class="next-input" name="media_do_spaces_cdn_custom_domain" id="media_do_spaces_cdn_custom_domain"
                                   value="{{ setting('media_do_spaces_cdn_custom_domain') }}" placeholder="{{ trans('core/setting::setting.media.media_do_spaces_cdn_custom_domain_placeholder') }}">
                        </div>
                    </div>

                    <div data-type="wasabi" class="setting-wrapper @if (setting('media_driver', config('filesystems.default')) !== 'wasabi') hidden @endif">
                        <div class="form-group mb-3">
                            <label class="text-title-field"
                                   for="media_wasabi_access_key_id">{{ trans('core/setting::setting.media.wasabi_access_key_id') }}</label>
                            <input type="text" class="next-input" name="media_wasabi_access_key_id" id="media_wasabi_access_key_id"
                                   value="{{ config('filesystems.disks.wasabi.key') }}" placeholder="Ex: AKIAIKYXBSNBXXXXXX">
                        </div>
                        <div class="form-group mb-3">
                            <label class="text-title-field"
                                   for="media_wasabi_secret_key">{{ trans('core/setting::setting.media.wasabi_secret_key') }}</label>
                            <input type="text" class="next-input" name="media_wasabi_secret_key" id="media_wasabi_secret_key"
                                   value="{{ config('filesystems.disks.wasabi.secret') }}" placeholder="Ex: +fivlGCeTJCVVnzpM2WfzzrFIMLHGhxxxxxxx">
                        </div>
                        <div class="form-group mb-3">
                            <label class="text-title-field"
                                   for="media_wasabi_default_region">{{ trans('core/setting::setting.media.wasabi_default_region') }}</label>
                            <input type="text" class="next-input" name="media_wasabi_default_region" id="media_wasabi_default_region"
                                   value="{{ config('filesystems.disks.wasabi.region') }}" placeholder="Ex: us-east-1">
                        </div>
                        <div class="form-group mb-3">
                            <label class="text-title-field"
                                   for="media_wasabi_bucket">{{ trans('core/setting::setting.media.wasabi_bucket') }}</label>
                            <input type="text" class="next-input" name="media_wasabi_bucket" id="media_wasabi_bucket"
                                   value="{{ config('filesystems.disks.wasabi.bucket') }}" placeholder="Ex: botble">
                        </div>
                        <div class="form-group mb-3">
                            <label class="text-title-field"
                                   for="media_wasabi_root">{{ trans('core/setting::setting.media.wasabi_root') }}</label>
                            <input type="text" class="next-input" name="media_wasabi_root" id="media_wasabi_root"
                                   value="{{ config('filesystems.disks.wasabi.root') }}" placeholder="Default: /">
                        </div>
                    </div>

                    <div data-type="bunnycdn" class="setting-wrapper @if (setting('media_driver', config('filesystems.default')) !== 'bunnycdn') hidden @endif">
                        <div class="form-group mb-3">
                            <label class="text-title-field"
                                   for="media_bunnycdn_hostname">{{ trans('core/setting::setting.media.bunnycdn_hostname') }}</label>
                            <input type="text" class="next-input" name="media_bunnycdn_hostname" id="media_bunnycdn_hostname"
                                   value="{{ setting('media_bunnycdn_hostname') }}" placeholder="Ex: botble.b-cdn.net">
                        </div>
                        <div class="form-group mb-3">
                            <label class="text-title-field"
                                   for="media_bunnycdn_zone">{{ trans('core/setting::setting.media.bunnycdn_zone') }}</label>
                            <input type="text" class="next-input" name="media_bunnycdn_zone" id="media_bunnycdn_zone"
                                   value="{{ setting('media_bunnycdn_zone') }}" placeholder="Ex: botble">
                        </div>
                        <div class="form-group mb-3">
                            <label class="text-title-field"
                                   for="media_bunnycdn_key">{{ trans('core/setting::setting.media.bunnycdn_key') }}</label>
                            <input type="text" class="next-input" name="media_bunnycdn_key" id="media_bunnycdn_key"
                                   value="{{ setting('media_bunnycdn_key') }}" placeholder="Ex: 9a734df7-844b-...">
                        </div>
                        <div class="form-group mb-3">
                            <label class="text-title-field"
                                   for="media_bunnycdn_region">{{ trans('core/setting::setting.media.bunnycdn_region') }}</label>
                            <div class="ui-select-wrapper">
                                <select name="media_bunnycdn_region" class="ui-select">
                                    <option value="" @if (setting('media_bunnycdn_region') === '') selected @endif>Falkenstein</option>
                                    <option value="ny" @if (setting('media_bunnycdn_region') === 'ny') selected @endif>New York</option>
                                    <option value="la" @if (setting('media_bunnycdn_region') === 'la') selected @endif>Los Angeles</option>
                                    <option value="sg" @if (setting('media_bunnycdn_region') === 'sg') selected @endif>Singapore</option>
                                    <option value="syd" @if (setting('media_bunnycdn_region') === 'syd') selected @endif>Sydney</option>
                                </select>
                                <svg class="svg-next-icon svg-next-icon-size-16">
                                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#select-chevron"></use>
                                </svg>
                            </div>
                        </div>
                    </div>

                    <div class="form-group mb-3">
                        <label class="text-title-field"
                               for="media_turn_off_automatic_url_translation_into_latin">{{ trans('core/setting::setting.media.turn_off_automatic_url_translation_into_latin') }}
                        </label>
                        <label class="me-2">
                            <input type="radio" name="media_turn_off_automatic_url_translation_into_latin"
                                   value="1"
                                   @if (RvMedia::turnOffAutomaticUrlTranslationIntoLatin()) checked @endif>{{ trans('core/setting::setting.general.yes') }}
                        </label>
                        <label>
                            <input type="radio" name="media_turn_off_automatic_url_translation_into_latin"
                                   value="0"
                                   @if (!RvMedia::turnOffAutomaticUrlTranslationIntoLatin()) checked @endif>{{ trans('core/setting::setting.general.no') }}
                        </label>
                    </div>

                    <div class="form-group mb-3">
                        <label class="text-title-field"
                               for="media_default_placeholder_image">{{ trans('core/setting::setting.media.default_placeholder_image') }}
                        </label>
                        {!! Form::mediaImage('media_default_placeholder_image', setting('media_default_placeholder_image')) !!}
                    </div>

                    <div class="form-group mb-3">
                        <label class="text-title-field"
                               for="media_chunk_enabled">{{ trans('core/setting::setting.media.enable_chunk') }}
                        </label>
                        <label class="me-2">
                            <input type="radio" name="media_chunk_enabled"
                                   value="1"
                                   @if (RvMedia::isChunkUploadEnabled()) checked @endif>{{ trans('core/setting::setting.general.yes') }}
                        </label>
                        <label>
                            <input type="radio" name="media_chunk_enabled"
                                   value="0"
                                   @if (!RvMedia::isChunkUploadEnabled()) checked @endif>{{ trans('core/setting::setting.general.no') }}
                        </label>
                    </div>

                    <div class="form-group mb-3">
                        <label class="text-title-field"
                               for="media_chunk_size">{{ trans('core/setting::setting.media.chunk_size') }}</label>
                        <input type="number" class="next-input" name="media_chunk_size" id="media_chunk_size"
                               value="{{ setting('media_chunk_size', RvMedia::getConfig('chunk.chunk_size')) }}" placeholder="{{ trans('core/setting::setting.media.chunk_size_placeholder') }}">
                    </div>

                    <div class="form-group mb-3">
                        <label class="text-title-field"
                               for="media_max_file_size">{{ trans('core/setting::setting.media.max_file_size') }}</label>
                        <input type="number" class="next-input" name="media_max_file_size" id="media_max_file_size"
                               value="{{ setting('media_max_file_size', RvMedia::getConfig('chunk.max_file_size')) }}" placeholder="{{ trans('core/setting::setting.media.max_file_size_placeholder') }}">
                    </div>

                    <div class="form-group mb-3">
                        <label class="text-title-field"
                               for="media_watermark_enabled">{{ trans('core/setting::setting.media.enable_watermark') }}
                        </label>
                        <label class="me-2">
                            <input type="radio" name="media_watermark_enabled"
                                   value="1"
                                   @if (setting('media_watermark_enabled', RvMedia::getConfig('watermark.enabled'))) checked @endif>{{ trans('core/setting::setting.general.yes') }}
                        </label>
                        <label>
                            <input type="radio" name="media_watermark_enabled"
                                   value="0"
                                   @if (!setting('media_watermark_enabled', RvMedia::getConfig('watermark.enabled'))) checked @endif>{{ trans('core/setting::setting.general.no') }}
                        </label>
                    </div>

                    <div class="form-group mb-3">
                        <label class="text-title-field"
                               for="media_watermark_source">{{ trans('core/setting::setting.media.watermark_source') }}
                        </label>
                        {!! Form::mediaImage('media_watermark_source', setting('media_watermark_source')) !!}
                    </div>

                    <div class="form-group mb-3">
                        <label class="text-title-field"
                               for="media_watermark_size">{{ trans('core/setting::setting.media.watermark_size') }}</label>
                        <input type="number" class="next-input" name="media_watermark_size" id="media_watermark_size"
                               value="{{ setting('media_watermark_size', RvMedia::getConfig('watermark.size')) }}" placeholder="{{ trans('core/setting::setting.media.watermark_size_placeholder') }}">
                    </div>

                    <div class="form-group mb-3">
                        <label class="text-title-field"
                               for="watermark_opacity">{{ trans('core/setting::setting.media.watermark_opacity') }}</label>
                        <input type="number" class="next-input" name="watermark_opacity" id="watermark_opacity"
                               value="{{ setting('watermark_opacity', RvMedia::getConfig('watermark.opacity')) }}" placeholder="{{ trans('core/setting::setting.media.watermark_opacity_placeholder') }}">
                    </div>

                    <div class="form-group mb-3">
                        <label class="text-title-field" for="media_watermark_position">{{ trans('core/setting::setting.media.watermark_position') }}</label>
                        <div class="ui-select-wrapper">
                            <select name="media_watermark_position" class="ui-select" id="media_watermark_position">
                                <option value="top-left" @if (setting('media_watermark_position', RvMedia::getConfig('watermark.position')) == 'top-left' ) selected @endif>{{ trans('core/setting::setting.media.watermark_position_top_left') }}</option>
                                <option value="top-right" @if (setting('media_watermark_position', RvMedia::getConfig('watermark.position')) == 'top-right' ) selected @endif>{{ trans('core/setting::setting.media.watermark_position_top_right') }}</option>
                                <option value="bottom-left" @if (setting('media_watermark_position', RvMedia::getConfig('watermark.position')) == 'bottom-left' ) selected @endif>{{ trans('core/setting::setting.media.watermark_position_bottom_left') }}</option>
                                <option value="bottom-right" @if (setting('media_watermark_position', RvMedia::getConfig('watermark.position')) == 'bottom-right' ) selected @endif>{{ trans('core/setting::setting.media.watermark_position_bottom_right') }}</option>
                                <option value="center" @if (setting('media_watermark_position', RvMedia::getConfig('watermark.position')) == 'center' ) selected @endif>{{ trans('core/setting::setting.media.watermark_position_center') }}</option>
                            </select>
                            <svg class="svg-next-icon svg-next-icon-size-16">
                                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#select-chevron"></use>
                            </svg>
                        </div>
                    </div>

                    <div class="form-group mb-3">
                        <label class="text-title-field"
                               for="watermark_position_x">{{ trans('core/setting::setting.media.watermark_position_x') }}</label>
                        <input type="number" class="next-input" name="watermark_position_x" id="watermark_position_x"
                               value="{{ setting('watermark_position_x', RvMedia::getConfig('watermark.x')) }}" placeholder="{{ trans('core/setting::setting.media.watermark_position_x') }}">
                    </div>

                    <div class="form-group mb-3">
                        <label class="text-title-field"
                               for="watermark_position_y">{{ trans('core/setting::setting.media.watermark_position_y') }}</label>
                        <input type="number" class="next-input" name="watermark_position_y" id="watermark_position_y"
                               value="{{ setting('watermark_position_y', RvMedia::getConfig('watermark.y')) }}" placeholder="{{ trans('core/setting::setting.media.watermark_position_y') }}">
                    </div>

                </div>
            </div>

        </div>

        <div class="flexbox-annotated-section" style="border: none">
            <div class="flexbox-annotated-section-annotation">
                &nbsp;
            </div>
            <div class="flexbox-annotated-section-content">
                <button class="btn btn-info" type="submit">{{ trans('core/setting::setting.save_settings') }}</button>
            </div>
        </div>
    </div>
    {!! Form::close() !!}
@endsection
