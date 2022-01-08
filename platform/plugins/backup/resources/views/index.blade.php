@extends(BaseHelper::getAdminMasterLayoutTemplate())
@section('content')
    <div class="clearfix"></div>
    @if (!function_exists('proc_open'))
        <div class="note note-warning">
            <p>{!! clean(trans('plugins/backup::backup.proc_open_disabled_error')) !!}</p>
        </div>
    @endif

    <div class="note note-warning">
        <p>- {!! clean(trans('plugins/backup::backup.important_message1')) !!}</p>
        <p>- {!! clean(trans('plugins/backup::backup.important_message2')) !!}</p>
        <p>- {!! clean(trans('plugins/backup::backup.important_message3')) !!}</p>
        <p>- {!! clean(trans('plugins/backup::backup.important_message4')) !!}</p>
    </div>

    @if (auth()->user()->hasPermission('backups.create'))
        <p><button class="btn btn-primary" id="generate_backup">{{ trans('plugins/backup::backup.generate_btn') }}</button></p>
    @endif

    <table class="table table-striped" id="table-backups">
        <thead>
            <tr>
                <th>{{ trans('core/base::tables.name') }}</th>
                <th>{{ trans('core/base::tables.description') }}</th>
                <th>{{ trans('plugins/backup::backup.size') }}</th>
                <th>{{ trans('core/base::tables.created_at') }}</th>
                <th>{{ trans('core/table::table.operations') }}</th>
            </tr>
        </thead>
        <tbody>
            @if (count($backups) > 0)
                @foreach($backups as $key => $backup)
                    @include('plugins/backup::partials.backup-item', ['data' => $backup, 'backupManager' => $backupManager, 'key' => $key, 'odd' => $loop->index % 2 == 0])
                @endforeach
            @else
                <tr class="text-center no-backup-row">
                    <td colspan="5">{{ trans('plugins/backup::backup.no_backups') }}</td>
                </tr>
            @endif
        </tbody>
    </table>

    @if (auth()->user()->hasPermission('backups.create'))
        {!! Form::modalAction('create-backup-modal', trans('plugins/backup::backup.create'), 'info', view('plugins/backup::partials.create')->render(), 'create-backup-button', trans('plugins/backup::backup.create_btn')) !!}
        <div data-route-create="{{ route('backups.create') }}"></div>
    @endif

    @if (auth()->user()->hasPermission('backups.restore'))
        {!! Form::modalAction('restore-backup-modal', trans('plugins/backup::backup.restore'), 'info', trans('plugins/backup::backup.restore_confirm_msg'), 'restore-backup-button', trans('plugins/backup::backup.restore_btn')) !!}
    @endif

    @include('core/table::modal')
@stop
