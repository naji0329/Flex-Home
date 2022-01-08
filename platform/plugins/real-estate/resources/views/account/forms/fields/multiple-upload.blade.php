@if ($showLabel && $showField)
    @if ($options['wrapper'] !== false)
        <div {!! $options['wrapperAttrs'] !!}>
            @endif
            @endif

            @if ($showLabel && $options['label'] !== false && $options['label_show'])
                {!! Form::customLabel($name, $options['label'], $options['label_attr']) !!}
            @endif

            @if ($showField)
                {!! Form::hidden($name, $options['value'] ? json_encode($options['value']) : null, $options['attr']) !!}
                <div id="multiple-upload" class="dropzone needsclick">
                    <div class="dz-message needsclick">
                        {{ trans('plugins/real-estate::property.form.images_upload_placeholder') }}<br>
                    </div>
                </div>
                @include('core/base::forms.partials.help-block')
            @endif

            @include('core/base::forms.partials.errors')

            @if ($showLabel && $showField)
                @if ($options['wrapper'] !== false)
        </div>
    @endif

    <div id="preview-template" style="display: none;">
        <div class="dz-preview dz-file-preview">
            <div class="dz-image"><img data-dz-thumbnail="" /></div>
            <div class="dz-details">
                <div class="dz-size"><SPAN data-dz-size=""></SPAN></div>
                <div class="dz-filename"><SPAN data-dz-name=""></SPAN></div></div>
            <div class="dz-progress"><SPAN class="dz-upload"
                                           data-dz-uploadprogress=""></SPAN></div>
            <div class="dz-error-message"><SPAN data-dz-errormessage=""></SPAN></div>
            <div class="dz-success-mark">
                <svg width="54px" height="54px" viewBox="0 0 54 54" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:sketch="http://www.bohemiancoding.com/sketch/ns">
                    <title>Check</title>
                    <defs></defs>
                    <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" sketch:type="MSPage">
                        <path d="M23.5,31.8431458 L17.5852419,25.9283877 C16.0248253,24.3679711 13.4910294,24.366835 11.9289322,25.9289322 C10.3700136,27.4878508 10.3665912,30.0234455 11.9283877,31.5852419 L20.4147581,40.0716123 C20.5133999,40.1702541 20.6159315,40.2626649 20.7218615,40.3488435 C22.2835669,41.8725651 24.794234,41.8626202 26.3461564,40.3106978 L43.3106978,23.3461564 C44.8771021,21.7797521 44.8758057,19.2483887 43.3137085,17.6862915 C41.7547899,16.1273729 39.2176035,16.1255422 37.6538436,17.6893022 L23.5,31.8431458 Z M27,53 C41.3594035,53 53,41.3594035 53,27 C53,12.6405965 41.3594035,1 27,1 C12.6405965,1 1,12.6405965 1,27 C1,41.3594035 12.6405965,53 27,53 Z" id="Oval-2" stroke-opacity="0.198794158" stroke="#747474" fill-opacity="0.816519475" fill="#FFFFFF" sketch:type="MSShapeGroup"></path>
                    </g>
                </svg>
            </div>
            <div class="dz-error-mark">
                <svg width="54px" height="54px" viewBox="0 0 54 54" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:sketch="http://www.bohemiancoding.com/sketch/ns">
                    <title>error</title>
                    <defs></defs>
                    <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" sketch:type="MSPage">
                        <g id="Check-+-Oval-2" sketch:type="MSLayerGroup" stroke="#747474" stroke-opacity="0.198794158" fill="#FFFFFF" fill-opacity="0.816519475">
                            <path d="M32.6568542,29 L38.3106978,23.3461564 C39.8771021,21.7797521 39.8758057,19.2483887 38.3137085,17.6862915 C36.7547899,16.1273729 34.2176035,16.1255422 32.6538436,17.6893022 L27,23.3431458 L21.3461564,17.6893022 C19.7823965,16.1255422 17.2452101,16.1273729 15.6862915,17.6862915 C14.1241943,19.2483887 14.1228979,21.7797521 15.6893022,23.3461564 L21.3431458,29 L15.6893022,34.6538436 C14.1228979,36.2202479 14.1241943,38.7516113 15.6862915,40.3137085 C17.2452101,41.8726271 19.7823965,41.8744578 21.3461564,40.3106978 L27,34.6568542 L32.6538436,40.3106978 C34.2176035,41.8744578 36.7547899,41.8726271 38.3137085,40.3137085 C39.8758057,38.7516113 39.8771021,36.2202479 38.3106978,34.6538436 L32.6568542,29 Z M27,53 C41.3594035,53 53,41.3594035 53,27 C53,12.6405965 41.3594035,1 27,1 C12.6405965,1 1,12.6405965 1,27 C1,41.3594035 12.6405965,53 27,53 Z" id="Oval-2" sketch:type="MSShapeGroup"></path>
                        </g>
                    </g>
                </svg>
            </div>
        </div>
    </div>
