/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
/******/ 	var __webpack_modules__ = ({

/***/ "./platform/plugins/comment/resources/assets/js/settings/UpdateVersionService.js":
/*!***************************************************************************************!*\
  !*** ./platform/plugins/comment/resources/assets/js/settings/UpdateVersionService.js ***!
  \***************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }

var UpdateVersionService = /*#__PURE__*/function () {
  function UpdateVersionService(element) {
    _classCallCheck(this, UpdateVersionService);

    var apis = element.data('apis');
    this.$el = element;
    this.$buttonCheck = element.find('#check-version');
    this.checkLatestApi = apis.check;
    this.downloadApi = apis.download;
    this.initEvents();
  }

  _createClass(UpdateVersionService, [{
    key: "initEvents",
    value: function initEvents() {
      this.$buttonCheck.on('click', this.check.bind(this));
    }
  }, {
    key: "check",
    value: function check() {
      var _this = this;

      this.$buttonCheck.prop('disabled', true).addClass('button-loading');

      if (!this.$buttonCheck.hasClass('has-new-version')) {
        this.callApi(this.checkLatestApi).then(function (res) {
          var data = res.data;

          if (data.has) {
            // has new updates
            _this.$buttonCheck.before("\n                        <div class=\"alert alert-warning\">\n                            Comment version <strong>".concat(data.version, "</strong> is now available. Would you like to download it now?\n                        </div>\n                    "));

            _this.$buttonCheck.attr('class', 'btn btn-primary').addClass('has-new-version').prop('disabled', false).html('<i class="fas fa-download"></i> Install Update');
          } else {
            _this.$buttonCheck.before("\n                        <div class=\"alert alert-info\">\n                            Comment Plugin is up to update.\n                        </div>\n                    ");

            _this.$buttonCheck.removeClass('button-loading');
          }
        });
      } else {
        var $alert = this.$buttonCheck.prev('.alert');
        this.installUpdate($alert);
      }
    }
  }, {
    key: "installUpdate",
    value: function installUpdate($alert) {
      var _this2 = this;

      var message = this.$el.data('msg');
      var files = [];

      var loop = function loop() {
        var $text = $("<p class=\"text-primary\"><span>".concat(message, "</span></p>"));

        _this2.$el.append($text);

        _this2.callApi(_this2.downloadApi, {
          files: files
        }, 'POST').then(function (res) {
          if (!res.error) {
            var _res$data;

            $text.attr('class', 'text-success').prepend('<i class="fas fa-check-circle mr-2"></i> ');

            if (!((_res$data = res.data) !== null && _res$data !== void 0 && _res$data.ok)) {
              var _res$data2;

              message = res.message;

              if ((_res$data2 = res.data) !== null && _res$data2 !== void 0 && _res$data2.file) {
                var _res$data3;

                files.push((_res$data3 = res.data) === null || _res$data3 === void 0 ? void 0 : _res$data3.file);
              }

              loop();
            } else {
              _this2.$buttonCheck.prop('disabled', false).removeClass('button-loading').attr('class', 'btn btn-warning').html('<i class="fas fa-sync-alt"></i> Reload').off('click').on('click', function () {
                return window.location.reload();
              });

              $alert.replaceWith("\n                            <div class=\"alert alert-success\">\n                                Update plugin successfully! Press <a onclick=\"window.location.reload()\"><strong>Reload</strong></a> to finish\n                            </div>\n                        ").slideDown();
            }
          } else {
            var _res$message;

            $alert.replaceWith("\n                        <div class=\"alert alert-danger\">\n                            ".concat((_res$message = res.message) !== null && _res$message !== void 0 ? _res$message : 'There are somethings wrong. Please try again', "\n                        </div>\n                    ")).slideDown();
          }
        });
      };

      $alert.attr('class', 'alert alert-warning').text('It will just take a few minutes. Please do not refresh the screen or close the window before the update finishes');
      loop();
    }
  }, {
    key: "callApi",
    value: function callApi(url, data) {
      var method = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : 'GET';
      return new Promise(function (resolve) {
        return $.ajax({
          url: url,
          data: data,
          method: method,
          success: function success(res) {
            resolve(res);
          },
          error: function error(res) {
            var _res$responseJSON;

            resolve({
              error: true,
              message: res === null || res === void 0 ? void 0 : (_res$responseJSON = res.responseJSON) === null || _res$responseJSON === void 0 ? void 0 : _res$responseJSON.message
            });
          }
        });
      });
    }
  }]);

  return UpdateVersionService;
}();

/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (UpdateVersionService);

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
/*!*************************************************************************!*\
  !*** ./platform/plugins/comment/resources/assets/js/comment-setting.js ***!
  \*************************************************************************/
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _settings_UpdateVersionService__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./settings/UpdateVersionService */ "./platform/plugins/comment/resources/assets/js/settings/UpdateVersionService.js");

$(function () {
  var $commentEnableCheckbox = $('#comment-enable');
  var $areaCommentSetting = $('#show-comments-setting');
  var $updaterVersion = $('#comment-plugin-updater');

  if ($commentEnableCheckbox.is(':checked')) {
    $areaCommentSetting.show();
  }

  $commentEnableCheckbox.on('change', function (e) {
    if (e.target.checked) {
      $areaCommentSetting.show();
    } else {
      $areaCommentSetting.hide();
    }
  });

  if ($updaterVersion.length) {
    new _settings_UpdateVersionService__WEBPACK_IMPORTED_MODULE_0__["default"]($updaterVersion);
  }
});
})();

/******/ })()
;