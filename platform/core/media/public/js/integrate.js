/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
/******/ 	var __webpack_modules__ = ({

/***/ "./platform/core/media/resources/assets/js/App/Config/MediaConfig.js":
/*!***************************************************************************!*\
  !*** ./platform/core/media/resources/assets/js/App/Config/MediaConfig.js ***!
  \***************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "MediaConfig": () => (/* binding */ MediaConfig),
/* harmony export */   "RecentItems": () => (/* binding */ RecentItems)
/* harmony export */ });
var MediaConfig = $.parseJSON(localStorage.getItem('MediaConfig')) || {};
var defaultConfig = {
  app_key: RV_MEDIA_CONFIG.random_hash ? RV_MEDIA_CONFIG.random_hash : '21d06709fe1d3abcc0efddda89c4b279',
  request_params: {
    view_type: 'tiles',
    filter: 'everything',
    view_in: 'all_media',
    sort_by: 'created_at-desc',
    folder_id: 0
  },
  hide_details_pane: false,
  icons: {
    folder: 'fa fa-folder'
  },
  actions_list: {
    basic: [{
      icon: 'fa fa-eye',
      name: 'Preview',
      action: 'preview',
      order: 0,
      "class": 'rv-action-preview'
    }],
    file: [{
      icon: 'fa fa-link',
      name: 'Copy link',
      action: 'copy_link',
      order: 0,
      "class": 'rv-action-copy-link'
    }, {
      icon: 'far fa-edit',
      name: 'Rename',
      action: 'rename',
      order: 1,
      "class": 'rv-action-rename'
    }, {
      icon: 'fa fa-copy',
      name: 'Make a copy',
      action: 'make_copy',
      order: 2,
      "class": 'rv-action-make-copy'
    }],
    user: [{
      icon: 'fa fa-star',
      name: 'Favorite',
      action: 'favorite',
      order: 2,
      "class": 'rv-action-favorite'
    }, {
      icon: 'fa fa-star',
      name: 'Remove favorite',
      action: 'remove_favorite',
      order: 3,
      "class": 'rv-action-favorite'
    }],
    other: [{
      icon: 'fa fa-download',
      name: 'Download',
      action: 'download',
      order: 0,
      "class": 'rv-action-download'
    }, {
      icon: 'fa fa-trash',
      name: 'Move to trash',
      action: 'trash',
      order: 1,
      "class": 'rv-action-trash'
    }, {
      icon: 'fa fa-eraser',
      name: 'Delete permanently',
      action: 'delete',
      order: 2,
      "class": 'rv-action-delete'
    }, {
      icon: 'fa fa-undo',
      name: 'Restore',
      action: 'restore',
      order: 3,
      "class": 'rv-action-restore'
    }]
  }
};

if (!MediaConfig.app_key || MediaConfig.app_key !== defaultConfig.app_key) {
  MediaConfig = defaultConfig;
}

MediaConfig.request_params.search = '';
var RecentItems = $.parseJSON(localStorage.getItem('RecentItems')) || [];


/***/ }),

/***/ "./platform/core/media/resources/assets/js/App/Helpers/Helpers.js":
/*!************************************************************************!*\
  !*** ./platform/core/media/resources/assets/js/App/Helpers/Helpers.js ***!
  \************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "Helpers": () => (/* binding */ Helpers)
/* harmony export */ });
/* harmony import */ var _Config_MediaConfig__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../Config/MediaConfig */ "./platform/core/media/resources/assets/js/App/Config/MediaConfig.js");
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }


