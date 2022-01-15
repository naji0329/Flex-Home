/******/ (() => { // webpackBootstrap
var __webpack_exports__ = {};
/*!*********************************************************************!*\
  !*** ./platform/plugins/analytics/resources/assets/js/analytics.js ***!
  \*********************************************************************/
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }

var PluginAnalytics = /*#__PURE__*/function () {
  function PluginAnalytics() {
    _classCallCheck(this, PluginAnalytics);
  }

  _createClass(PluginAnalytics, null, [{
    key: "initCharts",
    value: function initCharts() {
      var stats = $('div[data-stats]').data('stats');
      var country_stats = $('div[data-country-stats]').data('country-stats');
      var lang_page_views = $('div[data-lang-pageviews]').data('lang-pageviews');
      var lang_visits = $('div[data-lang-visits]').data('lang-visits');
      var statArray = [];
      $.each(stats, function (index, el) {
        statArray.push({
          axis: el.axis,
          visitors: el.visitors,
          pageViews: el.pageViews
        });
      });

      if ($('#stats-chart').length) {
        new Morris.Area({
          element: 'stats-chart',
          resize: true,
          data: statArray,
          xkey: 'axis',
          ykeys: ['visitors', 'pageViews'],
          labels: [lang_visits, lang_page_views],
          lineColors: ['#dd4d37', '#3c8dbc'],
          hideHover: 'auto',
          parseTime: false
        });
      }

      var visitorsData = {};
      $.each(country_stats, function (index, el) {
        visitorsData[el[0]] = el[1];
      });
      $(document).find('#world-map').vectorMap({
        map: 'world_mill_en',
        backgroundColor: 'transparent',
        regionStyle: {
          initial: {
            fill: '#e4e4e4',
            'fill-opacity': 1,
            stroke: 'none',
            'stroke-width': 0,
            'stroke-opacity': 1
          }
        },
        series: {
          regions: [{
            values: visitorsData,
            scale: ['#c64333', '#dd4b39'],
            normalizeFunction: 'polynomial'
          }]
        },
        onRegionLabelShow: function onRegionLabelShow(e, el, code) {
          if (typeof visitorsData[code] !== 'undefined') {
            el.html(el.html() + ': ' + visitorsData[code] + ' ' + lang_visits);
          }
        }
      });
    }
  }]);

  return PluginAnalytics;
}();

$(document).ready(function () {
  BDashboard.loadWidget($('#widget_analytics_general').find('.widget-content'), route('analytics.general'), null, function () {
    PluginAnalytics.initCharts();
  });
  BDashboard.loadWidget($('#widget_analytics_page').find('.widget-content'), route('analytics.page'));
  BDashboard.loadWidget($('#widget_analytics_browser').find('.widget-content'), route('analytics.browser'));
  BDashboard.loadWidget($('#widget_analytics_referrer').find('.widget-content'), route('analytics.referrer'));
});
/******/ })()
;