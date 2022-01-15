/******/ (() => { // webpackBootstrap
var __webpack_exports__ = {};
/*!***************************************************************!*\
  !*** ./platform/core/base/resources/assets/js/system-info.js ***!
  \***************************************************************/
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }

var SystemInformationManagement = /*#__PURE__*/function () {
  function SystemInformationManagement() {
    _classCallCheck(this, SystemInformationManagement);
  }

  _createClass(SystemInformationManagement, [{
    key: "init",
    value: function init() {
      var s = document.getElementById('txt-report').value;
      s = s.replace(/(^\s*)|(\s*$)/gi, '');
      s = s.replace(/[ ]{2,}/gi, ' ');
      s = s.replace(/\n /, "\n");
      document.getElementById('txt-report').value = s;
      $('#btn-report').on('click', function () {
        $('#report-wrapper').slideToggle();
      });
      $('#copy-report').on('click', function () {
        $('#txt-report').select();
        document.execCommand('copy');
      });
    }
  }]);

  return SystemInformationManagement;
}();

$(document).ready(function () {
  new SystemInformationManagement().init();
});
/******/ })()
;