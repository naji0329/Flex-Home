/******/ (() => { // webpackBootstrap
var __webpack_exports__ = {};
/*!**********************************************************************!*\
  !*** ./platform/plugins/location/resources/assets/js/bulk-import.js ***!
  \**********************************************************************/
$(function () {
  var alertWarning = $('.alert.alert-warning');

  if (alertWarning.length > 0) {
    _.map(alertWarning, function (el) {
      var storageAlert = localStorage.getItem('storage-alerts');
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
    var storage = $(el.target).data('alert-id');

    if (storage) {
      var storageAlert = localStorage.getItem('storage-alerts');
      storageAlert = storageAlert ? JSON.parse(storageAlert) : {};
      storageAlert[storage] = true;
      localStorage.setItem('storage-alerts', JSON.stringify(storageAlert));
    }
  });
  var isDownloadingTemplate = false;
  $(document).on('click', '.download-template', function (event) {
    event.preventDefault();

    if (isDownloadingTemplate) {
      return;
    }

    var $this = $(event.currentTarget);
    var extension = $this.data('extension');
    var $content = $this.html();
    $.ajax({
      url: $this.data('url'),
      method: 'POST',
      data: {
        extension: extension
      },
      xhrFields: {
        responseType: 'blob'
      },
      beforeSend: function beforeSend() {
        $this.html($this.data('downloading'));
        $this.addClass('text-secondary');
        isDownloadingTemplate = true;
      },
      success: function success(data) {
        var a = document.createElement('a');
        var url = window.URL.createObjectURL(data);
        a.href = url;
        a.download = $this.data('filename');
        document.body.append(a);
        a.click();
        a.remove();
        window.URL.revokeObjectURL(url);
      },
      error: function error(data) {
        Botble.handleError(data);
      },
      complete: function complete() {
        setTimeout(function () {
          $this.html($content);
          $this.removeClass('text-secondary');
          isDownloadingTemplate = false;
        }, 2000);
      }
    });
  });
  $(document).on('submit', '.form-import-data', function (event) {
    event.preventDefault();
    var $form = $(this);
    var formData = new FormData($form.get(0));
    var $button = $form.find('button[type=submit]');
    $button.prop('disabled', true).addClass('button-loading');
    var $message = $('#imported-message');
    var $listing = $('#imported-listing');
    var $show = $('.show-errors');
    var failureTemplate = $('#failure-template').html();
    $.ajax({
      url: $form.attr('action'),
      type: $form.attr('method') || 'POST',
      data: formData,
      cache: false,
      processData: false,
      contentType: false,
      dataType: 'json',
      beforeSend: function beforeSend() {
        $('.main-form-message').addClass('hidden');
        $message.html('');
        $listing.html('');
      },
      success: function success(data) {
        if (data.error) {
          Botble.showError(data.message);
        } else {
          Botble.showSuccess(data.message);
        }

        var result = '';

        if (data.data.failures) {
          _.map(data.data.failures, function (val) {
            result += failureTemplate.replace('__row__', val.row).replace('__attribute__', val.attribute).replace('__errors__', val.errors.join(', '));
          });
        }

        var $class = 'alert alert-success';

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

        $message.removeClass().addClass($class).html(data.message);

        if (result) {
          $listing.removeClass('hidden').html(result);
        }

        document.getElementById('input-group-file').value = '';
      },
      error: function error(data) {
        Botble.handleError(data);
      },
      complete: function complete() {
        $button.prop('disabled', false);
        $button.removeClass('button-loading');
        $('.main-form-message').removeClass('hidden');
      }
    });
  });
});
/******/ })()
;