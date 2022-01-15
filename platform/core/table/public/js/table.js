/******/ (() => { // webpackBootstrap
var __webpack_exports__ = {};
/*!**********************************************************!*\
  !*** ./platform/core/table/resources/assets/js/table.js ***!
  \**********************************************************/
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }

(function ($, DataTable) {
  'use strict';

  var _buildParams = function _buildParams(dt, action) {
    var params = dt.ajax.params();
    params.action = action;
    params._token = $('meta[name="csrf-token"]').attr('content');
    return params;
  };

  var _downloadFromUrl = function _downloadFromUrl(url, params) {
    var postUrl = url + '/export';
    var xhr = new XMLHttpRequest();
    xhr.open('POST', postUrl, true);
    xhr.responseType = 'arraybuffer';

    xhr.onload = function () {
      if (this.status === 200) {
        var filename = '';
        var disposition = xhr.getResponseHeader('Content-Disposition');

        if (disposition && disposition.indexOf('attachment') !== -1) {
          var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
          var matches = filenameRegex.exec(disposition);
          if (matches != null && matches[1]) filename = matches[1].replace(/['"]/g, '');
        }

        var type = xhr.getResponseHeader('Content-Type');
        var blob = new Blob([this.response], {
          type: type
        });

        if (typeof window.navigator.msSaveBlob !== 'undefined') {
          // IE workaround for "HTML7007: One or more blob URLs were revoked by closing the blob for which they were created. These URLs will no longer resolve as the data backing the URL has been freed."
          window.navigator.msSaveBlob(blob, filename);
        } else {
          var URL = window.URL || window.webkitURL;
          var downloadUrl = URL.createObjectURL(blob);

          if (filename) {
            // use HTML5 a[download] attribute to specify filename
            var a = document.createElement('a'); // safari doesn't support this yet

            if (typeof a.download === 'undefined') {
              window.location = downloadUrl;
            } else {
              a.href = downloadUrl;
              a.download = filename;
              document.body.appendChild(a);
              a.trigger('click');
            }
          } else {
            window.location = downloadUrl;
          }

          setTimeout(function () {
            URL.revokeObjectURL(downloadUrl);
          }, 100); // cleanup
        }
      }
    };

    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.send($.param(params));
  };

  var _buildUrl = function _buildUrl(dt, action) {
    var url = dt.ajax.url() || '';
    var params = dt.ajax.params();
    params.action = action;

    if (url.indexOf('?') > -1) {
      return url + '&' + $.param(params);
    }

    return url + '?' + $.param(params);
  };

  DataTable.ext.buttons.excel = {
    className: 'buttons-excel',
    text: function text(dt) {
      return '<i class="far fa-file-excel"></i> ' + dt.i18n('buttons.excel', BotbleVariables.languages.tables.excel ? BotbleVariables.languages.tables.excel : 'Excel');
    },
    action: function action(e, dt) {
      window.location = _buildUrl(dt, 'excel');
    }
  };
  DataTable.ext.buttons.postExcel = {
    className: 'buttons-excel',
    text: function text(dt) {
      return '<i class="far fa-file-excel"></i> ' + dt.i18n('buttons.excel', BotbleVariables.languages.tables.excel ? BotbleVariables.languages.tables.excel : 'Excel');
    },
    action: function action(e, dt) {
      var url = dt.ajax.url() || window.location.href;

      var params = _buildParams(dt, 'excel');

      _downloadFromUrl(url, params);
    }
  };
  DataTable.ext.buttons["export"] = {
    extend: 'collection',
    className: 'buttons-export',
    text: function text(dt) {
      return '<i class="fa fa-download"></i> ' + dt.i18n('buttons.export', BotbleVariables.languages.tables["export"] ? BotbleVariables.languages.tables["export"] : 'Export') + '&nbsp;<span class="caret"/>';
    },
    buttons: ['csv', 'excel']
  };
  DataTable.ext.buttons.csv = {
    className: 'buttons-csv',
    text: function text(dt) {
      return '<i class="fas fa-file-csv"></i> ' + dt.i18n('buttons.csv', BotbleVariables.languages.tables.csv ? BotbleVariables.languages.tables.csv : 'CSV');
    },
    action: function action(e, dt) {
      window.location = _buildUrl(dt, 'csv');
    }
  };
  DataTable.ext.buttons.postCsv = {
    className: 'buttons-csv',
    text: function text(dt) {
      return '<i class="fas fa-file-csv"></i> ' + dt.i18n('buttons.csv', BotbleVariables.languages.tables.csv ? BotbleVariables.languages.tables.csv : 'CSV');
    },
    action: function action(e, dt) {
      var url = dt.ajax.url() || window.location.href;

      var params = _buildParams(dt, 'csv');

      _downloadFromUrl(url, params);
    }
  };
  DataTable.ext.buttons.pdf = {
    className: 'buttons-pdf',
    text: function text(dt) {
      return '<i class="far fa-file-pdf"></i> ' + dt.i18n('buttons.pdf', 'PDF');
    },
    action: function action(e, dt) {
      window.location = _buildUrl(dt, 'pdf');
    }
  };
  DataTable.ext.buttons.postPdf = {
    className: 'buttons-pdf',
    text: function text(dt) {
      return '<i class="far fa-file-pdf"></i> ' + dt.i18n('buttons.pdf', 'PDF');
    },
    action: function action(e, dt) {
      var url = dt.ajax.url() || window.location.href;

      var params = _buildParams(dt, 'pdf');

      _downloadFromUrl(url, params);
    }
  };
  DataTable.ext.buttons.print = {
    className: 'buttons-print',
    text: function text(dt) {
      return '<i class="fa fa-print"></i> ' + dt.i18n('buttons.print', BotbleVariables.languages.tables.print ? BotbleVariables.languages.tables.print : 'Print');
    },
    action: function action(e, dt) {
      window.location = _buildUrl(dt, 'print');
    }
  };
  DataTable.ext.buttons.reset = {
    className: 'buttons-reset',
    text: function text(dt) {
      return '<i class="fa fa-undo"></i> ' + dt.i18n('buttons.reset', BotbleVariables.languages.tables.reset ? BotbleVariables.languages.tables.reset : 'Reset');
    },
    action: function action() {
      $('.table thead input').val('').keyup();
      $('.table thead select').val('').change();
    }
  };
  DataTable.ext.buttons.reload = {
    className: 'buttons-reload',
    text: function text(dt) {
      return '<i class="fas fa-sync"></i> ' + dt.i18n('buttons.reload', BotbleVariables.languages.tables.reload ? BotbleVariables.languages.tables.reload : 'Reload');
    },
    action: function action(e, dt) {
      dt.draw(false);
    }
  };
  DataTable.ext.buttons.create = {
    className: 'buttons-create',
    text: function text(dt) {
      return '<i class="fa fa-plus"></i> ' + dt.i18n('buttons.create', 'Create');
    },
    action: function action() {
      window.location = window.location.href.replace(/\/+$/, '') + '/create';
    }
  };

  if (typeof DataTable.ext.buttons.copyHtml5 !== 'undefined') {
    $.extend(DataTable.ext.buttons.copyHtml5, {
      text: function text(dt) {
        return '<i class="fa fa-copy"></i> ' + dt.i18n('buttons.copy', 'Copy');
      }
    });
  }

  if (typeof DataTable.ext.buttons.colvis !== 'undefined') {
    $.extend(DataTable.ext.buttons.colvis, {
      text: function text(dt) {
        return '<i class="fa fa-eye"></i> ' + dt.i18n('buttons.colvis', 'Column visibility');
      }
    });
  }

  var TableManagement = /*#__PURE__*/function () {
    function TableManagement() {
      _classCallCheck(this, TableManagement);

      this.init();
      this.handleActionsRow();
      this.handleActionsExport();
    }

    _createClass(TableManagement, [{
      key: "init",
      value: function init() {
        $(document).on('change', '.table-check-all', function (event) {
          var _self = $(event.currentTarget);

          var set = _self.attr('data-set');

          var checked = _self.prop('checked');

          $(set).each(function (index, el) {
            if (checked) {
              $(el).prop('checked', true);
            } else {
              $(el).prop('checked', false);
            }
          });
        });
        $(document).find('.table-check-all').closest('th').removeAttr('title');
        $(document).on('change', '.checkboxes', function (event) {
          var _self = $(event.currentTarget);

          var table = _self.closest('.table-wrapper').find('.table').prop('id');

          var ids = [];
          var $table = $('#' + table);
          $table.find('.checkboxes:checked').each(function (i, el) {
            ids[i] = $(el).val();
          });

          if (ids.length !== $table.find('.checkboxes').length) {
            _self.closest('.table-wrapper').find('.table-check-all').prop('checked', false);
          } else {
            _self.closest('.table-wrapper').find('.table-check-all').prop('checked', true);
          }
        });
        $(document).on('click', '.btn-show-table-options', function (event) {
          event.preventDefault();
          $(event.currentTarget).closest('.table-wrapper').find('.table-configuration-wrap').slideToggle(500);
        });
        $(document).on('click', '.action-item', function (event) {
          event.preventDefault();
          var span = $(event.currentTarget).find('span[data-href]');
          var action = span.data('action');
          var url = span.data('href');

          if (action && url !== '#') {
            window.location.href = url;
          }
        });
      }
    }, {
      key: "handleActionsRow",
      value: function handleActionsRow() {
        var that = this;
        $(document).on('click', '.deleteDialog', function (event) {
          event.preventDefault();

          var _self = $(event.currentTarget);

          $('.delete-crud-entry').data('section', _self.data('section')).data('parent-table', _self.closest('.table').prop('id'));
          $('.modal-confirm-delete').modal('show');
        });
        $('.delete-crud-entry').on('click', function (event) {
          event.preventDefault();

          var _self = $(event.currentTarget);

          _self.addClass('button-loading');

          var deleteURL = _self.data('section');

          $.ajax({
            url: deleteURL,
            type: 'DELETE',
            success: function success(data) {
              if (data.error) {
                Botble.showError(data.message);
              } else {
                window.LaravelDataTables[_self.data('parent-table')].row($('a[data-section="' + deleteURL + '"]').closest('tr')).remove().draw();

                Botble.showSuccess(data.message);
              }

              _self.closest('.modal').modal('hide');

              _self.removeClass('button-loading');
            },
            error: function error(data) {
              Botble.handleError(data);

              _self.removeClass('button-loading');
            }
          });
        });
        $(document).on('click', '.delete-many-entry-trigger', function (event) {
          event.preventDefault();

          var _self = $(event.currentTarget);

          var table = _self.closest('.table-wrapper').find('.table').prop('id');

          var ids = [];
          $('#' + table).find('.checkboxes:checked').each(function (i, el) {
            ids[i] = $(el).val();
          });

          if (ids.length === 0) {
            Botble.showError(BotbleVariables.languages.tables.please_select_record ? BotbleVariables.languages.tables.please_select_record : 'Please select at least one record to perform this action!');
            return false;
          }

          $('.delete-many-entry-button').data('href', _self.prop('href')).data('parent-table', table).data('class-item', _self.data('class-item'));
          $('.delete-many-modal').modal('show');
        });
        $('.delete-many-entry-button').on('click', function (event) {
          event.preventDefault();

          var _self = $(event.currentTarget);

          _self.addClass('button-loading');

          var $table = $('#' + _self.data('parent-table'));
          var ids = [];
          $table.find('.checkboxes:checked').each(function (i, el) {
            ids[i] = $(el).val();
          });
          $.ajax({
            url: _self.data('href'),
            type: 'DELETE',
            data: {
              ids: ids,
              "class": _self.data('class-item')
            },
            success: function success(data) {
              if (data.error) {
                Botble.showError(data.message);
              } else {
                Botble.showSuccess(data.message);
              }

              $table.find('.table-check-all').prop('checked', false);

              window.LaravelDataTables[_self.data('parent-table')].draw();

              _self.closest('.modal').modal('hide');

              _self.removeClass('button-loading');
            },
            error: function error(data) {
              Botble.handleError(data);

              _self.removeClass('button-loading');
            }
          });
        });
        $(document).on('click', '.bulk-change-item', function (event) {
          event.preventDefault();

          var _self = $(event.currentTarget);

          var table = _self.closest('.table-wrapper').find('.table').prop('id');

          var ids = [];
          $('#' + table).find('.checkboxes:checked').each(function (i, el) {
            ids[i] = $(el).val();
          });

          if (ids.length === 0) {
            Botble.showError(BotbleVariables.languages.tables.please_select_record ? BotbleVariables.languages.tables.please_select_record : 'Please select at least one record to perform this action!');
            return false;
          }

          that.loadBulkChangeData(_self);
          $('.confirm-bulk-change-button').data('parent-table', table).data('class-item', _self.data('class-item')).data('key', _self.data('key')).data('url', _self.data('save-url'));
          $('.modal-bulk-change-items').modal('show');
        });
        $(document).on('click', '.confirm-bulk-change-button', function (event) {
          event.preventDefault();

          var _self = $(event.currentTarget);

          var value = _self.closest('.modal').find('.input-value').val();

          var inputKey = _self.data('key');

          var $table = $('#' + _self.data('parent-table'));
          var ids = [];
          $table.find('.checkboxes:checked').each(function (i, el) {
            ids[i] = $(el).val();
          });

          _self.addClass('button-loading');

          $.ajax({
            url: _self.data('url'),
            type: 'POST',
            data: {
              ids: ids,
              key: inputKey,
              value: value,
              "class": _self.data('class-item')
            },
            success: function success(data) {
              if (data.error) {
                Botble.showError(data.message);
              } else {
                Botble.showSuccess(data.message);
              }

              $table.find('.table-check-all').prop('checked', false);
              $.each(ids, function (index, item) {
                window.LaravelDataTables[_self.data('parent-table')].row($table.find('.checkboxes[value="' + item + '"]').closest('tr')).remove().draw();
              });

              _self.closest('.modal').modal('hide');

              _self.removeClass('button-loading');
            },
            error: function error(data) {
              Botble.handleError(data);

              _self.removeClass('button-loading');
            }
          });
        });
      }
    }, {
      key: "loadBulkChangeData",
      value: function loadBulkChangeData($element) {
        var $modal = $('.modal-bulk-change-items');
        $.ajax({
          type: 'GET',
          url: $modal.find('.confirm-bulk-change-button').data('load-url'),
          data: {
            'class': $element.data('class-item'),
            'key': $element.data('key')
          },
          success: function success(res) {
            var data = $.map(res.data, function (value, key) {
              return {
                id: key,
                name: value
              };
            });
            var $parent = $('.modal-bulk-change-content');
            $parent.html(res.html);
            var $input = $modal.find('input[type=text].input-value');

            if ($input.length) {
              $input.typeahead({
                source: data
              });
              $input.data('typeahead').source = data;
            }

            Botble.initResources();
          },
          error: function error(_error) {
            Botble.handleError(_error);
          }
        });
      }
    }, {
      key: "handleActionsExport",
      value: function handleActionsExport() {
        $(document).on('click', '.export-data', function (event) {
          var _self = $(event.currentTarget);

          var table = _self.closest('.table-wrapper').find('.table').prop('id');

          var ids = [];
          $('#' + table).find('.checkboxes:checked').each(function (i, el) {
            ids[i] = $(el).val();
          });
          event.preventDefault();
          $.ajax({
            type: 'POST',
            url: _self.prop('href'),
            data: {
              'ids-checked': ids
            },
            success: function success(response) {
              var a = document.createElement('a');
              a.href = response.file;
              a.download = response.name;
              document.body.appendChild(a);
              a.trigger('click');
              a.remove();
            },
            error: function error(_error2) {
              Botble.handleError(_error2);
            }
          });
        });
      }
    }]);

    return TableManagement;
  }();

  $(document).ready(function () {
    new TableManagement();
  });
})(jQuery, jQuery.fn.dataTable);
/******/ })()
;