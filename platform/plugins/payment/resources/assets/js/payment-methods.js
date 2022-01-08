'use strict';

class PaymentMethodManagement {
    init() {
        $('.toggle-payment-item').off('click').on('click', event => {
            $(event.currentTarget).closest('tbody').find('.payment-content-item').toggleClass('hidden');
        });
        $('.disable-payment-item').off('click').on('click', event => {
            event.preventDefault();
            let _self = $(event.currentTarget);
            $('#confirm-disable-payment-method-modal').modal('show');
            $('#confirm-disable-payment-method-button').on('click', event => {
                event.preventDefault();
                $(event.currentTarget).addClass('button-loading');
                $.ajax({
                    type: 'POST',
                    cache: false,
                    url: route('payments.methods.update.status'),
                    data: {
                        type: _self.closest('form').find('.payment_type').val()
                    },
                    success: res => {
                        if (!res.error) {
                            _self.closest('tbody').find('.payment-name-label-group').addClass('hidden');
                            _self.closest('tbody').find('.edit-payment-item-btn-trigger').addClass('hidden');
                            _self.closest('tbody').find('.save-payment-item-btn-trigger').removeClass('hidden');
                            _self.closest('tbody').find('.btn-text-trigger-update').addClass('hidden');
                            _self.closest('tbody').find('.btn-text-trigger-save').removeClass('hidden');
                            _self.addClass('hidden');
                            $(event.currentTarget).closest('.modal').modal('hide');
                            Botble.showSuccess(res.message);
                        } else {
                            Botble.showError(res.message);
                        }
                        $(event.currentTarget).removeClass('button-loading');
                    },
                    error: res => {
                        Botble.handleError(res);
                        $(event.currentTarget).removeClass('button-loading');
                    }
                });
            });
        });

        $('.save-payment-item').off('click').on('click', event => {
            event.preventDefault();
            let _self = $(event.currentTarget);
            _self.addClass('button-loading');

            if (typeof tinymce != 'undefined') {
                for (var instance in tinymce.editors) {
                    if (tinymce.editors[instance].getContent) {
                        $('#' + instance).html(tinymce.editors[instance].getContent());
                    }
                }
            }

            $.ajax({
                type: 'POST',
                cache: false,
                url: _self.closest('form').prop('action'),
                data: _self.closest('form').serialize(),
                success: res => {
                    if (!res.error) {
                        _self.closest('tbody').find('.payment-name-label-group').removeClass('hidden');
                        _self.closest('tbody').find('.method-name-label').text(_self.closest('form').find('input.input-name').val());
                        _self.closest('tbody').find('.disable-payment-item').removeClass('hidden');
                        _self.closest('tbody').find('.edit-payment-item-btn-trigger').removeClass('hidden');
                        _self.closest('tbody').find('.save-payment-item-btn-trigger').addClass('hidden');
                        _self.closest('tbody').find('.btn-text-trigger-update').removeClass('hidden');
                        _self.closest('tbody').find('.btn-text-trigger-save').addClass('hidden');
                        Botble.showSuccess(res.message);
                    } else {
                        Botble.showError(res.message);
                    }
                    _self.removeClass('button-loading');
                },
                error: res => {
                    Botble.handleError(res);
                    _self.removeClass('button-loading');
                }
            });
        });

        $('.button-save-payment-settings').off('click').on('click', event => {
            event.preventDefault();
            let _self = $(event.currentTarget);
            _self.addClass('button-loading');
            $.ajax({
                type: 'POST',
                cache: false,
                url: _self.closest('form').prop('action'),
                data: _self.closest('form').serialize(),
                success: res => {
                    if (!res.error) {
                        Botble.showSuccess(res.message);
                    } else {
                        Botble.showError(res.message);
                    }
                    _self.removeClass('button-loading');
                },
                error: res => {
                    Botble.handleError(res);
                    _self.removeClass('button-loading');
                }
            });
        });
    }
}

$(document).ready(() => {
    new PaymentMethodManagement().init();
});
