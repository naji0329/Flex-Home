/******/ (() => { // webpackBootstrap
var __webpack_exports__ = {};
/*!***************************************************************************!*\
  !*** ./platform/plugins/real-estate/resources/assets/js/account-admin.js ***!
  \***************************************************************************/
$(document).ready(function () {
  $(document).on('click', '#is_change_password', function (event) {
    if ($(event.currentTarget).is(':checked')) {
      $('input[type=password]').closest('.form-group').removeClass('hidden').fadeIn();
    } else {
      $('input[type=password]').closest('.form-group').addClass('hidden').fadeOut();
    }
  });
  $(document).on('click', '.btn-trigger-add-credit', function (event) {
    event.preventDefault();
    $('#add-credit-modal').modal('show');
  });
  $(document).on('click', '#confirm-add-credit-button', function (event) {
    event.preventDefault();

    var _self = $(event.currentTarget);

    _self.addClass('button-loading');

    $.ajax({
      type: 'POST',
      cache: false,
      url: _self.closest('.modal-content').find('form').prop('action'),
      data: _self.closest('.modal-content').find('form').serialize(),
      success: function success(res) {
        if (!res.error) {
          Botble.showNotice('success', res.message);
          $('#add-credit-modal').modal('hide');
          $('#credit-histories').load($('.page-content form').prop('action') + ' #credit-histories > *');
        } else {
          Botble.showNotice('error', res.message);
        }

        _self.removeClass('button-loading');
      },
      error: function error(res) {
        Botble.handleError(res);

        _self.removeClass('button-loading');
      }
    });
  });
  $(document).on('click', '.show-timeline-dropdown', function (event) {
    event.preventDefault();
    $($(event.currentTarget).data('target')).slideToggle();
    $(event.currentTarget).closest('.comment-log-item').toggleClass('bg-white');
  });
});
/******/ })()
;