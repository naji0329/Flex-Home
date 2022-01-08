<div class="gallery-images-wrapper list-images">
    @php
        $values = $values == '[null]' ? '[]' : $values;
        $attributes = isset($attributes) ? $attributes : [];
    @endphp
    @php $images = old($name, !is_array($values) ? json_decode($values) : $values); @endphp
    <div class="images-wrapper">
        <div data-name="{{ $name }}"
             class="text-center cursor-pointer js-btn-trigger-add-image default-placeholder-gallery-image @if (is_array($images) && !empty($images)) hidden @endif">
            <img src="{{ RvMedia::getDefaultImage(false) }}" alt="{{ trans('core/base::base.image') }}" width="120">
            <br>
            <p style="color:#c3cfd8">{{ trans('core/base::base.using_button') }}
                <strong>{{ trans('core/base::base.select_image') }}</strong> {{ trans('core/base::base.to_add_more_image') }}.</p>
        </div>
        <input type="hidden" name="{{ $name }}">
        <ul class="list-unstyled list-gallery-media-images @if (!is_array($images) || empty($images)) hidden @endif">
            @if (is_array($images) && !empty($images))
                @foreach($images as $image)
                    @if (!empty($image))
                        <li class="gallery-image-item-handler">
                            <div class="list-photo-hover-overlay">
                                <ul class="photo-overlay-actions">
                                    <li>
                                        <a class="mr10 btn-trigger-edit-gallery-image" data-bs-toggle="tooltip"
                                           data-placement="bottom" data-bs-original-title="{{ trans('core/base::base.change_image') }}">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="mr10 btn-trigger-remove-gallery-image" data-bs-toggle="tooltip"
                                           data-placement="bottom" data-bs-original-title="{{ trans('core/base::base.delete_image') }}">
                                            <i class="fa fa-trash"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="custom-image-box image-box">
                                <input type="hidden" name="{{ $name }}" value="{{ $image }}" class="image-data">
                                    <div class="preview-image-wrapper @if (!Arr::get($attributes, 'allow_thumb', true)) preview-image-wrapper-not-allow-thumb @endif">
                                    <img src="{{ RvMedia::getImageUrl($image, Arr::get($attributes, 'allow_thumb', true) == true ? 'thumb' : null) }}" alt="{{ trans('core/base::base.preview_image') }}"
                                         class="preview_image">
                                </div>
                            </div>
                        </li>
                    @endif
                @endforeach
            @endif
        </ul>
    </div>
    <a href="#" class="add-new-gallery-image js-btn-trigger-add-image"
       data-name="{{ $name }}">{{ trans('core/base::base.add_image') }}
    </a>
</div>

@once
    @push('footer')
        <script id="gallery_select_image_template" type="text/x-custom-template">
            <div class="list-photo-hover-overlay">
                <ul class="photo-overlay-actions">
                    <li>
                        <a class="mr10 btn-trigger-edit-gallery-image" data-bs-toggle="tooltip" data-placement="bottom"
                           data-bs-original-title="{{ trans('core/base::base.change_image') }}">
                            <i class="fa fa-edit"></i>
                        </a>
                    </li>
                    <li>
                        <a class="mr10 btn-trigger-remove-gallery-image" data-bs-toggle="tooltip" data-placement="bottom"
                           data-bs-original-title="{{ trans('core/base::base.delete_image') }}">
                            <i class="fa fa-trash"></i>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="custom-image-box image-box">
                <input type="hidden" name="__name__" class="image-data">
                <img src="{{ RvMedia::getDefaultImage(false) }}" alt="{{ trans('core/base::base.preview_image') }}" class="preview_image">
                <div class="image-box-actions">
                    <a class="btn-images" data-result="{{ $name }}" data-action="select-image">
                        {{ trans('core/base::forms.choose_image') }}
                    </a> |
                    <a class="btn_remove_image">
                        <span></span>
                    </a>
                </div>
            </div>
        </script>
    @endpush
@endonce
