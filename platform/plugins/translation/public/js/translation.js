/******/ (() => { // webpackBootstrap
var __webpack_exports__ = {};
/*!*************************************************************************!*\
  !*** ./platform/plugins/translation/resources/assets/js/translation.js ***!
  \*************************************************************************/
jQuery(document).ready(function ($) {
  $('.editable').editable({
    mode: 'inline'
  }).on('hidden', function (e, reason) {
    var locale = $(event.currentTarget).data('locale');

    if (reason === 'save') {
      $(event.currentTarget).removeClass('status-0').addClass('status-1');
    }

    if (reason === 'save' || reason === 'nochange') {
      var $next = $(event.currentTarget).closest('tr').next().find('.editable.locale-' + locale);
      setTimeout(function () {
        $next.editable('show');
      }, 300);
    }
  });
  $('.group-select').on('change', function (event) {
    var group = $(event.currentTarget).val();

    if (group) {
      window.location.href = route('translations.index') + '?group=' + encodeURI($(event.currentTarget).val());
    } else {
      window.location.href = route('translations.index');
    }
  });
  $('.box-translation').on('click', '.button-import-groups', function (event) {
    event.preventDefault();

    var _self = $(event.currentTarget);

    _self.addClass('button-loading');

    var $form = _self.closest('form');

    $.ajax({
      url: $form.prop('action'),
      type: 'POST',
      data: $form.serialize(),
      success: function success(data) {
        _self.removeClass('button-loading');

        if (data.error) {
          Botble.showError(data.message);
        } else {
          Botble.showSuccess(data.message);
          $form.removeClass('dirty');
        }
      },
      error: function error(data) {
        _self.removeClass('button-loading');

        Botble.handleError(data);
      }
    });
  });
  $(document).on('click', '.button-publish-groups', function (event) {
    event.preventDefault();
    $('#confirm-publish-modal').modal('show');
  });
  $('#confirm-publish-modal').on('click', '#button-confirm-publish-groups', function (event) {
    event.preventDefault();

    var _self = $(event.currentTarget);

    _self.addClass('button-loading');

    var $form = $('.button-publish-groups').closest('form');
    $.ajax({
      url: $form.prop('action'),
      type: 'POST',
      data: $form.serialize(),
      success: function success(data) {
        _self.removeClass('button-loading');

        if (data.error) {
          Botble.showError(data.message);
        } else {
          Botble.showSuccess(data.message);
          $form.removeClass('dirty');
        }

        _self.closest('.modal').modal('hide');
      },
      error: function error(data) {
        _self.removeClass('button-loading');

        Botble.handleError(data);
      }
    });
  });
});
/******/ })()
;