var Helpers = /*#__PURE__*/function () {
  function Helpers() {
    _classCallCheck(this, Helpers);
  }

  _createClass(Helpers, null, [{
    key: "getUrlParam",
    value: function getUrlParam(paramName) {
      var url = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : null;

      if (!url) {
        url = window.location.search;
      }

      var reParam = new RegExp('(?:[\?&]|&)' + paramName + '=([^&]+)', 'i');
      var match = url.match(reParam);
      return match && match.length > 1 ? match[1] : null;
    }
  }, {
    key: "asset",
    value: function asset(url) {
      if (url.substring(0, 2) === '//' || url.substring(0, 7) === 'http://' || url.substring(0, 8) === 'https://') {
        return url;
      }

      var baseUrl = RV_MEDIA_URL.base_url.substr(-1, 1) !== '/' ? RV_MEDIA_URL.base_url + '/' : RV_MEDIA_URL.base_url;

      if (url.substring(0, 1) === '/') {
        return baseUrl + url.substring(1);
      }

      return baseUrl + url;
    }
  }, {
    key: "showAjaxLoading",
    value: function showAjaxLoading() {
      var $element = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : $('.rv-media-main');
      $element.addClass('on-loading').append($('#rv_media_loading').html());
    }
  }, {
    key: "hideAjaxLoading",
    value: function hideAjaxLoading() {
      var $element = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : $('.rv-media-main');
      $element.removeClass('on-loading').find('.loading-wrapper').remove();
    }
  }, {
    key: "isOnAjaxLoading",
    value: function isOnAjaxLoading() {
      var $element = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : $('.rv-media-items');
      return $element.hasClass('on-loading');
    }
  }, {
    key: "jsonEncode",
    value: function jsonEncode(object) {
      if (typeof object === 'undefined') {
        object = null;
      }

      return JSON.stringify(object);
    }
  }, {
    key: "jsonDecode",
    value: function jsonDecode(jsonString, defaultValue) {
      if (!jsonString) {
        return defaultValue;
      }

      if (typeof jsonString === 'string') {
        var result;

        try {
          result = $.parseJSON(jsonString);
        } catch (err) {
          result = defaultValue;
        }

        return result;
      }

      return jsonString;
    }
  }, {
    key: "getRequestParams",
    value: function getRequestParams() {
      if (window.rvMedia.options && window.rvMedia.options.open_in === 'modal') {
        return $.extend(true, _Config_MediaConfig__WEBPACK_IMPORTED_MODULE_0__.MediaConfig.request_params, window.rvMedia.options || {});
      }

      return _Config_MediaConfig__WEBPACK_IMPORTED_MODULE_0__.MediaConfig.request_params;
    }
  }, {
    key: "setSelectedFile",
    value: function setSelectedFile(fileId) {
      if (typeof window.rvMedia.options !== 'undefined') {
        window.rvMedia.options.selected_file_id = fileId;
      } else {
        _Config_MediaConfig__WEBPACK_IMPORTED_MODULE_0__.MediaConfig.request_params.selected_file_id = fileId;
      }
    }
  }, {
    key: "getConfigs",
    value: function getConfigs() {
      return _Config_MediaConfig__WEBPACK_IMPORTED_MODULE_0__.MediaConfig;
    }
  }, {
    key: "storeConfig",
    value: function storeConfig() {
      localStorage.setItem('MediaConfig', Helpers.jsonEncode(_Config_MediaConfig__WEBPACK_IMPORTED_MODULE_0__.MediaConfig));
    }
  }, {
    key: "storeRecentItems",
    value: function storeRecentItems() {
      localStorage.setItem('RecentItems', Helpers.jsonEncode(_Config_MediaConfig__WEBPACK_IMPORTED_MODULE_0__.RecentItems));
    }
  }, {
    key: "addToRecent",
    value: function addToRecent(id) {
      if (id instanceof Array) {
        _.each(id, function (value) {
          _Config_MediaConfig__WEBPACK_IMPORTED_MODULE_0__.RecentItems.push(value);
        });
      } else {
        _Config_MediaConfig__WEBPACK_IMPORTED_MODULE_0__.RecentItems.push(id);
        this.storeRecentItems();
      }
    }
  }, {
    key: "getItems",
    value: function getItems() {
      var items = [];
      $('.js-media-list-title').each(function (index, el) {
        var $box = $(el);
        var data = $box.data() || {};
        data.index_key = $box.index();
        items.push(data);
      });
      return items;
    }
  }, {
    key: "getSelectedItems",
    value: function getSelectedItems() {
      var selected = [];
      $('.js-media-list-title input[type=checkbox]:checked').each(function (index, el) {
        var $box = $(el).closest('.js-media-list-title');
        var data = $box.data() || {};
        data.index_key = $box.index();
        selected.push(data);
      });
      return selected;
    }
  }, {
    key: "getSelectedFiles",
    value: function getSelectedFiles() {
      var selected = [];
      $('.js-media-list-title[data-context=file] input[type=checkbox]:checked').each(function (index, el) {
        var $box = $(el).closest('.js-media-list-title');
        var data = $box.data() || {};
        data.index_key = $box.index();
        selected.push(data);
      });
      return selected;
    }
  }, {
    key: "getSelectedFolder",
    value: function getSelectedFolder() {
      var selected = [];
      $('.js-media-list-title[data-context=folder] input[type=checkbox]:checked').each(function (index, el) {
        var $box = $(el).closest('.js-media-list-title');
        var data = $box.data() || {};
        data.index_key = $box.index();
        selected.push(data);
      });
      return selected;
    }
  }, {
    key: "isUseInModal",
    value: function isUseInModal() {
      return window.rvMedia && window.rvMedia.options && window.rvMedia.options.open_in === 'modal';
    }
  }, {
    key: "resetPagination",
    value: function resetPagination() {
      RV_MEDIA_CONFIG.pagination = {
        paged: 1,
        posts_per_page: 40,
        in_process_get_media: false,
        has_more: true
      };
    }
  }]);

  return Helpers;
}();

