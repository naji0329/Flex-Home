/******/ (() => { // webpackBootstrap
var __webpack_exports__ = {};
/*!************************************************************************!*\
  !*** ./platform/packages/seo-helper/resources/assets/js/seo-helper.js ***!
  \************************************************************************/
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }

var SEOHelperManagement = /*#__PURE__*/function () {
  function SEOHelperManagement() {
    _classCallCheck(this, SEOHelperManagement);

    this.$document = $(document);
  }

  _createClass(SEOHelperManagement, [{
    key: "handleMetaBox",
    value: function handleMetaBox() {
      var permalink = this.$document.find('#sample-permalink a');

      if (permalink.length) {
        $('.page-url-seo p').text(permalink.prop('href').replace('?preview=true', ''));
      }

      this.$document.on('click', '.btn-trigger-show-seo-detail', function (event) {
        event.preventDefault();
        $('.seo-edit-section').toggleClass('hidden');
      });
      this.$document.on('keyup', 'input[name=name]', function (event) {
        SEOHelperManagement.updateSEOTitle($(event.currentTarget).val());
      });
      this.$document.on('keyup', 'input[name=title]', function (event) {
        SEOHelperManagement.updateSEOTitle($(event.currentTarget).val());
      });
      this.$document.on('keyup', 'textarea[name=description]', function (event) {
        SEOHelperManagement.updateSEODescription($(event.currentTarget).val());
      });
      this.$document.on('keyup', '#seo_title', function (event) {
        if ($(event.currentTarget).val()) {
          $('.page-title-seo').text($(event.currentTarget).val());
          $('.default-seo-description').addClass('hidden');
          $('.existed-seo-meta').removeClass('hidden');
        } else {
          var $inputName = $('input[name=name]');

          if ($inputName.val()) {
            $('.page-title-seo').text($inputName.val());
          } else {
            $('.page-title-seo').text($('input[name=title]').val());
          }
        }
      });
      this.$document.on('keyup', '#seo_description', function (event) {
        if ($(event.currentTarget).val()) {
          $('.page-description-seo').text($(event.currentTarget).val());
        } else {
          $('.page-description-seo').text($('textarea[name=description]').val());
        }
      });
    }
  }], [{
    key: "updateSEOTitle",
    value: function updateSEOTitle(value) {
      if (value) {
        if (!$('#seo_title').val()) {
          $('.page-title-seo').text(value);
        }

        $('.default-seo-description').addClass('hidden');
        $('.existed-seo-meta').removeClass('hidden');
      } else {
        $('.default-seo-description').removeClass('hidden');
        $('.existed-seo-meta').addClass('hidden');
      }
    }
  }, {
    key: "updateSEODescription",
    value: function updateSEODescription(value) {
      if (value) {
        if (!$('#seo_description').val()) {
          $('.page-description-seo').text(value);
        }
      }
    }
  }]);

  return SEOHelperManagement;
}();

$(document).ready(function () {
  new SEOHelperManagement().handleMetaBox();
});
/******/ })()
;