/******/ (() => { // webpackBootstrap
var __webpack_exports__ = {};
/*!*********************************************************************!*\
  !*** ./platform/plugins/audit-log/resources/assets/js/audit-log.js ***!
  \*********************************************************************/
$(document).ready(function () {
  BDashboard.loadWidget($('#widget_audit_logs').find('.widget-content'), route('audit-log.widget.activities'));
});
/******/ })()
;