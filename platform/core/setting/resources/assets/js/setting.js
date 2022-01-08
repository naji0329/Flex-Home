import LicenseComponent from './components/LicenseComponent';
import Vue from 'vue';

if (document.getElementById('main-settings')) {
    Vue.component('license-component', LicenseComponent);

    new Vue({
        el: '#main-settings',
    });
}

class SettingManagement {
    init() {
        this.handleMultipleAdminEmails();

        $('input[data-key=email-config-status-btn]').on('change', event => {
            let _self = $(event.currentTarget);
            let key = _self.prop('id');
            let url = _self.data('change-url');

            $.ajax({
                type: 'POST',
                url: url,
                data: {
                    key: key,
                    value: _self.prop('checked') ? 1 : 0
                },
                success: res => {
                    if (!res.error) {
                        Botble.showSuccess(res.message);
                    } else {
                        Botble.showError(res.message);
                    }
                },
                error: res => {
                    Botble.handleError(res);
                }
            });
        });

        $(document).on('change', '.setting-select-options', event => {
            $('.setting-wrapper').addClass('hidden');
            $('.setting-wrapper[data-type=' + $(event.currentTarget).val() + ']').removeClass('hidden');
        });

        $('.send-test-email-trigger-button').on('click', event => {
            event.preventDefault();
            let _self = $(event.currentTarget);
            let defaultText = _self.text();

            _self.text(_self.data('saving'));

            $.ajax({
                type: 'POST',
                url: route('settings.email.edit'),
                data: _self.closest('form').serialize(),
                success: res => {
                    if (!res.error) {
                        Botble.showSuccess(res.message);
                        $('#send-test-email-modal').modal('show');
                    } else {
                        Botble.showError(res.message);
                    }

                    _self.text(defaultText);
                },
                error: res => {
                    Botble.handleError(res);
                    _self.text(defaultText);
                }
            });
        });

        $('#send-test-email-btn').on('click', event => {
            event.preventDefault();
            let _self = $(event.currentTarget);

            _self.addClass('button-loading');

            $.ajax({
                type: 'POST',
                url: route('setting.email.send.test'),
                data: {
                    email: _self.closest('.modal-content').find('input[name=email]').val()
                },
                success: res => {
                    if (!res.error) {
                        Botble.showSuccess(res.message);
                    } else {
                        Botble.showError(res.message);
                    }
                    _self.removeClass('button-loading');
                    _self.closest('.modal').modal('hide');
                },
                error: res => {
                    Botble.handleError(res);
                    _self.removeClass('button-loading');
                    _self.closest('.modal').modal('hide');
                }
            });
        });

        if (typeof CodeMirror !== 'undefined') {
            Botble.initCodeEditor('mail-template-editor');
        }

        $(document).on('click', '.btn-trigger-reset-to-default', event => {
            event.preventDefault();
            $('#reset-template-to-default-button').data('target', $(event.currentTarget).data('target'));
            $('#reset-template-to-default-modal').modal('show');
        });

        $(document).on('click', '#reset-template-to-default-button', event => {
            event.preventDefault();
            let _self = $(event.currentTarget);

            _self.addClass('button-loading');

            $.ajax({
                type: 'POST',
                cache: false,
                url: _self.data('target'),
                data: {
                    email_subject_key: $('input[name=email_subject_key]').val(),
                    template_path: $('input[name=template_path]').val(),
                },
                success: res => {
                    if (!res.error) {
                        Botble.showSuccess(res.message);
                        setTimeout(() => {
                            window.location.reload();
                        }, 1000);
                    } else {
                        Botble.showError(res.message);
                    }
                    _self.removeClass('button-loading');
                    $('#reset-template-to-default-modal').modal('hide');
                },
                error: res => {
                    Botble.handleError(res);
                    _self.removeClass('button-loading');
                }
            });
        });
    }

    handleMultipleAdminEmails() {

        let $wrapper = $('#admin_email_wrapper');

        if (!$wrapper.length) {
            return;
        }

        let $addBtn  = $wrapper.find('#add');
        let max = parseInt($wrapper.data('max'), 10);

        let emails = $wrapper.data('emails');

        if (emails.length === 0) {
            emails = [''];
        }

        const onAddEmail = () => {
            let count = $wrapper.find('input[type=email]').length;

            if (count >= max) {
                $addBtn.addClass('disabled');
            } else {
                $addBtn.removeClass('disabled');
            }
        }

        const addEmail = (value = '') => {
            return $addBtn.before(`<div class="d-flex mt-2 more-email align-items-center">
                <input type="email" class="next-input" placeholder="${$addBtn.data('placeholder')}" name="admin_email[]" value="${ value ? value : '' }" />
                <a class="btn btn-link text-danger"><i class="fas fa-minus"></i></a>
            </div>`)
        }

        const render = () => {
            emails.forEach(email => {
                addEmail(email);
            })
            onAddEmail();
        }

        $wrapper.on('click', '.more-email > a', function() {
            $(this).parent('.more-email').remove();
            onAddEmail();
        })

        $addBtn.on('click', e => {
            e.preventDefault();
            addEmail();
            onAddEmail();
        })

        render();
    }
}

$(document).ready(() => {
    new SettingManagement().init();
});
