<div class="table-actions">
    @if (!empty($edit))
        <a href="{{ route($edit, $item->id) }}" class="btn btn-icon btn-sm btn-primary" data-original-title="{{ trans('core/base::tables.edit') }}"><i class="fa fa-edit"></i></a>
    @endif

    @if (!empty($delete))
        <a href="#" class="btn btn-icon btn-sm btn-danger deleteDialog" data-section="{{ route($delete, $item->id) }}" role="button" data-original-title="{{ trans('core/base::tables.delete_entry') }}" >
            <i class="fa fa-trash"></i>
        </a>
    @endif

    <a href="#" class="btn btn-icon btn-sm btn-info button-renew" data-section="{{ route('public.account.properties.renew', $item->id) }}" role="button" data-original-title="{{ __('Renew') }}" >
        <i class="fas fa-sync-alt"></i>
    </a>
</div>
