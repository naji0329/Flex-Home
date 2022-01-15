/******/ (() => { // webpackBootstrap
var __webpack_exports__ = {};
/*!************************************************************************!*\
  !*** ./platform/plugins/contact/resources/assets/js/contact-public.js ***!
  \************************************************************************/
$(document).ready(function () {
  var showError = function showError(message) {
    $('.contact-error-message').html(message).show();
  };

  var showSuccess = function showSuccess(message) {
    $('.contact-success-message').html(message).show();
  };

  var handleError = function handleError(data) {
    if (typeof data.errors !== 'undefined' && data.errors.length) {
      handleValidationError(data.errors);
    } else {
      if (typeof data.responseJSON !== 'undefined') {
        if (typeof data.responseJSON.errors !== 'undefined') {
          if (data.status === 422) {
            handleValidationError(data.responseJSON.errors);
          }
        } else if (typeof data.responseJSON.message !== 'undefined') {
          showError(data.responseJSON.message);
        } else {
          $.each(data.responseJSON, function (index, el) {
            $.each(el, function (key, item) {
              showError(item);
            });
          });
        }
      } else {
        showError(data.statusText);
      }
    }
  };

  var handleValidationError = function handleValidationError(errors) {
    var message = '';
    $.each(errors, function (index, item) {
      if (message !== '') {
        message += '<br />';
      }

      message += item;
    });
    showError(message);
  };

  $(document).on('click', '.contact-form button[type=submit]', function (event) {
    var _this = this;

    event.preventDefault();
    event.stopPropagation();
    $(this).addClass('button-loading');
    $('.contact-success-message').html('').hide();
    $('.contact-error-message').html('').hide();
    $.ajax({
      type: 'POST',
      cache: false,
      url: $(this).closest('form').prop('action'),
      data: new FormData($(this).closest('form')[0]),
      contentType: false,
      processData: false,
      success: function success(res) {
        if (!res.error) {
          $(_this).closest('form').find('input[type=text]').val('');
          $(_this).closest('form').find('input[type=email]').val('');
          $(_this).closest('form').find('textarea').val('');
          showSuccess(res.message);
        } else {
          showError(res.message);
        }

        $(_this).removeClass('button-loading');

        if (typeof refreshRecaptcha !== 'undefined') {
          refreshRecaptcha();
        }
      },
      error: function error(res) {
        if (typeof refreshRecaptcha !== 'undefined') {
          refreshRecaptcha();
        }

        $(_this).removeClass('button-loading');
        handleError(res);
      }
    });
  });
});
/******/ })()
;