<div class="table-responsive">
    {!! $dataTable->table(compact('id', 'class'), false) !!}
</div>
@push('footer')
    {!! $dataTable->scripts() !!}
@endpush
