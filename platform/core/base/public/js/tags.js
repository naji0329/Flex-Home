/******/ (() => { // webpackBootstrap
var __webpack_exports__ = {};
/*!********************************************************!*\
  !*** ./platform/core/base/resources/assets/js/tags.js ***!
  \********************************************************/
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }

var TagsManager = /*#__PURE__*/function () {
  function TagsManager() {
    _classCallCheck(this, TagsManager);
  }

  _createClass(TagsManager, [{
    key: "init",
    value: function init() {
      $(document).find('.tags').each(function (index, element) {
        var tagify = new Tagify(element, {
          keepInvalidTags: $(element).data('keep-invalid-tags') !== undefined ? $(element).data('keep-invalid-tags') : true,
          enforceWhitelist: $(element).data('enforce-whitelist') !== undefined ? $(element).data('enforce-whitelist') : false,
          delimiters: $(element).data('delimiters') !== undefined ? $(element).data('delimiters') : ',',
          whitelist: element.value.trim().split(/\s*,\s*/)
        });

        if ($(element).data('url')) {
          tagify.on('input', function (e) {
            tagify.settings.whitelist.length = 0; // reset current whitelist

            tagify.loading(true).dropdown.hide.call(tagify); // show the loader animation

            $.ajax({
              type: 'GET',
              url: $(element).data('url'),
              success: function success(data) {
                tagify.settings.whitelist = data; // render the suggestions dropdown.

                tagify.loading(false).dropdown.show.call(tagify, e.detail.value);
              }
            });
          });
        }
      });
    }
  }]);

  return TagsManager;
}();

$(document).ready(function () {
  new TagsManager().init();
});
/******/ })()
;