/***/ }),

/***/ "./platform/core/media/resources/assets/js/App/Services/ActionsService.js":
/*!********************************************************************************!*\
  !*** ./platform/core/media/resources/assets/js/App/Services/ActionsService.js ***!
  \********************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "ActionsService": () => (/* binding */ ActionsService)
/* harmony export */ });
/* harmony import */ var _Config_MediaConfig__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../Config/MediaConfig */ "./platform/core/media/resources/assets/js/App/Config/MediaConfig.js");
/* harmony import */ var _Helpers_Helpers__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../Helpers/Helpers */ "./platform/core/media/resources/assets/js/App/Helpers/Helpers.js");
/* harmony import */ var _MessageService__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./MessageService */ "./platform/core/media/resources/assets/js/App/Services/MessageService.js");
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }




var ActionsService = /*#__PURE__*/function () {
  function ActionsService() {
    _classCallCheck(this, ActionsService);
  }

  _createClass(ActionsService, null, [{
    key: "handleDropdown",
    value: function handleDropdown() {
      var selected = _.size(_Helpers_Helpers__WEBPACK_IMPORTED_MODULE_1__.Helpers.getSelectedItems());

      ActionsService.renderActions();

      if (selected > 0) {
        $('.rv-dropdown-actions').removeClass('disabled');
      } else {
        $('.rv-dropdown-actions').addClass('disabled');
      }
    }
  }, {
    key: "handlePreview",
    value: function handlePreview() {
      var selected = [];

      _.each(_Helpers_Helpers__WEBPACK_IMPORTED_MODULE_1__.Helpers.getSelectedFiles(), function (value) {
        if (_.includes(['image', 'pdf', 'text', 'video'], value.type)) {
          selected.push({
            src: value.full_url
          });
          _Config_MediaConfig__WEBPACK_IMPORTED_MODULE_0__.RecentItems.push(value.id);
        }
      });

      if (_.size(selected) > 0) {
        $.fancybox.open(selected);
        _Helpers_Helpers__WEBPACK_IMPORTED_MODULE_1__.Helpers.storeRecentItems();
      } else {
        this.handleGlobalAction('download');
      }
    }
  }, {
    key: "handleCopyLink",
    value: function handleCopyLink() {
      var links = '';

      _.each(_Helpers_Helpers__WEBPACK_IMPORTED_MODULE_1__.Helpers.getSelectedFiles(), function (value) {
        if (!_.isEmpty(links)) {
          links += '\n';
        }

        links += value.full_url;
      });

      var $clipboardTemp = $('.js-rv-clipboard-temp');
      $clipboardTemp.data('clipboard-text', links);
      new Clipboard('.js-rv-clipboard-temp', {
        text: function text() {
          return links;
        }
      });
      _MessageService__WEBPACK_IMPORTED_MODULE_2__.MessageService.showMessage('success', RV_MEDIA_CONFIG.translations.clipboard.success, RV_MEDIA_CONFIG.translations.message.success_header);
      $clipboardTemp.trigger('click');
    }
  }, {
    key: "handleGlobalAction",
    value: function handleGlobalAction(type, callback) {
      var selected = [];

      _.each(_Helpers_Helpers__WEBPACK_IMPORTED_MODULE_1__.Helpers.getSelectedItems(), function (value) {
        selected.push({
          is_folder: value.is_folder,
          id: value.id,
          full_url: value.full_url
        });
      });

      switch (type) {
        case 'rename':
          $('#modal_rename_items').modal('show').find('form.rv-form').data('action', type);
          break;

        case 'copy_link':
          ActionsService.handleCopyLink();
          break;

        case 'preview':
          ActionsService.handlePreview();
          break;

        case 'trash':
          $('#modal_trash_items').modal('show').find('form.rv-form').data('action', type);
          break;

        case 'delete':
          $('#modal_delete_items').modal('show').find('form.rv-form').data('action', type);
          break;

        case 'empty_trash':
          $('#modal_empty_trash').modal('show').find('form.rv-form').data('action', type);
          break;

        case 'download':
          var downloadLink = RV_MEDIA_URL.download;
          var count = 0;

          _.each(_Helpers_Helpers__WEBPACK_IMPORTED_MODULE_1__.Helpers.getSelectedItems(), function (value) {
            if (!_.includes(_Helpers_Helpers__WEBPACK_IMPORTED_MODULE_1__.Helpers.getConfigs().denied_download, value.mime_type)) {
              downloadLink += (count === 0 ? '?' : '&') + 'selected[' + count + '][is_folder]=' + value.is_folder + '&selected[' + count + '][id]=' + value.id;
              count++;
            }
          });

          if (downloadLink !== RV_MEDIA_URL.download) {
            window.open(downloadLink, '_blank');
          } else {
            _MessageService__WEBPACK_IMPORTED_MODULE_2__.MessageService.showMessage('error', RV_MEDIA_CONFIG.translations.download.error, RV_MEDIA_CONFIG.translations.message.error_header);
          }

          break;

        default:
          ActionsService.processAction({
            selected: selected,
            action: type
          }, callback);
          break;
      }
    }
  }, {
    key: "processAction",
    value: function processAction(data) {
      var callback = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : null;
      $.ajax({
        url: RV_MEDIA_URL.global_actions,
        type: 'POST',
        data: data,
        dataType: 'json',
        beforeSend: function beforeSend() {
          _Helpers_Helpers__WEBPACK_IMPORTED_MODULE_1__.Helpers.showAjaxLoading();
        },
        success: function success(res) {
          _Helpers_Helpers__WEBPACK_IMPORTED_MODULE_1__.Helpers.resetPagination();

          if (!res.error) {
            _MessageService__WEBPACK_IMPORTED_MODULE_2__.MessageService.showMessage('success', res.message, RV_MEDIA_CONFIG.translations.message.success_header);
          } else {
            _MessageService__WEBPACK_IMPORTED_MODULE_2__.MessageService.showMessage('error', res.message, RV_MEDIA_CONFIG.translations.message.error_header);
          }

          if (callback) {
            callback(res);
          }
        },
        complete: function complete() {
          _Helpers_Helpers__WEBPACK_IMPORTED_MODULE_1__.Helpers.hideAjaxLoading();
        },
        error: function error(data) {
          _MessageService__WEBPACK_IMPORTED_MODULE_2__.MessageService.handleError(data);
        }
      });
    }
  }, {
    key: "renderRenameItems",
    value: function renderRenameItems() {
      var VIEW = $('#rv_media_rename_item').html();
      var $itemsWrapper = $('#modal_rename_items .rename-items').empty();

      _.each(_Helpers_Helpers__WEBPACK_IMPORTED_MODULE_1__.Helpers.getSelectedItems(), function (value) {
        var item = VIEW.replace(/__icon__/gi, value.icon || 'fa fa-file').replace(/__placeholder__/gi, 'Input file name').replace(/__value__/gi, value.name);
        var $item = $(item);
        $item.data('id', value.id);
        $item.data('is_folder', value.is_folder);
        $item.data('name', value.name);
        $itemsWrapper.append($item);
      });
    }
  }, {
    key: "renderActions",
    value: function renderActions() {
      var hasFolderSelected = _Helpers_Helpers__WEBPACK_IMPORTED_MODULE_1__.Helpers.getSelectedFolder().length > 0;
      var ACTION_TEMPLATE = $('#rv_action_item').html();
      var initializedItem = 0;
      var $dropdownActions = $('.rv-dropdown-actions .dropdown-menu');
      $dropdownActions.empty();
      var actionsList = $.extend({}, true, _Helpers_Helpers__WEBPACK_IMPORTED_MODULE_1__.Helpers.getConfigs().actions_list);

      if (hasFolderSelected) {
        actionsList.basic = _.reject(actionsList.basic, function (item) {
          return item.action === 'preview';
        });
        actionsList.file = _.reject(actionsList.file, function (item) {
          return item.action === 'copy_link';
        });

        if (!_.includes(RV_MEDIA_CONFIG.permissions, 'folders.create')) {
          actionsList.file = _.reject(actionsList.file, function (item) {
            return item.action === 'make_copy';
          });
        }

        if (!_.includes(RV_MEDIA_CONFIG.permissions, 'folders.edit')) {
          actionsList.file = _.reject(actionsList.file, function (item) {
            return _.includes(['rename'], item.action);
          });
          actionsList.user = _.reject(actionsList.user, function (item) {
            return _.includes(['rename'], item.action);
          });
        }

        if (!_.includes(RV_MEDIA_CONFIG.permissions, 'folders.trash')) {
          actionsList.other = _.reject(actionsList.other, function (item) {
            return _.includes(['trash', 'restore'], item.action);
          });
        }

        if (!_.includes(RV_MEDIA_CONFIG.permissions, 'folders.destroy')) {
          actionsList.other = _.reject(actionsList.other, function (item) {
            return _.includes(['delete'], item.action);
          });
        }

        if (!_.includes(RV_MEDIA_CONFIG.permissions, 'folders.favorite')) {
          actionsList.other = _.reject(actionsList.other, function (item) {
            return _.includes(['favorite', 'remove_favorite'], item.action);
          });
        }
      }

      var selectedFiles = _Helpers_Helpers__WEBPACK_IMPORTED_MODULE_1__.Helpers.getSelectedFiles();
      var canPreview = false;

      _.each(selectedFiles, function (value) {
        if (_.includes(['image', 'pdf', 'text', 'video'], value.type)) {
          canPreview = true;
        }
      });

      if (!canPreview) {
        actionsList.basic = _.reject(actionsList.basic, function (item) {
          return item.action === 'preview';
        });
      }

      if (selectedFiles.length > 0) {
        if (!_.includes(RV_MEDIA_CONFIG.permissions, 'files.create')) {
          actionsList.file = _.reject(actionsList.file, function (item) {
            return item.action === 'make_copy';
          });
        }

        if (!_.includes(RV_MEDIA_CONFIG.permissions, 'files.edit')) {
          actionsList.file = _.reject(actionsList.file, function (item) {
            return _.includes(['rename'], item.action);
          });
        }

        if (!_.includes(RV_MEDIA_CONFIG.permissions, 'files.trash')) {
          actionsList.other = _.reject(actionsList.other, function (item) {
            return _.includes(['trash', 'restore'], item.action);
          });
        }

        if (!_.includes(RV_MEDIA_CONFIG.permissions, 'files.destroy')) {
          actionsList.other = _.reject(actionsList.other, function (item) {
            return _.includes(['delete'], item.action);
          });
        }

        if (!_.includes(RV_MEDIA_CONFIG.permissions, 'files.favorite')) {
          actionsList.other = _.reject(actionsList.other, function (item) {
            return _.includes(['favorite', 'remove_favorite'], item.action);
          });
        }
      }

      _.each(actionsList, function (action, key) {
        _.each(action, function (item, index) {
          var is_break = false;

          switch (_Helpers_Helpers__WEBPACK_IMPORTED_MODULE_1__.Helpers.getRequestParams().view_in) {
            case 'all_media':
              if (_.includes(['remove_favorite', 'delete', 'restore'], item.action)) {
                is_break = true;
              }

              break;

            case 'recent':
              if (_.includes(['remove_favorite', 'delete', 'restore', 'make_copy'], item.action)) {
                is_break = true;
              }

              break;

            case 'favorites':
              if (_.includes(['favorite', 'delete', 'restore', 'make_copy'], item.action)) {
                is_break = true;
              }

              break;

            case 'trash':
              if (!_.includes(['preview', 'delete', 'restore', 'rename', 'download'], item.action)) {
                is_break = true;
              }

              break;
          }

          if (!is_break) {
            var template = ACTION_TEMPLATE.replace(/__action__/gi, item.action || '').replace(/__icon__/gi, item.icon || '').replace(/__name__/gi, RV_MEDIA_CONFIG.translations.actions_list[key][item.action] || item.name);

            if (!index && initializedItem) {
              template = '<li role="separator" class="divider"></li>' + template;
            }

            $dropdownActions.append(template);
          }
        });

        if (action.length > 0) {
          initializedItem++;
        }
      });
    }
  }]);

  return ActionsService;
}();

