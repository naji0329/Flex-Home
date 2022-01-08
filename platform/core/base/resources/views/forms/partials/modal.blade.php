<div id="{{ $name }}" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog {{ $modal_size }} @if (!$modal_size) @if (strlen($content) < 120) modal-xs @elseif (strlen($content) > 1000) modal-lg @endif @endif">
        <div class="modal-content">
            <div class="modal-header bg-{{ $type }}">
                <h4 class="modal-title"><i class="til_img"></i><strong>{!! $title !!}</strong></h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true">

                </button>
            </div>

            <div class="modal-body with-padding">
                {!! $content !!}
            </div>

            <div class="modal-footer">
                <button type="button" class="float-start btn btn-{{ $type != 'warning' ? 'warning' : 'info' }}" data-bs-dismiss="modal">{{ trans('core/base::tables.cancel') }}</button>
                <a class="float-end btn btn-{{ $type }}" id="{{ $action_id }}" href="#">{!! $action_name !!}</a>
            </div>
        </div>
    </div>
</div>
<!-- end Modal -->
