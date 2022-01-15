/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./platform/core/base/resources/assets/js/base/app.js":
/*!************************************************************!*\
  !*** ./platform/core/base/resources/assets/js/base/app.js ***!
  \************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "App": () => (/* binding */ App)
/* harmony export */ });
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }

var resizeHandlers = [];
var App = /*#__PURE__*/function () {
  function App() {
    _classCallCheck(this, App);

    // IE mode
    this.isIE8 = false;
    this.isIE9 = false;
    this.isIE10 = false;
    this.$body = $('body');
    this.$html = $('html'); // Core handlers

    this.handleInit(); // initialize core

    this.handleOnResize(); // set and handle responsive
    // Handle group element heights

    App.addResizeHandler(this.handleHeight); // handle auto calculating height on window resize
    // UI Component handlers

    this.handleTabs(); // handle tabs

    if (jQuery().tooltip) {
      this.handleTooltips(); // handle bootstrap tooltips
    }

    this.handleModals(); // handle modals
    // Hacks

    this.handleFixInputPlaceholderForIE(); //IE8 & IE9 input placeholder issue fix
  } // Wrapper function to scroll(focus) to an element


  _createClass(App, [{
    key: "handleInit",
    value: // initializes main settings
    function handleInit() {
      this.isIE8 = !!navigator.userAgent.match(/MSIE 8.0/);
      this.isIE9 = !!navigator.userAgent.match(/MSIE 9.0/);
      this.isIE10 = !!navigator.userAgent.match(/MSIE 10.0/);

      if (this.isIE10) {
        this.$html.addClass('ie10'); // detect IE10 version
      }

      if (this.isIE10 || this.isIE9 || this.isIE8) {
        this.$html.addClass('ie'); // detect IE10 version
      }
    }
  }, {
    key: "handleTabs",
    value: function handleTabs() {
      //activate tab if tab id provided in the URL
      if (encodeURI(location.hash)) {
        var tab_id = encodeURI(location.hash.substr(1));
        var $tab = $('a[href="#' + tab_id + '"]');
        $tab.parents('.tab-pane:hidden').each(function (index, el) {
          $('a[href="#' + $(el).attr('id') + '"]').trigger('click');
        });
        $tab.trigger('click');
      }
    }
  }, {
    key: "handleModals",
    value: function handleModals() {
      var current = this; // fix stackable modal issue: when 2 or more modals opened, closing one of modal will remove .modal-open class.

      this.$body.on('hide.bs.modal', function () {
        var $modals = $('.modal:visible');

        if ($modals.length > 1 && current.$html.hasClass('modal-open') === false) {
          current.$html.addClass('modal-open');
        } else if ($modals.length <= 1) {
          current.$html.removeClass('modal-open');
        }
      }); // fix page scrollbars issue

      this.$body.on('show.bs.modal', '.modal', function (event) {
        if ($(event.currentTarget).hasClass('modal-scroll')) {
          current.$body.addClass('modal-open-noscroll');
        }
      }); // fix page scrollbars issue

      this.$body.on('hidden.bs.modal', '.modal', function () {
        current.$body.removeClass('modal-open-noscroll');
      }); // remove ajax content and remove cache on modal closed

      this.$body.on('hidden.bs.modal', '.modal:not(.modal-cached)', function (event) {
        $(event.currentTarget).removeData('bs.modal');
      });
    } // Handles Bootstrap Tooltips.

  }, {
    key: "handleTooltips",
    value: function handleTooltips() {
      // global tooltips
      $('.tooltips').tooltip(); // portlet tooltips

      $('.portlet > .portlet-title .fullscreen').tooltip({
        trigger: 'hover',
        container: 'body',
        title: 'Fullscreen'
      });
      $('.portlet > .portlet-title > .tools > .reload').tooltip({
        trigger: 'hover',
        container: 'body',
        title: 'Reload'
      });
      $('.portlet > .portlet-title > .tools > .remove').tooltip({
        trigger: 'hover',
        container: 'body',
        title: 'Remove'
      });
      $('.portlet > .portlet-title > .tools > .config').tooltip({
        trigger: 'hover',
        container: 'body',
        title: 'Settings'
      });
      $('.portlet > .portlet-title > .tools > .collapse, .portlet > .portlet-title > .tools > .expand').tooltip({
        trigger: 'hover',
        container: 'body',
        title: 'Collapse/Expand'
      });
    } // Fix input placeholder issue for IE8 and IE9

  }, {
    key: "handleFixInputPlaceholderForIE",
    value: function handleFixInputPlaceholderForIE() {
      //fix html5 placeholder attribute for ie7 & ie8
      if (this.isIE8 || this.isIE9) {
        // ie8 & ie9
        // this is html5 placeholder fix for inputs, inputs with placeholder-no-fix class will be skipped(e.g: we need this for password fields)
        $('input[placeholder]:not(.placeholder-no-fix), textarea[placeholder]:not(.placeholder-no-fix)').each(function (index, el) {
          var input = $(el);

          if (input.val() === '' && input.attr('placeholder') !== '') {
            input.addClass('placeholder').val(input.attr('placeholder'));
          }

          input.focus(function () {
            if (input.val() === input.attr('placeholder')) {
              input.val('');
            }
          });
          input.blur(function () {
            if (input.val() === '' || input.val() === input.attr('placeholder')) {
              input.val(input.attr('placeholder'));
            }
          });
        });
      }
    } // handle group element heights

  }, {
    key: "handleHeight",
    value: function handleHeight() {
      $('[data-auto-height]').each(function (index, el) {
        var parent = $(el);
        var items = $('[data-height]', parent);
        var height = 0;
        var mode = parent.attr('data-mode');
        var offset = parseInt(parent.attr('data-offset') ? parent.attr('data-offset') : 0);
        items.each(function (key, sub) {
          if ($(sub).attr('data-height') === 'height') {
            $(sub).css('height', '');
          } else {
            $(sub).css('min-height', '');
          }

          var height_ = mode === 'base-height' ? $(sub).outerHeight() : $(sub).outerHeight(true);

          if (height_ > height) {
            height = height_;
          }
        });
        height = height + offset;
        items.each(function (key, sub) {
          if ($(sub).attr('data-height') === 'height') {
            $(sub).css('height', height);
          } else {
            $(sub).css('min-height', height);
          }
        });

        if (parent.attr('data-related')) {
          $(parent.attr('data-related')).css('height', parent.height());
        }
      });
    } //public function to add callback a function which will be called on window resize

  }, {
    key: "handleOnResize",
    value: function handleOnResize() {
      var windowWidth = $(window).width();
      var resize;

      if (this.isIE8) {
        var currentHeight;
        $(window).resize(function () {
          if (currentHeight === document.documentElement.clientHeight) {
            return; //quite event since only body resized not window.
          }

          if (resize) {
            clearTimeout(resize);
          }

          resize = setTimeout(function () {
            App.runResizeHandlers();
          }, 50); // wait 50ms until window resize finishes.

          currentHeight = document.documentElement.clientHeight; // store last body client height
        });
      } else {
        $(window).resize(function () {
          if ($(window).width() !== windowWidth) {
            windowWidth = $(window).width();

            if (resize) {
              clearTimeout(resize);
            }

            resize = setTimeout(function () {
              App.runResizeHandlers();
            }, 50); // wait 50ms until window resize finishes.
          }
        });
      }
    }
  }], [{
    key: "scrollTo",
    value: function scrollTo(el, offset) {
      var pos = el && el.length > 0 ? el.offset().top : 0;

      if (el) {
        if ($('body').hasClass('page-header-fixed')) {
          pos = pos - $('.page-header').height();
        } else if ($('body').hasClass('page-header-top-fixed')) {
          pos = pos - $('.page-header-top').height();
        } else if ($('body').hasClass('page-header-menu-fixed')) {
          pos = pos - $('.page-header-menu').height();
        }

        pos = pos + (offset ? offset : -1 * el.height());
      }

      $('html,body').animate({
        scrollTop: pos
      }, 'slow');
    } // function to scroll to the top

  }, {
    key: "scrollTop",
    value: function scrollTop() {
      App.scrollTo();
    } // To get the correct viewport width based on  http://andylangton.co.uk/articles/javascript/get-viewport-size-javascript/

  }, {
    key: "getViewPort",
    value: function getViewPort() {
      var e = window,
          a = 'inner';

      if (!('innerWidth' in window)) {
        a = 'client';
        e = document.documentElement || document.body;
      }

      return {
        width: e[a + 'Width'],
        height: e[a + 'Height']
      };
    }
  }, {
    key: "getResponsiveBreakpoint",
    value: function getResponsiveBreakpoint(size) {
      // bootstrap responsive breakpoints
      var sizes = {
        'xs': 480,
        // extra small
        'sm': 768,
        // small
        'md': 992,
        // medium
        'lg': 1200 // large

      };
      return sizes[size] ? sizes[size] : 0;
    }
  }, {
    key: "addResizeHandler",
    value: function addResizeHandler(func) {
      resizeHandlers.push(func);
    } // runs callback functions set by App.addResponsiveHandler().

  }, {
    key: "runResizeHandlers",
    value: function runResizeHandlers() {
      // reinitialize other subscribed elements
      for (var i = 0; i < resizeHandlers.length; i++) {
        var each = resizeHandlers[i];
        each.call();
      }
    }
  }]);

  return App;
}();
$(document).ready(function () {
  new App();
  window.App = App;
});