/***/ }),

/***/ "./platform/core/media/resources/assets/js/App/Services/ContextMenuService.js":
/*!************************************************************************************!*\
  !*** ./platform/core/media/resources/assets/js/App/Services/ContextMenuService.js ***!
  \************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "ContextMenuService": () => (/* binding */ ContextMenuService)
/* harmony export */ });
/* harmony import */ var _ActionsService__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./ActionsService */ "./platform/core/media/resources/assets/js/App/Services/ActionsService.js");
/* harmony import */ var _Helpers_Helpers__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../Helpers/Helpers */ "./platform/core/media/resources/assets/js/App/Helpers/Helpers.js");
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }



var ContextMenuService = /*#__PURE__*/function () {
  function ContextMenuService() {
    _classCallCheck(this, ContextMenuService);
  }

  _createClass(ContextMenuService, null, [{
    key: "initContext",
    value: function initContext() {
      if (jQuery().contextMenu) {
        $.contextMenu({
          selector: '.js-context-menu[data-context="file"]',
          build: function build() {
            return {
              items: ContextMenuService._fileContextMenu()
            };
          }
        });
        $.contextMenu({
          selector: '.js-context-menu[data-context="folder"]',
          build: function build() {
            return {
              items: ContextMenuService._folderContextMenu()
            };
          }
        });
      }
    }
  }, {
    key: "_fileContextMenu",
    value: function _fileContextMenu() {
      var items = {
        preview: {
          name: 'Preview',
          icon: function icon(opt, $itemElement, itemKey, item) {
            $itemElement.html('<i class="fa fa-eye" aria-hidden="true"></i> ' + item.name);
            return 'context-menu-icon-updated';
          },
          callback: function callback() {
            _ActionsService__WEBPACK_IMPORTED_MODULE_0__.ActionsService.handlePreview();
          }
        }
      };

      _.each(_Helpers_Helpers__WEBPACK_IMPORTED_MODULE_1__.Helpers.getConfigs().actions_list, function (actionGroup, key) {
        _.each(actionGroup, function (value) {
          items[value.action] = {
            name: value.name,
            icon: function icon(opt, $itemElement, itemKey, item) {
              $itemElement.html('<i class="' + value.icon + '" aria-hidden="true"></i> ' + (RV_MEDIA_CONFIG.translations.actions_list[key][value.action] || item.name));
              return 'context-menu-icon-updated';
            },
            callback: function callback() {
              $('.js-files-action[data-action="' + value.action + '"]').trigger('click');
            }
          };
        });
      });

      var except = [];

      switch (_Helpers_Helpers__WEBPACK_IMPORTED_MODULE_1__.Helpers.getRequestParams().view_in) {
        case 'all_media':
          except = ['remove_favorite', 'delete', 'restore'];
          break;

        case 'recent':
          except = ['remove_favorite', 'delete', 'restore', 'make_copy'];
          break;

        case 'favorites':
          except = ['favorite', 'delete', 'restore', 'make_copy'];
          break;

        case 'trash':
          items = {
            preview: items.preview,
            rename: items.rename,
            download: items.download,
            "delete": items["delete"],
            restore: items.restore
          };
          break;
      }

      _.each(except, function (value) {
        items[value] = undefined;
      });

      var hasFolderSelected = _Helpers_Helpers__WEBPACK_IMPORTED_MODULE_1__.Helpers.getSelectedFolder().length > 0;

      if (hasFolderSelected) {
        items.preview = undefined;
        items.copy_link = undefined;

        if (!_.includes(RV_MEDIA_CONFIG.permissions, 'folders.create')) {
          items.make_copy = undefined;
        }

        if (!_.includes(RV_MEDIA_CONFIG.permissions, 'folders.edit')) {
          items.rename = undefined;
        }

        if (!_.includes(RV_MEDIA_CONFIG.permissions, 'folders.trash')) {
          items.trash = undefined;
          items.restore = undefined;
        }

        if (!_.includes(RV_MEDIA_CONFIG.permissions, 'folders.destroy')) {
          items["delete"] = undefined;
        }

        if (!_.includes(RV_MEDIA_CONFIG.permissions, 'folders.favorite')) {
          items.favorite = undefined;
          items.remove_favorite = undefined;
        }
      }

      var selectedFiles = _Helpers_Helpers__WEBPACK_IMPORTED_MODULE_1__.Helpers.getSelectedFiles();

      if (selectedFiles.length > 0) {
        if (!_.includes(RV_MEDIA_CONFIG.permissions, 'files.create')) {
          items.make_copy = undefined;
        }

        if (!_.includes(RV_MEDIA_CONFIG.permissions, 'files.edit')) {
          items.rename = undefined;
        }

        if (!_.includes(RV_MEDIA_CONFIG.permissions, 'files.trash')) {
          items.trash = undefined;
          items.restore = undefined;
        }

        if (!_.includes(RV_MEDIA_CONFIG.permissions, 'files.destroy')) {
          items["delete"] = undefined;
        }

        if (!_.includes(RV_MEDIA_CONFIG.permissions, 'files.favorite')) {
          items.favorite = undefined;
          items.remove_favorite = undefined;
        }
      }

      var canPreview = false;

      _.each(selectedFiles, function (value) {
        if (_.includes(['image', 'pdf', 'text', 'video'], value.type)) {
          canPreview = true;
        }
      });

      if (!canPreview) {
        items.preview = undefined;
      }

      return items;
    }
  }, {
    key: "_folderContextMenu",
    value: function _folderContextMenu() {
      var items = ContextMenuService._fileContextMenu();

      items.preview = undefined;
      items.copy_link = undefined;
      return items;
    }
  }, {
    key: "destroyContext",
    value: function destroyContext() {
      if (jQuery().contextMenu) {
        $.contextMenu('destroy');
      }
    }
  }]);

  return ContextMenuService;
}();

