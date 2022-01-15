/******/ (() => { // webpackBootstrap
var __webpack_exports__ = {};
/*!*********************************************************!*\
  !*** ./platform/core/base/resources/assets/js/cache.js ***!
  \*********************************************************/
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }

var CacheManagement = /*#__PURE__*/function () {
  function CacheManagement() {
    _classCallCheck(this, CacheManagement);
  }

  _createClass(CacheManagement, [{
    key: "init",
    value: function init() {
      $(document).on('click', '.btn-clear-cache', function (event) {
        event.preventDefault();

        var _self = $(event.currentTarget);

        _self.addClass('button-loading');

        $.ajax({
          url: _self.data('url'),
          type: 'POST',
          data: {
            type: _self.data('type')
          },
          success: function success(data) {
            _self.removeClass('button-loading');

            if (data.error) {
              Botble.showError(data.message);
            } else {
              Botble.showSuccess(data.message);
            }
          },
          error: function error(data) {
            _self.removeClass('button-loading');

            Botble.handleError(data);
          }
        });
      });
    }
  }]);

  return CacheManagement;
}();

$(document).ready(function () {
  new CacheManagement().init();
});
/******/ })()
;