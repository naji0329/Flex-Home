/******/ (() => { // webpackBootstrap
var __webpack_exports__ = {};
/*!*******************************************************!*\
  !*** ./platform/core/acl/resources/assets/js/role.js ***!
  \*******************************************************/
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }

var Role = /*#__PURE__*/function () {
  function Role() {
    _classCallCheck(this, Role);
  }

  _createClass(Role, [{
    key: "init",
    value: function init() {
      $('#auto-checkboxes li').tree({
        onCheck: {
          node: 'expand'
        },
        onUncheck: {
          node: 'expand'
        },
        dnd: false,
        selectable: false
      });
      $('#mainNode .checker').change(function (event) {
        var _self = $(event.currentTarget);

        var set = _self.attr('data-set');

        var checked = _self.is(':checked');

        $(set).each(function (index, el) {
          if (checked) {
            $(el).attr('checked', true);
          } else {
            $(el).attr('checked', false);
          }
        });
      });
    }
  }]);

  return Role;
}();

$(document).ready(function () {
  new Role().init();
});
/******/ })()
;