@endif

@push('scripts')
    <style>
        .dropzone {
            border-radius: 5px;
            border: 1px dashed rgb(0, 135, 247);
        }
        .dropzone .dz-preview:not(.dz-processing) .dz-progress {
            display: none;
        }

        .dropzone .dz-message {
            margin : 50px 0;
        }
    </style>
    <script>
        'use strict';
        Dropzone.autoDiscover = false;

        var uploadedImages = [];

        var dropzone = new Dropzone('#multiple-upload', {
            previewTemplate: document.querySelector('#preview-template').innerHTML,
            parallelUploads: 1,
            thumbnailHeight: 120,
            thumbnailWidth: 120,
            addRemoveLinks: true,
            filesizeBase: 1000,
            uploadMultiple: {{ setting('media_chunk_enabled') == '1' ? 'false' : 'true' }},
            chunking: {{ setting('media_chunk_enabled') == '1' ? 'true' : 'false' }},
            forceChunking: true, // forces chunking when file.size < chunkSize
            parallelChunkUploads: false, // allows chunks to be uploaded in parallel (this is independent of the parallelUploads option)
            chunkSize: {{ setting('media_chunk_size', config('core.media.media.chunk.chunk_size')) }}, // chunk size 1,000,000 bytes (~1MB)
            retryChunks: true, // retry chunks on failure
            retryChunksLimit: 3, // retry maximum of 3 times (default is 3)
            timeout: 0, // MB,
            maxFilesize: {{ setting('media_chunk_enabled') == '1' ? setting('media_chunk_size', config('core.media.media.chunk.chunk_size')) : 2 }}, // MB
            maxFiles: null, // max files upload,
            paramName: 'file',
            acceptedFiles: 'image/*',
            url: '{{ route('public.account.upload') }}',
            sending: function(file, xhr, formData) {
                formData.append('_token', '{{ csrf_token() }}');
            },
            thumbnail: function(file, dataUrl) {
                if (file.previewElement) {
                    file.previewElement.classList.remove('dz-file-preview');
                    var images = file.previewElement.querySelectorAll('[data-dz-thumbnail]');
                    for (var i = 0; i < images.length; i++) {
                        var thumbnailElement = images[i];
                        thumbnailElement.alt = file.name;
                        thumbnailElement.src = dataUrl;
                    }
                    setTimeout(function() { file.previewElement.classList.add('dz-image-preview'); }, 1);
                }
            },
            success: function (file, response) {
                if (response.error) {
                    Botble.showError(response.message);
                } else {
                    if ({{ setting('media_chunk_enabled') == '1' ? 'true' : 'false' }}) {
                        response = JSON.parse(file.xhr.response);
                    }
                    uploadedImages.push(response.data.url);
                    $('input[name={{ $name }}]').val(JSON.stringify(uploadedImages));
                }
            },
            removedfile: function(file) {
                var x = confirm('Do you want to delete this image?');
                if (!x)  {
                    return false;
                }
                var i = $(file.previewElement).index() - 1;
                dropzone.options.maxFiles = dropzone.options.maxFiles + 1;
                uploadedImages.splice(i, 1);
                $('input[name={{ $name }}]').val(JSON.stringify(uploadedImages));
                $('.dz-message.needsclick').hide();
                if (uploadedImages.length === 0) {
                    $('.dz-message.needsclick').show();
                }

                var _ref;
                return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
            }
        });

        var files = [];
        @foreach($options['value'] as $item)
            uploadedImages.push('{{ $item }}');
            files.push({name: '{{ File::name($item) }}', size: '{{ Storage::exists($item) ? Storage::size($item) : 0 }}', url: '{{ $item }}', full_url: '{{ RvMedia::getImageUrl($item, 'thumb') }}'});
        @endforeach

        $.each(files, function(key, file) {
            dropzone.options.addedfile.call(dropzone, file);
            dropzone.options.thumbnail.call(dropzone, file, file.full_url);
        });
    </script>
@endpush