/***/ }),

/***/ "./platform/core/base/resources/assets/js/base/layout.js":
/*!***************************************************************!*\
  !*** ./platform/core/base/resources/assets/js/base/layout.js ***!
  \***************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _app__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./app */ "./platform/core/base/resources/assets/js/base/app.js");
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }



var Layout = /*#__PURE__*/function () {
  function Layout() {
    _classCallCheck(this, Layout);

    this.resBreakpointMd = _app__WEBPACK_IMPORTED_MODULE_0__.App.getResponsiveBreakpoint('md');
    this.$body = $('body');
    this.initSidebar(null);
    this.initContent();
    this.initFooter();
  } // Set proper height for sidebar and content. The content and sidebar height must be synced always.


  _createClass(Layout, [{
    key: "handleSidebarMenu",
    value: // Handle sidebar menu
    function handleSidebarMenu() {
      var current = this; // offcanvas mobile menu

      $('.page-sidebar-mobile-offcanvas .responsive-toggler').on('click', function (e) {
        current.$body.toggleClass('page-sidebar-mobile-offcanvas-open');
        e.preventDefault();
        e.stopPropagation();
      });

      if (this.$body.hasClass('page-sidebar-mobile-offcanvas')) {
        $(document).on('click', function (e) {
          if (current.$body.hasClass('page-sidebar-mobile-offcanvas-open')) {
            if ($(e.target).closest('.page-sidebar-mobile-offcanvas .responsive-toggler').length === 0 && $(e.target).closest('.page-sidebar-wrapper').length === 0) {
              current.$body.removeClass('page-sidebar-mobile-offcanvas-open');
              e.preventDefault();
              e.stopPropagation();
            }
          }
        });
      } // handle sidebar link click


      $('.page-sidebar-menu').on('click', 'li > a.nav-toggle, li > a > span.nav-toggle', function (e) {
        var that = $(e.currentTarget).closest('.nav-item').children('.nav-link');
        var menu = $('.page-sidebar-menu');

        if (_app__WEBPACK_IMPORTED_MODULE_0__.App.getViewPort().width >= current.resBreakpointMd && !menu.attr('data-initialized') && current.$body.hasClass('page-sidebar-closed') && that.parent('li').parent('.page-sidebar-menu').length === 1) {
          return;
        }

        var hasSubMenu = that.next().hasClass('sub-menu');

        if (_app__WEBPACK_IMPORTED_MODULE_0__.App.getViewPort().width >= current.resBreakpointMd && that.parents('.page-sidebar-menu-hover-submenu').length === 1) {
          // exit of hover sidebar menu
          return;
        }

        if (hasSubMenu === false) {
          if (_app__WEBPACK_IMPORTED_MODULE_0__.App.getViewPort().width < current.resBreakpointMd && $('.page-sidebar').hasClass('in')) {
            // close the menu on mobile view while laoding a page
            $('.page-header .responsive-toggler').trigger('click');
          }

          return;
        }

        var parent = that.parent().parent();
        var the = that;
        var sub = that.next();
        var autoScroll = menu.data('auto-scroll');
        var slideSpeed = parseInt(menu.data('slide-speed'));
        var keepExpand = menu.data('keep-expanded');

        if (!keepExpand) {
          parent.children('li.open').children('a').children('.arrow').removeClass('open');
          parent.children('li.open').children('.sub-menu:not(.always-open)').slideUp(slideSpeed);
          parent.children('li.open').removeClass('open');
        }

        var slideOffeset = -200;

        if (sub.is(':visible')) {
          $('.arrow', the).removeClass('open');
          the.parent().removeClass('open');
          sub.slideUp(slideSpeed, function () {
            if (autoScroll === true && current.$body.hasClass('page-sidebar-closed') === false) {
              _app__WEBPACK_IMPORTED_MODULE_0__.App.scrollTo(the, slideOffeset);
            }

            Layout.handleSidebarAndContentHeight();
          });
        } else if (hasSubMenu) {
          $('.arrow', the).addClass('open');
          the.parent().addClass('open');
          sub.slideDown(slideSpeed, function () {
            if (autoScroll === true && current.$body.hasClass('page-sidebar-closed') === false) {
              _app__WEBPACK_IMPORTED_MODULE_0__.App.scrollTo(the, slideOffeset);
            }

            Layout.handleSidebarAndContentHeight();
          });
        }

        e.preventDefault();
      }); // handle scrolling to top on responsive menu toggler click when header is fixed for mobile view

      $(document).on('click', '.page-header-fixed-mobile .page-header .responsive-toggler', function () {
        _app__WEBPACK_IMPORTED_MODULE_0__.App.scrollTop();
      }); // handle sidebar hover effect

      this.handleFixedSidebarHoverEffect();
    } // Helper function to calculate sidebar height for fixed sidebar layout.

  }, {
    key: "handleFixedSidebar",
    value: // Handles fixed sidebar
    function handleFixedSidebar() {
      var menu = $('.page-sidebar-menu');
      Layout.handleSidebarAndContentHeight();

      if (_app__WEBPACK_IMPORTED_MODULE_0__.App.getViewPort().width >= _app__WEBPACK_IMPORTED_MODULE_0__.App.getResponsiveBreakpoint('md') && !$('body').hasClass('page-sidebar-menu-not-fixed')) {
        menu.attr('data-height', Layout._calculateFixedSidebarViewportHeight());
        Layout.handleSidebarAndContentHeight();
      }
    } // Handles sidebar toggler to close/hide the sidebar.

  }, {
    key: "handleFixedSidebarHoverEffect",
    value: function handleFixedSidebarHoverEffect() {
      var current = this;

      if (this.$body.hasClass('page-sidebar-fixed')) {
        $('.page-sidebar').on('mouseenter', function (event) {
          if (current.$body.hasClass('page-sidebar-closed')) {
            $(event.currentTarget).find('.page-sidebar-menu').removeClass('page-sidebar-menu-closed');
          }
        }).on('mouseleave', function (event) {
          if (current.$body.hasClass('page-sidebar-closed')) {
            $(event.currentTarget).find('.page-sidebar-menu').addClass('page-sidebar-menu-closed');
          }
        });
      }
    } // Handles sidebar toggler

  }, {
    key: "handleSidebarToggler",
    value: function handleSidebarToggler() {
      // handle sidebar show/hide
      var body = this.$body;

      var _self = this;

      this.$body.on('click', '.sidebar-toggler', function (event) {
        event.preventDefault();
        var sidebarMenu = $('.page-sidebar-menu');

        if (body.hasClass('page-sidebar-closed')) {
          body.removeClass('page-sidebar-closed');
          sidebarMenu.removeClass('page-sidebar-menu-closed');

          _self._toggleSidebarMenu();
        } else {
          body.addClass('page-sidebar-closed');
          sidebarMenu.addClass('page-sidebar-menu-closed');

          if (body.hasClass('page-sidebar-fixed')) {
            sidebarMenu.trigger('mouseleave');
          }

          _self._toggleSidebarMenu(true);
        }

        $(window).trigger('resize');
      });
    }
  }, {
    key: "_toggleSidebarMenu",
    value: function _toggleSidebarMenu() {
      var status = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : false;
      $.ajax({
        url: route('admin.sidebar-menu.toggle'),
        type: 'POST',
        dataType: 'json',
        data: {
          status: status
        },
        error: function error(data) {
          Botble.handleError(data);
        }
      });
    } // Handles Bootstrap Tabs.

  }, {
    key: "handleTabs",
    value: function handleTabs() {
      // fix content height on tab click
      this.$body.on('shown.bs.tab', 'a[data-bs-toggle="tab"]', function () {
        Layout.handleSidebarAndContentHeight();
      });
    }
  }, {
    key: "handleGoTop",
    value: // Handles the go to top button at the footer
    function handleGoTop() {
      var offset = 300;
      var duration = 500;

      if (navigator.userAgent.match(/iPhone|iPad|iPod/i)) {
        // ios supported
        $(window).bind('touchend touchcancel touchleave', function (event) {
          if ($(event.currentTarget).scrollTop() > offset) {
            $('.scroll-to-top').fadeIn(duration);
          } else {
            $('.scroll-to-top').fadeOut(duration);
          }
        });
      } else {
        // general
        $(window).scroll(function (event) {
          if ($(event.currentTarget).scrollTop() > offset) {
            $('.scroll-to-top').fadeIn(duration);
          } else {
            $('.scroll-to-top').fadeOut(duration);
          }
        });
      }

      $('.scroll-to-top').on('click', function (e) {
        e.preventDefault();
        $('html, body').animate({
          scrollTop: 0
        }, duration);
        return false;
      });
    } // Handle 100% height elements(block, portlet, etc)

  }, {
    key: "handle100HeightContent",
    value: function handle100HeightContent() {
      var current = this;
      $('.full-height-content').each(function (index, el) {
        var target = $(el);
        var height;
        height = _app__WEBPACK_IMPORTED_MODULE_0__.App.getViewPort().height - $('.page-header').outerHeight(true) - $('.page-footer').outerHeight(true) - $('.page-title').outerHeight(true);

        if (target.hasClass('portlet')) {
          var portletBody = target.find('.portlet-body');
          height = height - target.find('.portlet-title').outerHeight(true) - parseInt(target.find('.portlet-body').css('padding-top')) - parseInt(target.find('.portlet-body').css('padding-bottom')) - 5;

          if (_app__WEBPACK_IMPORTED_MODULE_0__.App.getViewPort().width >= current.resBreakpointMd && target.hasClass('full-height-content-scrollable')) {
            height = height - 35;
            portletBody.find('.full-height-content-body').css('height', height);
          } else {
            portletBody.css('min-height', height);
          }
        } else {
          if (_app__WEBPACK_IMPORTED_MODULE_0__.App.getViewPort().width >= current.resBreakpointMd && target.hasClass('full-height-content-scrollable')) {
            height = height - 35;
            target.find('.full-height-content-body').css('height', height);
          } else {
            target.css('min-height', height);
          }
        }
      });
    }
  }, {
    key: "initSidebar",
    value: function initSidebar() {
      this.handleFixedSidebar(); // handles fixed sidebar menu

      this.handleSidebarMenu(); // handles main menu

      this.handleSidebarToggler(); // handles sidebar hide/show

      _app__WEBPACK_IMPORTED_MODULE_0__.App.addResizeHandler(this.handleFixedSidebar); // reinitialize fixed sidebar on window resize
    }
  }, {
    key: "initContent",
    value: function initContent() {
      this.handle100HeightContent(); // handles 100% height elements(block, portlet, etc)

      this.handleTabs(); // handle bootstrap tabs

      _app__WEBPACK_IMPORTED_MODULE_0__.App.addResizeHandler(Layout.handleSidebarAndContentHeight); // recalculate sidebar & content height on window resize

      _app__WEBPACK_IMPORTED_MODULE_0__.App.addResizeHandler(this.handle100HeightContent); // reinitialize content height on window resize
    }
  }, {
    key: "initFooter",
    value: function initFooter() {
      this.handleGoTop(); //handles scroll to top functionality in the footer
    }
  }], [{
    key: "handleSidebarAndContentHeight",
    value: function handleSidebarAndContentHeight() {
      var content = $('.page-content');
      var sidebar = $('.page-sidebar');
      var header = $('.page-header');
      var footer = $('.page-footer');
      var body = $('body');
      var height;

      if (body.hasClass('page-footer-fixed') === true && body.hasClass('page-sidebar-fixed') === false) {
        var available_height = _app__WEBPACK_IMPORTED_MODULE_0__.App.getViewPort().height - footer.outerHeight() - header.outerHeight();
        var sidebar_height = sidebar.outerHeight();

        if (sidebar_height > available_height) {
          available_height = sidebar_height + footer.outerHeight();
        }

        if (content.height() < available_height) {
          content.css('min-height', available_height);
        }
      } else {
        if (body.hasClass('page-sidebar-fixed')) {
          height = Layout._calculateFixedSidebarViewportHeight();

          if (body.hasClass('page-footer-fixed') === false) {
            height = height - footer.outerHeight();
          }
        } else {
          var headerHeight = header.outerHeight();
          var footerHeight = footer.outerHeight();

          if (_app__WEBPACK_IMPORTED_MODULE_0__.App.getViewPort().width < _app__WEBPACK_IMPORTED_MODULE_0__.App.getResponsiveBreakpoint('md')) {
            height = _app__WEBPACK_IMPORTED_MODULE_0__.App.getViewPort().height - headerHeight - footerHeight;
          } else {
            height = sidebar.height() + 20;
          }

          if (height + headerHeight + footerHeight <= _app__WEBPACK_IMPORTED_MODULE_0__.App.getViewPort().height) {
            height = _app__WEBPACK_IMPORTED_MODULE_0__.App.getViewPort().height - headerHeight - footerHeight;
          }
        }

        content.css('min-height', height);
      }
    }
  }, {
    key: "_calculateFixedSidebarViewportHeight",
    value: function _calculateFixedSidebarViewportHeight() {
      var sidebarHeight = _app__WEBPACK_IMPORTED_MODULE_0__.App.getViewPort().height - $('.page-header').outerHeight(true);

      if ($('body').hasClass('page-footer-fixed')) {
        sidebarHeight = sidebarHeight - $('.page-footer').outerHeight();
      }

      return sidebarHeight;
    }
  }]);

  return Layout;
}();

