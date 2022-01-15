/******/ (() => { // webpackBootstrap
var __webpack_exports__ = {};
/*!************************************************************************!*\
  !*** ./platform/plugins/payment/resources/assets/js/payment-detail.js ***!
  \************************************************************************/
$(function () {
  $(document).on("click", ".get-refund-detail", function (e) {
    e.preventDefault();
    var $this = $(e.currentTarget);
    $.ajax({
      type: "GET",
      cache: false,
      url: $this.data('url'),
      beforeSend: function beforeSend() {
        $this.find('i').addClass('fa-spin');
      },
      success: function success(res) {
        if (!res.error) {
          $($this.data('element')).html(res.data);
        } else {
          Botble.showError(res.message);
        }
      },
      error: function error(res) {
        Botble.handleError(res);
      },
      complete: function complete() {
        $this.find('i').removeClass('fa-spin');
      }
    });
  });
});
/******/ })()
;