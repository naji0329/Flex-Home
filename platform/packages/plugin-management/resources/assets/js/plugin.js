class PluginManagement {
    init() {
        $('#plugin-list').on('click', '.btn-trigger-change-status', event =>  {
            event.preventDefault();
            let _self = $(event.currentTarget);
            _self.addClass('button-loading');

            $.ajax({
                url: route('plugins.change.status', {name: _self.data('plugin')}),
                type: 'PUT',
                success: data =>  {
                    if (data.error) {
                        Botble.showError(data.message);
                    } else {
                        Botble.showSuccess(data.message);
                        $('#plugin-list #app-' + _self.data('plugin')).load(window.location.href + ' #plugin-list #app-' + _self.data('plugin') + ' > *');
                        window.location.reload();
                    }
                    _self.removeClass('button-loading');
                },
                error: data =>  {
                    Botble.handleError(data);
                    _self.removeClass('button-loading');
                }
            });
        });

        $(document).on('click', '.btn-trigger-remove-plugin', event =>  {
            event.preventDefault();
            $('#confirm-remove-plugin-button').data('plugin', $(event.currentTarget).data('plugin'));
            $('#remove-plugin-modal').modal('show');
        });

        $(document).on('click', '#confirm-remove-plugin-button', event =>  {
            event.preventDefault();
            let _self = $(event.currentTarget);
            _self.addClass('button-loading');

            $.ajax({
                url: route('plugins.remove', {plugin: _self.data('plugin')}),
                type: 'DELETE',
                success: data =>  {
                    if (data.error) {
                        Botble.showError(data.message);
                    } else {
                        Botble.showSuccess(data.message);
                        window.location.reload();
                    }
                    _self.removeClass('button-loading');
                    $('#remove-plugin-modal').modal('hide');
                },
                error: data =>  {
                    Botble.handleError(data);
                    _self.removeClass('button-loading');
                    $('#remove-plugin-modal').modal('hide');
                }
            });
        });
    }
}

$(document).ready(() => {
    new PluginManagement().init();
});