/***/ }),

/***/ "./platform/core/media/resources/assets/js/App/Services/MessageService.js":
/*!********************************************************************************!*\
  !*** ./platform/core/media/resources/assets/js/App/Services/MessageService.js ***!
  \********************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "MessageService": () => (/* binding */ MessageService)
/* harmony export */ });
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }

var MessageService = /*#__PURE__*/function () {
  function MessageService() {
    _classCallCheck(this, MessageService);
  }

  _createClass(MessageService, null, [{
    key: "showMessage",
    value: function showMessage(type, message) {
      toastr.options = {
        closeButton: true,
        progressBar: true,
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
      var messageHeader = '';

      switch (type) {
        case 'error':
          messageHeader = RV_MEDIA_CONFIG.translations.message.error_header;
          break;

        case 'success':
          messageHeader = RV_MEDIA_CONFIG.translations.message.success_header;
          break;
      }

      toastr[type](message, messageHeader);
    }
  }, {
    key: "handleError",
    value: function handleError(data) {
      if (typeof data.responseJSON !== 'undefined' && !_.isArray(data.errors)) {
        MessageService.handleValidationError(data.responseJSON.errors);
      } else {
        if (typeof data.responseJSON !== 'undefined') {
          if (typeof data.responseJSON.errors !== 'undefined') {
            if (data.status === 422) {
              MessageService.handleValidationError(data.responseJSON.errors);
            }
          } else if (typeof data.responseJSON.message !== 'undefined') {
            MessageService.showMessage('error', data.responseJSON.message);
          } else {
            $.each(data.responseJSON, function (index, el) {
              $.each(el, function (key, item) {
                MessageService.showMessage('error', item);
              });
            });
          }
        } else {
          MessageService.showMessage('error', data.statusText);
        }
      }
    }
  }, {
    key: "handleValidationError",
    value: function handleValidationError(errors) {
      var message = '';
      $.each(errors, function (index, item) {
        message += item + '<br />';
        var $input = $('*[name="' + index + '"]');
        $input.addClass('field-has-error');
        var $input_array = $('*[name$="[' + index + ']"]');
        $input_array.addClass('field-has-error');
      });
      MessageService.showMessage('error', message);
    }
  }]);

  return MessageService;
}();

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	/* webpack/runtime/define property getters */
/******/ 	(() => {
/******/ 		// define getter functions for harmony exports
/******/ 		__webpack_require__.d = (exports, definition) => {
/******/ 			for(var key in definition) {
/******/ 				if(__webpack_require__.o(definition, key) && !__webpack_require__.o(exports, key)) {
/******/ 					Object.defineProperty(exports, key, { enumerable: true, get: definition[key] });
/******/ 				}
/******/ 			}
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/hasOwnProperty shorthand */
/******/ 	(() => {
/******/ 		__webpack_require__.o = (obj, prop) => (Object.prototype.hasOwnProperty.call(obj, prop))
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/make namespace object */
/******/ 	(() => {
/******/ 		// define __esModule on exports
/******/ 		__webpack_require__.r = (exports) => {
/******/ 			if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 				Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 			}
/******/ 			Object.defineProperty(exports, '__esModule', { value: true });
/******/ 		};
/******/ 	})();
/******/ 	
/************************************************************************/
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
(() => {
/*!**************************************************************!*\
  !*** ./platform/core/media/resources/assets/js/integrate.js ***!
  \**************************************************************/
__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "EditorService": () => (/* binding */ EditorService)
/* harmony export */ });
/* harmony import */ var _App_Helpers_Helpers__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./App/Helpers/Helpers */ "./platform/core/media/resources/assets/js/App/Helpers/Helpers.js");
/* harmony import */ var _App_Config_MediaConfig__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./App/Config/MediaConfig */ "./platform/core/media/resources/assets/js/App/Config/MediaConfig.js");
/* harmony import */ var _App_Services_ContextMenuService__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./App/Services/ContextMenuService */ "./platform/core/media/resources/assets/js/App/Services/ContextMenuService.js");
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }




var EditorService = /*#__PURE__*/function () {
  function EditorService() {
    _classCallCheck(this, EditorService);
  }

  _createClass(EditorService, null, [{
    key: "editorSelectFile",
    value: function editorSelectFile(selectedFiles) {
      var is_ckeditor = _App_Helpers_Helpers__WEBPACK_IMPORTED_MODULE_0__.Helpers.getUrlParam('CKEditor') || _App_Helpers_Helpers__WEBPACK_IMPORTED_MODULE_0__.Helpers.getUrlParam('CKEditorFuncNum');

      if (window.opener && is_ckeditor) {
        var firstItem = _.first(selectedFiles);

        window.opener.CKEDITOR.tools.callFunction(_App_Helpers_Helpers__WEBPACK_IMPORTED_MODULE_0__.Helpers.getUrlParam('CKEditorFuncNum'), firstItem.full_url);

        if (window.opener) {
          window.close();
        }
      } else {// No WYSIWYG editor found, use custom method.
      }
    }
  }]);

  return EditorService;
}();

var rvMedia = /*#__PURE__*/_createClass(function rvMedia(selector, options) {
  _classCallCheck(this, rvMedia);

  window.rvMedia = window.rvMedia || {};
  var $body = $('body');
  var defaultOptions = {
    multiple: true,
    type: '*',
    onSelectFiles: function onSelectFiles(files, $el) {}
  };
  options = $.extend(true, defaultOptions, options);

  var clickCallback = function clickCallback(event) {
    event.preventDefault();
    var $current = $(event.currentTarget);
    $('#rv_media_modal').modal('show');
    window.rvMedia.options = options;
    window.rvMedia.options.open_in = 'modal';
    window.rvMedia.$el = $current;
    _App_Config_MediaConfig__WEBPACK_IMPORTED_MODULE_1__.MediaConfig.request_params.filter = 'everything';
    _App_Helpers_Helpers__WEBPACK_IMPORTED_MODULE_0__.Helpers.storeConfig();
    var elementOptions = window.rvMedia.$el.data('rv-media');

    if (typeof elementOptions !== 'undefined' && elementOptions.length > 0) {
      elementOptions = elementOptions[0];
      window.rvMedia.options = $.extend(true, window.rvMedia.options, elementOptions || {});

      if (typeof elementOptions.selected_file_id !== 'undefined') {
        window.rvMedia.options.is_popup = true;
      } else if (typeof window.rvMedia.options.is_popup !== 'undefined') {
        window.rvMedia.options.is_popup = undefined;
      }
    }

    if ($('#rv_media_body .rv-media-container').length === 0) {
      $('#rv_media_body').load(RV_MEDIA_URL.popup, function (data) {
        if (data.error) {
          alert(data.message);
        }

        $('#rv_media_body').removeClass('media-modal-loading').closest('.modal-content').removeClass('bb-loading');
        $(document).find('.rv-media-container .js-change-action[data-type=refresh]').trigger('click');

        if (_App_Helpers_Helpers__WEBPACK_IMPORTED_MODULE_0__.Helpers.getRequestParams().filter !== 'everything') {
          $('.rv-media-actions .btn.js-rv-media-change-filter-group.js-filter-by-type').hide();
        }

        _App_Services_ContextMenuService__WEBPACK_IMPORTED_MODULE_2__.ContextMenuService.destroyContext();
        _App_Services_ContextMenuService__WEBPACK_IMPORTED_MODULE_2__.ContextMenuService.initContext();
      });
    } else {
      $(document).find('.rv-media-container .js-change-action[data-type=refresh]').trigger('click');
    }
  };

  if (typeof selector === 'string') {
    $body.off('click', selector).on('click', selector, clickCallback);
  } else {
    selector.off('click').on('click', clickCallback);
  }
});

window.RvMediaStandAlone = rvMedia;
$('.js-insert-to-editor').off('click').on('click', function (event) {
  event.preventDefault();
  var selectedFiles = _App_Helpers_Helpers__WEBPACK_IMPORTED_MODULE_0__.Helpers.getSelectedFiles();

  if (_.size(selectedFiles) > 0) {
    EditorService.editorSelectFile(selectedFiles);
  }
});

$.fn.rvMedia = function (options) {
  var $selector = $(this);
  _App_Config_MediaConfig__WEBPACK_IMPORTED_MODULE_1__.MediaConfig.request_params.filter = 'everything';
  $(document).find('.js-insert-to-editor').prop('disabled', _App_Config_MediaConfig__WEBPACK_IMPORTED_MODULE_1__.MediaConfig.request_params.view_in === 'trash');
  _App_Helpers_Helpers__WEBPACK_IMPORTED_MODULE_0__.Helpers.storeConfig();
  new rvMedia($selector, options);
};
})();

/******/ })()
;