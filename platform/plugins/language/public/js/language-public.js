/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
var __webpack_exports__ = {};
/*!**************************************************************************!*\
  !*** ./platform/plugins/language/resources/assets/js/language-public.js ***!
  \**************************************************************************/


function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }

var LanguagePublicManagement = /*#__PURE__*/function () {
  function LanguagePublicManagement() {
    _classCallCheck(this, LanguagePublicManagement);
  }

  _createClass(LanguagePublicManagement, [{
    key: "init",
    value: function init() {
      $('.language-wrapper .dropdown .dropdown-toggle').off('click').on('click', function (event) {
        event.preventDefault();

        var _self = $(event.currentTarget);

        if (_self.hasClass('active')) {
          _self.closest('.language-wrapper').find('.dropdown .dropdown-menu').hide();

          _self.removeClass('active');
        } else {
          _self.closest('.language-wrapper').find('.dropdown .dropdown-menu').show();

          _self.addClass('active');
        }
      });
      $(document).on('click', function (event) {
        var _self = $(event.currentTarget);

        if (_self.closest('.language-wrapper').length === 0) {
          _self.closest('.language-wrapper').find('.dropdown .dropdown-menu').hide();

          _self.closest('.language-wrapper').find('.dropdown .dropdown-toggle').removeClass('active');
        }
      });
    }
  }]);

  return LanguagePublicManagement;
}();

$(document).ready(function () {
  new LanguagePublicManagement().init();
});
/******/ })()
;