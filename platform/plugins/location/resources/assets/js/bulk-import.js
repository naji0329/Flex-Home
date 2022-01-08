$(() => {
    const alertWarning = $('.alert.alert-warning');
    if (alertWarning.length > 0) {
        _.map(alertWarning, function (el) {
            let storageAlert = localStorage.getItem('storage-alerts');
            storageAlert = storageAlert ? JSON.parse(storageAlert) : {};

            if ($(el).data('alert-id')) {
                if (storageAlert[$(el).data('alert-id')]) {
                    $(el).alert('close');
                    return;
                }
                $(el).removeClass('hidden');
            }
        });
    }

    alertWarning.on('closed.bs.alert', function (el) {
        const storage = $(el.target).data('alert-id');
        if (storage) {
            let storageAlert = localStorage.getItem('storage-alerts');
            storageAlert = storageAlert ? JSON.parse(storageAlert) : {};
            storageAlert[storage] = true;
            localStorage.setItem(
                'storage-alerts',
                JSON.stringify(storageAlert)
            );
        }
    });

    let isDownloadingTemplate = false;

    $(document).on('click', '.download-template', function (event) {
        event.preventDefault();
        if (isDownloadingTemplate) {
            return;
        }
        const $this = $(event.currentTarget);
        const extension = $this.data('extension');
        const $content = $this.html();

        $.ajax({
            url: $this.data('url'),
            method: 'POST',
            data: {
                extension,
            },
            xhrFields: {
                responseType: 'blob'
            },
            beforeSend: () => {
                $this.html($this.data('downloading'));
                $this.addClass('text-secondary');
                isDownloadingTemplate = true;
            },
            success: function (data) {
                let a = document.createElement('a');
                let url = window.URL.createObjectURL(data);
                a.href = url;
                a.download = $this.data('filename');
                document.body.append(a);
                a.click();
                a.remove();
                window.URL.revokeObjectURL(url);
            },
            error: data => {
                Botble.handleError(data);
            },
            complete: () => {
                setTimeout(() => {
                    $this.html($content);
                    $this.removeClass('text-secondary');
                    isDownloadingTemplate = false;
                }, 2000);
            }
        });
    });

    $(document).on('submit', '.form-import-data', function (event) {
        event.preventDefault();
        const $form = $(this);

        const formData = new FormData($form.get(0));

        const $button = $form.find('button[type=submit]');
        $button.prop('disabled', true).addClass('button-loading');

        const $message = $('#imported-message');
        const $listing = $('#imported-listing');
        const $show = $('.show-errors');
        const failureTemplate = $('#failure-template').html();

        $.ajax({
            url: $form.attr('action'),
            type: $form.attr('method') || 'POST',
            data: formData,
            cache: false,
            processData: false,
            contentType: false,
            dataType: 'json',
            beforeSend: () => {
                $('.main-form-message').addClass('hidden');
                $message.html('');
                $listing.html('');
            },
            success: data => {
                if (data.error) {
                    Botble.showError(data.message);
                } else {
                    Botble.showSuccess(data.message);
                }

                let result = '';
                if (data.data.failures) {
                    _.map(data.data.failures, val => {
                        result += failureTemplate.replace('__row__', val.row)
                            .replace('__attribute__', val.attribute)
                            .replace('__errors__', val.errors.join(', '));
                    });
                }

                let $class = 'alert alert-success';

                if (data.data.total_failed) {
                    if (data.data.total_success) {
                        $class = 'alert alert-warning';
                    } else {
                        $class = 'alert alert-danger';
                    }
                    $show.removeClass('hidden');
                } else {
                    $show.addClass('hidden');
                }

                $message
                    .removeClass()
                    .addClass($class)
                    .html(data.message);
                if (result) {
                    $listing.removeClass('hidden').html(result);
                }

                document.getElementById('input-group-file').value = '';
            },
            error: data => {
                Botble.handleError(data);
            },
            complete: () => {
                $button.prop('disabled', false);
                $button.removeClass('button-loading');
                $('.main-form-message').removeClass('hidden');
            }
        });
    });
});
