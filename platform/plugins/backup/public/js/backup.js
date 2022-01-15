/******/ (() => { // webpackBootstrap
var __webpack_exports__ = {};
/*!***************************************************************!*\
  !*** ./platform/plugins/backup/resources/assets/js/backup.js ***!
  \***************************************************************/
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }

var BackupManagement = /*#__PURE__*/function () {
  function BackupManagement() {
    _classCallCheck(this, BackupManagement);
  }

  _createClass(BackupManagement, [{
    key: "init",
    value: function init() {
      var backupTable = $('#table-backups');
      backupTable.on('click', '.deleteDialog', function (event) {
        event.preventDefault();
        $('.delete-crud-entry').data('section', $(event.currentTarget).data('section'));
        $('.modal-confirm-delete').modal('show');
      });
      backupTable.on('click', '.restoreBackup', function (event) {
        event.preventDefault();
        $('#restore-backup-button').data('section', $(event.currentTarget).data('section'));
        $('#restore-backup-modal').modal('show');
      });
      $('.delete-crud-entry').on('click', function (event) {
        event.preventDefault();
        $('.modal-confirm-delete').modal('hide');
        var deleteURL = $(event.currentTarget).data('section');
        $.ajax({
          url: deleteURL,
          type: 'DELETE',
          success: function success(data) {
            if (data.error) {
              Botble.showError(data.message);
            } else {
              if (backupTable.find('tbody tr').length <= 1) {
                backupTable.load(window.location.href + ' #table-backups > *');
              }

              backupTable.find('a[data-section="' + deleteURL + '"]').closest('tr').remove();
              Botble.showSuccess(data.message);
            }
          },
          error: function error(data) {
            Botble.handleError(data);
          }
        });
      });
      $('#restore-backup-button').on('click', function (event) {
        event.preventDefault();

        var _self = $(event.currentTarget);

        _self.addClass('button-loading');

        $.ajax({
          url: _self.data('section'),
          type: 'GET',
          success: function success(data) {
            _self.removeClass('button-loading');

            _self.closest('.modal').modal('hide');

            if (data.error) {
              Botble.showError(data.message);
            } else {
              Botble.showSuccess(data.message);
              window.location.reload();
            }
          },
          error: function error(data) {
            _self.removeClass('button-loading');

            Botble.handleError(data);
          }
        });
      });
      $(document).on('click', '#generate_backup', function (event) {
        event.preventDefault();
        $('#name').val('');
        $('#description').val('');
        $('#create-backup-modal').modal('show');
      });
      $('#create-backup-modal').on('click', '#create-backup-button', function (event) {
        event.preventDefault();

        var _self = $(event.currentTarget);

        _self.addClass('button-loading');

        var name = $('#name').val();
        var description = $('#description').val();
        var error = false;

        if (name === '' || name === null) {
          error = true;
          Botble.showError('Backup name is required!');
        }

        if (!error) {
          $.ajax({
            url: $('div[data-route-create]').data('route-create'),
            type: 'POST',
            data: {
              name: name,
              description: description
            },
            success: function success(data) {
              _self.removeClass('button-loading');

              _self.closest('.modal').modal('hide');

              if (data.error) {
                Botble.showError(data.message);
              } else {
                backupTable.find('.no-backup-row').remove();
                backupTable.find('tbody').append(data.data);
                Botble.showSuccess(data.message);
              }
            },
            error: function error(data) {
              _self.removeClass('button-loading');

              Botble.handleError(data);
            }
          });
        } else {
          _self.removeClass('button-loading');
        }
      });
    }
  }]);

  return BackupManagement;
}();

$(document).ready(function () {
  new BackupManagement().init();
});
/******/ })()
;