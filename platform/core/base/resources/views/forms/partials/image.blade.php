<div class="image-box">
    <input type="hidden" name="{{ $name }}" value="{{ $value }}" class="image-data">
    <div class="preview-image-wrapper @if (!Arr::get($attributes, 'allow_thumb', true)) preview-image-wrapper-not-allow-thumb @endif">
        <img src="{{ RvMedia::getImageUrl($value, Arr::get($attributes, 'allow_thumb', true) == true ? 'thumb' : null, false, RvMedia::getDefaultImage()) }}" alt="{{ trans('core/base::base.preview_image') }}" class="preview_image" @if (Arr::get($attributes, 'allow_thumb', true)) width="150" @endif>
        <a class="btn_remove_image" title="{{ trans('core/base::forms.remove_image') }}">
            <i class="fa fa-times"></i>
        </a>
    </div>
    <div class="image-box-actions">
        <a href="#" class="btn_gallery" data-result="{{ $name }}" data-action="{{ $attributes['action'] ?? 'select-image' }}">
            {{ trans('core/base::forms.choose_image') }}
        </a>
    </div>
</div>
