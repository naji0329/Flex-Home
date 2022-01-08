export default class Botble {
    static showNotice(messageType, message, messageHeader) {
        toastr.clear();

        toastr.options = {
            closeButton: true,
            positionClass: 'toast-bottom-right',
            onclick: null,
            showDuration: 1000,
            hideDuration: 1000,
            timeOut: 10000,
            extendedTimeOut: 1000,
            showEasing: 'swing',
            hideEasing: 'linear',
            showMethod: 'fadeIn',
            hideMethod: 'fadeOut'

        };
        toastr[messageType](message, messageHeader);
    }

    static showError(message) {
        this.showNotice('error', message, window.trans && window.trans.error ? window.trans.error : 'Error!');
    }

    static showSuccess(message) {
        this.showNotice('success', message, window.trans && window.trans.success ? window.trans.success : 'Success!');
    }

    static handleError(data) {
        if (typeof (data.responseJSON) !== 'undefined') {
            if (typeof (data.responseJSON.message) !== 'undefined') {
                Botble.showError(data.responseJSON.message, window.trans && window.trans.error ? window.trans.error : 'Error!');
            } else {
                $.each(data.responseJSON, function (index, el) {
                    $.each(el, function (key, item) {
                        Botble.showError(item, window.trans && window.trans.error ? window.trans.error : 'Error!');
                    });
                });
            }
        } else {
            Botble.showError(data.statusText, window.trans && window.trans.error ? window.trans.error : 'Error!');
        }
    }
}