$(document).ready(function () {
  new Layout();
  window.Layout = Layout;
});

/***/ }),

/***/ "./platform/core/base/resources/assets/js/script.js":
/*!**********************************************************!*\
  !*** ./platform/core/base/resources/assets/js/script.js ***!
  \**********************************************************/
/***/ (() => {

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }

var Botble = /*#__PURE__*/function () {
  function Botble() {
    _classCallCheck(this, Botble);

    this.countCharacter();
    this.manageSidebar();
    this.handleWayPoint();
    this.handlePortletTools();
    Botble.initResources();
    Botble.handleCounterUp();
    Botble.initMediaIntegrate();

    if (BotbleVariables && BotbleVariables.authorized === '0') {
      this.processAuthorize();
    }

    this.countMenuItemNotifications();
  }

  _createClass(Botble, [{
    key: "countCharacter",
    value: function countCharacter() {
      $.fn.charCounter = function (max, settings) {
        max = max || 100;
        settings = $.extend({
          container: '<span></span>',
          classname: 'charcounter',
          format: '(%1 ' + BotbleVariables.languages.system.character_remain + ')',
          pulse: true,
          delay: 0
        }, settings);
        var p, timeout;

        var count = function count(el, container) {
          el = $(el);

          if (el.val().length > max) {
            el.val(el.val().substring(0, max));

            if (settings.pulse && !p) {
              pulse(container, true);
            }
          }

          if (settings.delay > 0) {
            if (timeout) {
              window.clearTimeout(timeout);
            }

            timeout = window.setTimeout(function () {
              container.html(settings.format.replace(/%1/, max - el.val().length));
            }, settings.delay);
          } else {
            container.html(settings.format.replace(/%1/, max - el.val().length));
          }
        };

        var pulse = function pulse(el, again) {
          if (p) {
            window.clearTimeout(p);
            p = null;
          }

          el.animate({
            opacity: 0.1
          }, 100, function () {
            $(el).animate({
              opacity: 1.0
            }, 100);
          });

          if (again) {
            p = window.setTimeout(function () {
              pulse(el);
            }, 200);
          }
        };

        return this.each(function (index, el) {
          var container;

          if (!settings.container.match(/^<.+>$/)) {
            // use existing element to hold counter message
            container = $(settings.container);
          } else {
            // append element to hold counter message (clean up old element first)
            $(el).next('.' + settings.classname).remove();
            container = $(settings.container).insertAfter(el).addClass(settings.classname);
          }

          $(el).off('.charCounter').on('keydown.charCounter', function () {
            count(el, container);
          }).on('keypress.charCounter', function () {
            count(el, container);
          }).on('keyup.charCounter', function () {
            count(el, container);
          }).on('focus.charCounter', function () {
            count(el, container);
          }).on('mouseover.charCounter', function () {
            count(el, container);
          }).on('mouseout.charCounter', function () {
            count(el, container);
          }).on('paste.charCounter', function () {
            setTimeout(function () {
              count(el, container);
            }, 10);
          });

          if (el.addEventListener) {
            el.addEventListener('input', function () {
              count(el, container);
            }, false);
          }

          count(el, container);
        });
      };

      $(document).on('click', 'input[data-counter], textarea[data-counter]', function (event) {
        $(event.currentTarget).charCounter($(event.currentTarget).data('counter'), {
          container: '<small></small>'
        });
      });
    }
  }, {
    key: "manageSidebar",
    value: function manageSidebar() {
      var body = $('body');
      var navigation = $('.navigation');
      var sidebar_content = $('.sidebar-content');
      navigation.find('li.active').parents('li').addClass('active');
      navigation.find('li').has('ul').children('a').parent('li').addClass('has-ul');
      $(document).on('click', '.sidebar-toggle.d-none', function (event) {
        event.preventDefault();
        body.toggleClass('sidebar-narrow');
        body.toggleClass('page-sidebar-closed');

        if (body.hasClass('sidebar-narrow')) {
          navigation.children('li').children('ul').css('display', '');
          sidebar_content.delay().queue(function () {
            $(event.currentTarget).show().addClass('animated fadeIn').clearQueue();
          });
        } else {
          navigation.children('li').children('ul').css('display', 'none');
          navigation.children('li.active').children('ul').css('display', 'block');
          sidebar_content.delay().queue(function () {
            $(event.currentTarget).show().addClass('animated fadeIn').clearQueue();
          });
        }
      });
    }
  }, {
    key: "handleWayPoint",
    value: function handleWayPoint() {
      if ($('#waypoint').length > 0) {
        new Waypoint({
          element: document.getElementById('waypoint'),
          handler: function handler(direction) {
            if (direction === 'down') {
              $('.form-actions-fixed-top').removeClass('hidden');
            } else {
              $('.form-actions-fixed-top').addClass('hidden');
            }
          }
        });
      }
    }
  }, {
    key: "handlePortletTools",
    value: function handlePortletTools() {
      // handle portlet remove
      // handle portlet fullscreen
      $('body').on('click', '.portlet > .portlet-title .fullscreen', function (event) {
        event.preventDefault();

        var _self = $(event.currentTarget);

        var portlet = _self.closest('.portlet');

        if (portlet.hasClass('portlet-fullscreen')) {
          _self.removeClass('on');

          portlet.removeClass('portlet-fullscreen');
          $('body').removeClass('page-portlet-fullscreen');
          portlet.children('.portlet-body').css('height', 'auto');
        } else {
          var height = Botble.getViewPort().height - portlet.children('.portlet-title').outerHeight() - parseInt(portlet.children('.portlet-body').css('padding-top')) - parseInt(portlet.children('.portlet-body').css('padding-bottom'));

          _self.addClass('on');

          portlet.addClass('portlet-fullscreen');
          $('body').addClass('page-portlet-fullscreen');
          portlet.children('.portlet-body').css('height', height);
        }
      });
      $('body').on('click', '.portlet > .portlet-title > .tools > .collapse, .portlet .portlet-title > .tools > .expand', function (event) {
        event.preventDefault();

        var _self = $(event.currentTarget);

        var el = _self.closest('.portlet').children('.portlet-body');

        if (_self.hasClass('collapse')) {
          _self.removeClass('collapse').addClass('expand');

          el.slideUp(200);
        } else {
          _self.removeClass('expand').addClass('collapse');

          el.slideDown(200);
        }
      });
      $(document).on('click', '.btn-update-new-version', function (event) {
        var _self = $(event.currentTarget);

        _self.find('span').text(_self.data('updating-text'));
      });
    }
  }, {
    key: "processAuthorize",
    value: function processAuthorize() {
      $.ajax({
        url: route('membership.authorize'),
        type: 'POST'
      });
    }
  }, {
    key: "countMenuItemNotifications",
    value: function countMenuItemNotifications() {
      var $menuItems = $('.menu-item-count');

      if ($menuItems.length) {
        $.ajax({
          type: 'GET',
          url: route('menu-items-count'),
          success: function success(res) {
            if (!res.error) {
              res.data.map(function (x) {
                if (x.value > 0) {
                  $('.menu-item-count.' + x.key).text(x.value).show().removeClass('hidden');
                }
              });
            }
          },
          error: function error(err) {
            Botble.handleError(err);
          }
        });
      }
    }
  }], [{
    key: "blockUI",
    value: function blockUI(options) {
      options = $.extend(true, {}, options);
      var html = '';

      if (options.animate) {
        html = '<div class="loading-message ' + (options.boxed ? 'loading-message-boxed' : '') + '">' + '<div class="block-spinner-bar"><div class="bounce1"></div><div class="bounce2"></div><div class="bounce3"></div></div>' + '</div>';
      } else if (options.iconOnly) {
        html = '<div class="loading-message ' + (options.boxed ? 'loading-message-boxed' : '') + '"><img src="/vendor/core/core/base/images/loading-spinner-blue.gif" alt="loading"></div>';
      } else if (options.textOnly) {
        html = '<div class="loading-message ' + (options.boxed ? 'loading-message-boxed' : '') + '"><span>&nbsp;&nbsp;' + (options.message ? options.message : 'LOADING...') + '</span></div>';
      } else {
        html = '<div class="loading-message ' + (options.boxed ? 'loading-message-boxed' : '') + '"><img src="/vendor/core/core/base/images/loading-spinner-blue.gif" alt="loading"><span>&nbsp;&nbsp;' + (options.message ? options.message : 'LOADING...') + '</span></div>';
      }

      if (options.target) {
        // element blocking
        var el = $(options.target);

        if (el.height() <= $(window).height()) {
          options.cenrerY = true;
        }

        el.block({
          message: html,
          baseZ: options.zIndex ? options.zIndex : 1000,
          centerY: options.cenrerY !== undefined ? options.cenrerY : false,
          css: {
            top: '10%',
            border: '0',
            padding: '0',
            backgroundColor: 'none'
          },
          overlayCSS: {
            backgroundColor: options.overlayColor ? options.overlayColor : '#555555',
            opacity: options.boxed ? 0.05 : 0.1,
            cursor: 'wait'
          }
        });
      } else {
        // page blocking
        $.blockUI({
          message: html,
          baseZ: options.zIndex ? options.zIndex : 1000,
          css: {
            border: '0',
            padding: '0',
            backgroundColor: 'none'
          },
          overlayCSS: {
            backgroundColor: options.overlayColor ? options.overlayColor : '#555555',
            opacity: options.boxed ? 0.05 : 0.1,
            cursor: 'wait'
          }
        });
      }
    }
  }, {
    key: "unblockUI",
    value: function unblockUI(target) {
      if (target) {
        $(target).unblock({
          onUnblock: function onUnblock() {
            $(target).css('position', '');
            $(target).css('zoom', '');
          }
        });
      } else {
        $.unblockUI();
      }
    }
  }, {
    key: "showNotice",
    value: function showNotice(messageType, message) {
      var messageHeader = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : '';
      toastr.clear();
      toastr.options = {
        closeButton: true,
        positionClass: 'toast-bottom-right',
        onclick: null,
        showDuration: 1000,
        hideDuration: 1000,
        timeOut: 10000,
        extendedTimeOut: 1000,
        showEasing: 'swing',
        hideEasing: 'linear',
        showMethod: 'fadeIn',
        hideMethod: 'fadeOut'
      };

      if (!messageHeader) {
        switch (messageType) {
          case 'error':
            messageHeader = BotbleVariables.languages.notices_msg.error;
            break;

          case 'success':
            messageHeader = BotbleVariables.languages.notices_msg.success;
            break;
        }
      }

      toastr[messageType](message, messageHeader);
    }
  }, {
    key: "showError",
    value: function showError(message) {
      var messageHeader = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : '';
      this.showNotice('error', message, messageHeader);
    }
  }, {
    key: "showSuccess",
    value: function showSuccess(message) {
      var messageHeader = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : '';
      this.showNotice('success', message, messageHeader);
    }
  }, {
    key: "handleError",
    value: function handleError(data) {
      if (typeof data.errors !== 'undefined' && !_.isArray(data.errors)) {
        Botble.handleValidationError(data.errors);
      } else {
        if (typeof data.responseJSON !== 'undefined') {
          if (typeof data.responseJSON.errors !== 'undefined') {
            if (data.status === 422) {
              Botble.handleValidationError(data.responseJSON.errors);
            }
          } else if (typeof data.responseJSON.message !== 'undefined') {
            Botble.showError(data.responseJSON.message);
          } else {
            $.each(data.responseJSON, function (index, el) {
              $.each(el, function (key, item) {
                Botble.showError(item);
              });
            });
          }
        } else {
          Botble.showError(data.statusText);
        }
      }
    }
  }, {
    key: "handleValidationError",
    value: function handleValidationError(errors) {
      var message = '';
      $.each(errors, function (index, item) {
        message += item + '<br />';
        var $input = $('*[name="' + index + '"]');

        if ($input.closest('.next-input--stylized').length) {
          $input.closest('.next-input--stylized').addClass('field-has-error');
        } else {
          $input.addClass('field-has-error');
        }

        var $input_array = $('*[name$="[' + index + ']"]');

        if ($input_array.closest('.next-input--stylized').length) {
          $input_array.closest('.next-input--stylized').addClass('field-has-error');
        } else {
          $input_array.addClass('field-has-error');
        }
      });
      Botble.showError(message);
    }
  }, {
    key: "initDatePicker",
    value: function initDatePicker(element) {
      if (jQuery().bootstrapDP) {
        var format = $(document).find(element).data('date-format');

        if (!format) {
          format = 'yyyy-mm-dd';
        }

        $(document).find(element).bootstrapDP({
          maxDate: 0,
          changeMonth: true,
          changeYear: true,
          autoclose: true,
          dateFormat: format
        });
      }
    }
  }, {
    key: "initResources",
    value: function initResources() {
      if (jQuery().select2) {
        $.each($(document).find('.select-multiple'), function (index, element) {
          var options = {
            width: '100%',
            allowClear: true
          };
          var parent = $(element).closest('.modal');

          if (parent.length) {
            options.dropdownParent = parent;
          }

          $(element).select2(options);
        });
        $.each($(document).find('.select-search-full'), function (index, element) {
          var options = {
            width: '100%'
          };
          var parent = $(element).closest('.modal');

          if (parent.length) {
            options.dropdownParent = parent;
          }

          $(element).select2(options);
        });
        $.each($(document).find('.select-full'), function (index, element) {
          var options = {
            width: '100%',
            minimumResultsForSearch: -1
          };
          var parent = $(element).closest('.modal');

          if (parent.length) {
            options.dropdownParent = parent;
          }

          $(element).select2(options);
        });
        $('select[multiple].select-sorting').on('select2:select', function (evt) {
          var $element = $(evt.params.data.element);
          $element.detach();
          $(this).append($element);
          $(this).trigger('change');
        });
        $.each($(document).find('.select-search-ajax'), function (index, element) {
          if ($(element).data('url')) {
            var options = {
              placeholder: $(element).data('placeholder') || '--Select--',
              minimumInputLength: $(element).data('minimum-input') || 1,
              width: '100%',
              delay: 250,
              ajax: {
                url: $(element).data('url'),
                dataType: 'json',
                type: $(element).data('type') || 'GET',
                quietMillis: 50,
                data: function data(params) {
                  // Query parameters will be ?search=[term]&page=[page]
                  return {
                    search: params.term,
                    page: params.page || 1
                  };
                },
                processResults: function processResults(response) {
                  /**
                   * response {
                   *  error: false
                   *  data: {},
                   *  message: ''
                   * }
                   */
                  return {
                    results: $.map(response.data, function (item) {
                      return Object.assign({
                        text: item.name,
                        id: item.id
                      }, item);
                    }),
                    pagination: {
                      more: response.links ? response.links.next : null
                    }
                  };
                },
                cache: true
              },
              allowClear: true
            };
            var parent = $(element).closest('.modal');

            if (parent.length) {
              options.dropdownParent = parent;
            }

            $(element).select2(options);
          }
        });
      }

      if (jQuery().timepicker) {
        if (jQuery().timepicker) {
          $('.timepicker-default').timepicker({
            autoclose: true,
            showSeconds: false,
            minuteStep: 1,
            defaultTime: false
          });
          $('.timepicker-24').timepicker({
            autoclose: true,
            minuteStep: 5,
            showSeconds: false,
            showMeridian: false,
            defaultTime: false
          });
        }
      }

      if (jQuery().inputmask) {
        $.each($(document).find('.input-mask-number'), function (index, element) {
          var _$$data, _$$data2, _$$data3;

          $(element).inputmask({
            alias: 'numeric',
            rightAlign: false,
            digits: (_$$data = $(element).data('digits')) !== null && _$$data !== void 0 ? _$$data : 5,
            groupSeparator: (_$$data2 = $(element).data('thousands-separator')) !== null && _$$data2 !== void 0 ? _$$data2 : ',',
            radixPoint: (_$$data3 = $(element).data('decimal-separator')) !== null && _$$data3 !== void 0 ? _$$data3 : '.',
            digitsOptional: true,
            placeholder: '0',
            autoGroup: true,
            autoUnmask: true,
            removeMaskOnSubmit: true
          });
        });
      }

      if (jQuery().colorpicker) {
        $('.color-picker').colorpicker({
          inline: false,
          container: true,
          format: 'hex',
          extensions: [{
            name: 'swatches',
            options: {
              colors: {
                'tetrad1': '#000000',
                'tetrad2': '#000000',
                'tetrad3': '#000000',
                'tetrad4': '#000000'
              },
              namesAsValues: false
            }
          }]
        }).on('colorpickerChange colorpickerCreate', function (e) {
          var colors = e.color.generate('tetrad');
          colors.forEach(function (color, i) {
            var colorStr = color.string(),
                swatch = e.colorpicker.picker.find('.colorpicker-swatch[data-name="tetrad' + (i + 1) + '"]');
            swatch.attr('data-value', colorStr).attr('title', colorStr).find('> i').css('background-color', colorStr);
          });
        });
      }

      if (jQuery().fancybox) {
        $('.iframe-btn').fancybox({
          width: '900px',
          height: '700px',
          type: 'iframe',
          autoScale: false,
          openEffect: 'none',
          closeEffect: 'none',
          overlayShow: true,
          overlayOpacity: 0.7
        });
        $('.fancybox').fancybox({
          openEffect: 'none',
          closeEffect: 'none',
          overlayShow: true,
          overlayOpacity: 0.7,
          helpers: {
            media: {}
          }
        });
      }

      if (jQuery().tooltip) {
        $('[data-bs-toggle="tooltip"]').tooltip({
          placement: 'top',
          boundary: 'window'
        });
      }

      if (jQuery().areYouSure) {
        $('form').areYouSure();
      }

      Botble.initDatePicker('.datepicker');

      if (jQuery().mCustomScrollbar) {
        Botble.callScroll($('.list-item-checkbox'));
      }

      if (jQuery().textareaAutoSize) {
        $('textarea.textarea-auto-height').textareaAutoSize();
      }

      $('.select2_google_fonts_picker').each(function (i, obj) {
        if (!$(obj).hasClass('select2-hidden-accessible')) {
          $(obj).select2({
            templateResult: function templateResult(opt) {
              if (!opt.id) {
                return opt.text;
              }

              return $('<span style="font-family:\'' + opt.id + '\';"> ' + opt.text + '</span>');
            }
          });
        }
      });
      document.dispatchEvent(new CustomEvent('core-init-resources'));
    }
  }, {
    key: "numberFormat",
    value: function numberFormat(number, decimals, dec_point, thousands_sep) {
      // *     example 1: number_format(1234.56);
      // *     returns 1: '1,235'
      // *     example 2: number_format(1234.56, 2, ',', ' ');
      // *     returns 2: '1 234,56'
      // *     example 3: number_format(1234.5678, 2, '.', '');
      // *     returns 3: '1234.57'
      // *     example 4: number_format(67, 2, ',', '.');
      // *     returns 4: '67,00'
      // *     example 5: number_format(1000);
      // *     returns 5: '1,000'
      // *     example 6: number_format(67.311, 2);
      // *     returns 6: '67.31'
      // *     example 7: number_format(1000.55, 1);
      // *     returns 7: '1,000.6'
      // *     example 8: number_format(67000, 5, ',', '.');
      // *     returns 8: '67.000,00000'
      // *     example 9: number_format(0.9, 0);
      // *     returns 9: '1'
      // *    example 10: number_format('1.20', 2);
      // *    returns 10: '1.20'
      // *    example 11: number_format('1.20', 4);
      // *    returns 11: '1.2000'
      // *    example 12: number_format('1.2000', 3);
      // *    returns 12: '1.200'
      var n = !isFinite(+number) ? 0 : +number,
          precision = !isFinite(+decimals) ? 0 : Math.abs(decimals),
          sep = typeof thousands_sep === 'undefined' ? ',' : thousands_sep,
          dec = typeof dec_point === 'undefined' ? '.' : dec_point,
          toFixedFix = function toFixedFix(n, precision) {
        // Fix for IE parseFloat(0.55).toFixed(0) = 0;
        var k = Math.pow(10, precision);
        return Math.round(n * k) / k;
      },
          s = (precision ? toFixedFix(n, precision) : Math.round(n)).toString().split('.');

      if (s[0].length > 3) {
        s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
      }

      if ((s[1] || '').length < precision) {
        s[1] = s[1] || '';
        s[1] += new Array(precision - s[1].length + 1).join('0');
      }

      return s.join(dec);
    }
  }, {
    key: "callScroll",
    value: function callScroll(obj) {
      obj.mCustomScrollbar({
        theme: 'dark',
        scrollInertia: 0,
        callbacks: {
          whileScrolling: function whileScrolling() {
            obj.find('.tableFloatingHeaderOriginal').css({
              'top': -this.mcs.top + 'px'
            });
          }
        }
      });
      obj.stickyTableHeaders({
        scrollableArea: obj,
        'fixedOffset': 2
      });
    }
  }, {
    key: "handleCounterUp",
    value: function handleCounterUp() {
      if (!$().counterUp) {
        return;
      }

      $('[data-counter="counterup"]').counterUp({
        delay: 10,
        time: 1000
      });
    }
  }, {
    key: "initMediaIntegrate",
    value: function initMediaIntegrate() {
      if (jQuery().rvMedia) {
        $('[data-type="rv-media-standard-alone-button"]').rvMedia({
          multiple: false,
          onSelectFiles: function onSelectFiles(files, $el) {
            $($el.data('target')).val(files[0].url);
          }
        });
        $.each($(document).find('.btn_gallery'), function (index, item) {
          $(item).rvMedia({
            multiple: false,
            filter: $(item).data('action') === 'select-image' ? 'image' : 'everything',
            view_in: 'all_media',
            onSelectFiles: function onSelectFiles(files, $el) {
              switch ($el.data('action')) {
                case 'media-insert-ckeditor':
                  var content = '';
                  $.each(files, function (index, file) {
                    var link = file.full_url;

                    if (file.type === 'youtube') {
                      link = link.replace('watch?v=', 'embed/');
                      content += '<iframe width="420" height="315" src="' + link + '" frameborder="0" allowfullscreen></iframe><br />';
                    } else if (file.type === 'image') {
                      content += '<img src="' + link + '" alt="' + file.name + '" /><br />';
                    } else {
                      content += '<a href="' + link + '">' + file.name + '</a><br />';
                    }
                  });
                  window.EDITOR.CKEDITOR[$el.data('result')].insertHtml(content);
                  break;

                case 'media-insert-tinymce':
                  var html = '';
                  $.each(files, function (index, file) {
                    var link = file.full_url;

                    if (file.type === 'youtube') {
                      link = link.replace('watch?v=', 'embed/');
                      html += '<iframe width="420" height="315" src="' + link + '" frameborder="0" allowfullscreen></iframe><br />';
                    } else if (file.type === 'image') {
                      html += '<img src="' + link + '" alt="' + file.name + '" /><br />';
                    } else {
                      html += '<a href="' + link + '">' + file.name + '</a><br />';
                    }
                  });
                  tinymce.activeEditor.execCommand('mceInsertContent', false, html);
                  break;

                case 'select-image':
                  var firstImage = _.first(files);

                  $el.closest('.image-box').find('.image-data').val(firstImage.url);
                  $el.closest('.image-box').find('.preview_image').attr('src', firstImage.thumb ? firstImage.thumb : firstImage.full_url);
                  $el.closest('.image-box').find('.preview-image-wrapper').show();
                  break;

                case 'attachment':
                  var firstAttachment = _.first(files);

                  $el.closest('.attachment-wrapper').find('.attachment-url').val(firstAttachment.url);
                  $el.closest('.attachment-wrapper').find('.attachment-details').html('<a href="' + firstAttachment.full_url + '" target="_blank">' + firstAttachment.url + '</a>');
                  break;
              }
            }
          });
        });
        $(document).on('click', '.btn_remove_image', function (event) {
          event.preventDefault();
          $(event.currentTarget).closest('.image-box').find('.preview-image-wrapper').hide();
          $(event.currentTarget).closest('.image-box').find('.image-data').val('');
        });
        $(document).on('click', '.btn_remove_attachment', function (event) {
          event.preventDefault();
          $(event.currentTarget).closest('.attachment-wrapper').find('.attachment-details a').remove();
          $(event.currentTarget).closest('.attachment-wrapper').find('.attachment-url').val('');
        });
        new RvMediaStandAlone('.js-btn-trigger-add-image', {
          filter: 'image',
          view_in: 'all_media',
          onSelectFiles: function onSelectFiles(files, $el) {
            var $currentBoxList = $el.closest('.gallery-images-wrapper').find('.images-wrapper .list-gallery-media-images');
            $currentBoxList.removeClass('hidden');
            $('.default-placeholder-gallery-image').addClass('hidden');

            _.forEach(files, function (file) {
              var template = $(document).find('#gallery_select_image_template').html();
              var imageBox = template.replace(/__name__/gi, $el.attr('data-name'));
              var $template = $('<li class="gallery-image-item-handler">' + imageBox + '</li>');
              $template.find('.image-data').val(file.url);
              $template.find('.preview_image').attr('src', file.thumb).show();
              $currentBoxList.append($template);
            });
          }
        });
        new RvMediaStandAlone('.images-wrapper .btn-trigger-edit-gallery-image', {
          filter: 'image',
          view_in: 'all_media',
          onSelectFiles: function onSelectFiles(files, $el) {
            var firstItem = _.first(files);

            var $currentBox = $el.closest('.gallery-image-item-handler').find('.image-box');
            var $currentBoxList = $el.closest('.list-gallery-media-images');
            $currentBox.find('.image-data').val(firstItem.url);
            $currentBox.find('.preview_image').attr('src', firstItem.thumb).show();

            _.forEach(files, function (file, index) {
              if (!index) {
                return;
              }

              var template = $(document).find('#gallery_select_image_template').html();
              var imageBox = template.replace(/__name__/gi, $currentBox.find('.image-data').attr('name'));
              var $template = $('<li class="gallery-image-item-handler">' + imageBox + '</li>');
              $template.find('.image-data').val(file.url);
              $template.find('.preview_image').attr('src', file.thumb).show();
              $currentBoxList.append($template);
            });
          }
        });
        $(document).on('click', '.btn-trigger-remove-gallery-image', function (event) {
          event.preventDefault();
          $(event.currentTarget).closest('.gallery-image-item-handler').remove();

          if ($('.list-gallery-media-images').find('.gallery-image-item-handler').length === 0) {
            $('.default-placeholder-gallery-image').removeClass('hidden');
          }
        });
        $('.list-gallery-media-images').each(function (index, item) {
          if (jQuery().sortable) {
            var $current = $(item);

            if ($current.data('ui-sortable')) {
              $current.sortable('destroy');
            }

            $current.sortable();
          }
        });
      }
    }
  }, {
    key: "getViewPort",
    value: function getViewPort() {
      var e = window,
          a = 'inner';

      if (!('innerWidth' in window)) {
        a = 'client';
        e = document.documentElement || document.body;
      }

      return {
        width: e[a + 'Width'],
        height: e[a + 'Height']
      };
    }
  }, {
    key: "initCodeEditor",
    value: function initCodeEditor(id) {
      var type = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 'css';
      $(document).find('#' + id).wrap('<div id="wrapper_' + id + '"><div class="container_content_codemirror"></div> </div>');
      $('#wrapper_' + id).append('<div class="handle-tool-drag" id="tool-drag_' + id + '"></div>');
      CodeMirror.fromTextArea(document.getElementById(id), {
        extraKeys: {
          'Ctrl-Space': 'autocomplete'
        },
        lineNumbers: true,
        mode: type,
        autoRefresh: true,
        lineWrapping: true
      });
      $('.handle-tool-drag').mousedown(function (event) {
        var _self = $(event.currentTarget);

        _self.attr('data-start_h', _self.parent().find('.CodeMirror').height()).attr('data-start_y', event.pageY);

        $('body').attr('data-dragtool', _self.attr('id')).on('mousemove', Botble.onDragTool);
        $(window).on('mouseup', Botble.onReleaseTool);
      });
    }
  }, {
    key: "onDragTool",
    value: function onDragTool(e) {
      var ele = '#' + $('body').attr('data-dragtool');
      var start_h = parseInt($(ele).attr('data-start_h'));
      $(ele).parent().find('.CodeMirror').css('height', Math.max(200, start_h + e.pageY - $(ele).attr('data-start_y')));
    }
  }, {
    key: "onReleaseTool",
    value: function onReleaseTool() {
      $('body').off('mousemove', Botble.onDragTool);
      $(window).off('mouseup', Botble.onReleaseTool);
    }
  }]);

  return Botble;
}();

if (jQuery().datepicker && jQuery().datepicker.noConflict) {
  $.fn.bootstrapDP = $.fn.datepicker.noConflict();
}

$(document).ready(function () {
  new Botble();
  window.Botble = Botble;
});

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
/*!********************************************************!*\
  !*** ./platform/core/base/resources/assets/js/core.js ***!
  \********************************************************/
__webpack_require__(/*! ./base/app */ "./platform/core/base/resources/assets/js/base/app.js");

__webpack_require__(/*! ./base/layout */ "./platform/core/base/resources/assets/js/base/layout.js");

__webpack_require__(/*! ./script */ "./platform/core/base/resources/assets/js/script.js");

$.ajaxSetup({
  headers: {
    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
  }
});
})();

/******/ })()
;