/******/ (() => { // webpackBootstrap
var __webpack_exports__ = {};
/*!*****************************************************************!*\
  !*** ./platform/core/base/resources/assets/js/tree-category.js ***!
  \*****************************************************************/
function _typeof(obj) { "@babel/helpers - typeof"; return _typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (obj) { return typeof obj; } : function (obj) { return obj && "function" == typeof Symbol && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }, _typeof(obj); }

!function ($) {
  $.fn.filetree = function (i) {
    var options = {
      animationSpeed: 'slow',
      console: false
    };

    function init(i) {
      i = $.extend(options, i);
      return this.each(function () {
        $(this).find('li').on('click', '.file-opener-i', function (e) {
          return e.preventDefault(), $(this).hasClass('fa-plus-square') ? ($(this).addClass('fa-minus-square'), $(this).removeClass('fa-plus-square')) : ($(this).addClass('fa-plus-square'), $(this).removeClass('fa-minus-square')), $(this).parent().toggleClass('closed').toggleClass('open'), !1;
        });
      });
    }

    if ('object' == _typeof(i) || !i) {
      return init.apply(this, arguments);
    }
  };
}(jQuery);

(function ($) {
  $.fn.dragScroll = function (options) {
    function init() {
      var $el = $(this);
      var settings = $.extend({
        scrollVertical: false,
        scrollHorizontal: true,
        cursor: null
      }, options);
      var clicked = false,
          clickY,
          clickX;

      var getCursor = function getCursor() {
        if (settings.cursor) return settings.cursor;
        if (settings.scrollVertical && settings.scrollHorizontal) return 'move';
        if (settings.scrollVertical) return 'row-resize';
        if (settings.scrollHorizontal) return 'col-resize';
      };

      var updateScrollPos = function updateScrollPos(e, el) {
        var $el = $(el);
        settings.scrollVertical && $el.scrollTop($el.scrollTop() + (clickY - e.pageY));
        settings.scrollHorizontal && $el.scrollLeft($el.scrollLeft() + (clickX - e.pageX));
      };

      $el.on({
        mousemove: function mousemove(e) {
          clicked && updateScrollPos(e, this);
        },
        mousedown: function mousedown(e) {
          $el.css('cursor', getCursor());
          clicked = true;
          clickY = e.pageY;
          clickX = e.pageX;
        },
        mouseup: function mouseup() {
          clicked = false;
          $el.css('cursor', 'auto');
        },
        mouseleave: function mouseleave() {
          clicked = false;
          $el.css('cursor', 'auto');
        }
      });
    }

    if ('object' == _typeof(options) || !options) {
      return init.apply(this, arguments);
    }
  };
})(jQuery);

$(function () {
  $treeWrapper = $('.file-tree-wrapper');
  $treeWrapper.dragScroll();
  var $formLoading = $('.tree-form-container').find('.tree-loading');
  var $treeLoading = $('.tree-categories-container').find('.tree-loading');

  function loadTree(activeId) {
    $treeLoading.removeClass('d-none');
    $treeWrapper.filetree().removeClass('d-none').hide().slideDown('slow');
    $treeLoading.addClass('d-none');

    if (activeId) {
      $('.file-tree-wrapper').find('li[data-id="' + activeId + '"] .category-name:first').addClass('active');
    }
  }

  loadTree();

  function reloadForm(data) {
    $('.tree-form-body').html(data);
    Botble.initResources();
    Botble.handleCounterUp();
    Botble.initMediaIntegrate();

    if (window.EditorManagement) {
      new EditorManagement().init();
    }
  }

  $(document).on('click', '.tree-categories-container .toggle-tree', function (e) {
    var $this = $(e.currentTarget);

    if ($this.hasClass('open-tree')) {
      $this.text($this.data('collapse'));
      $('.tree-categories-container').find('.folder-root.closed').removeClass('closed').addClass('open');
    } else {
      $this.text($this.data('expand'));
      $('.tree-categories-container').find('.folder-root.open').removeClass('open').addClass('closed');
    }

    $this.toggleClass('open-tree');
  });

  function clearRefSetupDefault() {
    var data = $.ajaxSetup().data;

    if (data) {
      delete data.ref_from;
      delete data.ref_lang;
    }
  }

  function fetchData(url, $el) {
    clearRefSetupDefault();
    $.ajax({
      url: url,
      type: 'GET',
      beforeSend: function beforeSend() {
        $formLoading.removeClass('d-none');
        $('.file-tree-wrapper').find('a.active').removeClass('active');

        if ($el) {
          $el.addClass('active');
        }
      },
      success: function success(data) {
        if (data.error) {
          Botble.showError(data.message);
        } else {
          reloadForm(data.data);
        }
      },
      error: function error(data) {
        Botble.handleError(data);
      },
      complete: function complete() {
        $formLoading.addClass('d-none');
      }
    });
  }

  $(document).on('click', '.file-tree-wrapper .fetch-data', function (event) {
    event.preventDefault();
    var $this = $(event.currentTarget);

    if ($this.attr('href')) {
      fetchData($this.attr('href'), $this);
    } else {
      $('.file-tree-wrapper').find('a.active').removeClass('active');
      $this.addClass('active');
    }
  });
  $(document).on('click', '.tree-categories-create', function (event) {
    event.preventDefault();
    var $this = $(event.currentTarget);
    loadCreateForm($this.attr('href'));
  });
  var searchParams = new URLSearchParams(window.location.search);

  function loadCreateForm(url) {
    var data = {};

    if (searchParams.get('ref_lang')) {
      data.ref_lang = searchParams.get('ref_lang');
    }

    $.ajax({
      url: url,
      type: 'GET',
      data: data,
      beforeSend: function beforeSend() {
        $formLoading.removeClass('d-none');
      },
      success: function success(data) {
        if (data.error) {
          Botble.showError(data.message);
        } else {
          reloadForm(data.data);
        }
      },
      error: function error(data) {
        Botble.handleError(data);
      },
      complete: function complete() {
        $formLoading.addClass('d-none');
      }
    });
  }

  function reloadTree(activeId, callback) {
    var $tree = $('.file-tree-wrapper');
    $.ajax({
      url: $tree.data('url'),
      type: 'GET',
      success: function success(data) {
        if (data.error) {
          Botble.showError(data.message);
        } else {
          $tree.html(data.data);
          loadTree(activeId);

          if (jQuery().tooltip) {
            $('[data-bs-toggle="tooltip"]').tooltip({
              placement: 'top',
              boundary: 'window'
            });
          }

          if (callback) {
            callback();
          }
        }
      },
      error: function error(data) {
        Botble.handleError(data);
      }
    });
  }

  $(document).on('click', '#list-others-language a', function (event) {
    event.preventDefault();
    fetchData($(event.currentTarget).prop('href'));
  });
  $(document).on('submit', '.tree-form-container form', function (event) {
    var _event$originalEvent;

    event.preventDefault();
    var $form = $(event.currentTarget);
    var formData = $form.serializeArray();
    var submitter = (_event$originalEvent = event.originalEvent) === null || _event$originalEvent === void 0 ? void 0 : _event$originalEvent.submitter;
    var saveAndEdit = false;

    if (submitter && submitter.name) {
      saveAndEdit = submitter.value === 'apply';
      formData.push({
        name: submitter.name,
        value: submitter.value
      });
    }

    $.ajax({
      url: $form.attr('action'),
      type: $form.attr('method') || 'POST',
      data: formData,
      beforeSend: function beforeSend() {
        $formLoading.removeClass('d-none');
      },
      success: function success(data) {
        if (data.error) {
          Botble.showError(data.message);
        } else {
          Botble.showSuccess(data.message);
          $formLoading.addClass('d-none');
          var activeId = saveAndEdit && data.data.model ? data.data.model.id : null;
          reloadTree(activeId, function () {
            if (activeId) {
              var fetchDataButton = $('.folder-root[data-id="' + activeId + '"] a.fetch-data');

              if (fetchDataButton.length) {
                fetchDataButton.trigger('click');
              } else {
                location.reload();
              }
            } else if ($('.tree-categories-create').length) {
              $('.tree-categories-create').trigger('click');
            } else {
              var _data$data;

              reloadForm((_data$data = data.data) === null || _data$data === void 0 ? void 0 : _data$data.form);
              $formLoading.addClass('d-none');
            }
          });
        }
      },
      error: function error(data) {
        Botble.handleError(data);
        $formLoading.addClass('d-none');
      }
    });
  });
  $(document).on('click', '.deleteDialog', function (event) {
    event.preventDefault();

    var _self = $(event.currentTarget);

    $('.delete-crud-entry').data('section', _self.data('section'));
    $('.modal-confirm-delete').modal('show');
  });
  $('.delete-crud-entry').on('click', function (event) {
    event.preventDefault();

    var _self = $(event.currentTarget);

    _self.addClass('button-loading');

    var deleteURL = _self.data('section');

    $.ajax({
      url: deleteURL,
      type: 'DELETE',
      success: function success(data) {
        if (data.error) {
          Botble.showError(data.message);
        } else {
          Botble.showSuccess(data.message);
          reloadTree();

          if ($('.tree-categories-create').length) {
            $('.tree-categories-create').trigger('click');
          } else {
            reloadForm('');
          }
        }

        _self.closest('.modal').modal('hide');

        _self.removeClass('button-loading');
      },
      error: function error(data) {
        Botble.handleError(data);

        _self.removeClass('button-loading');
      }
    });
  });
});
/******/ })()
;