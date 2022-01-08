<div class="image-box attachment-wrapper">
    <input type="hidden" name="{{ $name }}" value="{{ $value }}" class="attachment-url">
    <div class="attachment-details">
        <a href="{{ $value }}" target="_blank">{{ $value }}</a>
    </div>
    <div class="image-box-actions">
        <a href="#" class="btn_gallery" data-result="{{ $name }}" data-action="{{ $attributes['action'] ?? 'attachment' }}">
            {{ trans('core/base::forms.choose_file') }}
        </a> |
        <a href="#" class="text-danger btn_remove_attachment">
            {{ trans('core/base::forms.remove_file') }}
        </a>
    </div>
</div>
