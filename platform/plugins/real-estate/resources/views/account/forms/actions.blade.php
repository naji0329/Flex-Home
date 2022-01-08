<div class="widget meta-boxes form-actions form-actions-default action-{{ $direction ?? 'horizontal' }}">
    <div class="widget-title">
        <h4>
            @if (isset($icon) && !empty($icon))
                <i class="{{ $icon }}"></i>
            @endif
            <span>{{ isset($title) ? $title : apply_filters(BASE_ACTION_FORM_ACTIONS_TITLE, trans('core/base::forms.publish')) }}</span>
        </h4>
    </div>
    <div class="widget-body">
        <div class="btn-set">
            @php do_action(BASE_ACTION_FORM_ACTIONS, 'default') @endphp
            <button type="submit" name="submit" value="save" class="btn btn-sm btn-info">
                <i class="fa fa-save"></i> {{ trans('core/base::forms.save') }}
            </button>
            @if (!isset($only_save) || $only_save == false)
                &nbsp;
                <button type="submit" name="submit" value="apply" class="btn btn-sm btn-success">
                    <i class="fa fa-check-circle"></i> {{ trans('core/base::forms.save_and_continue') }}
                </button>
            @endif
        </div>
    </div>
</div>