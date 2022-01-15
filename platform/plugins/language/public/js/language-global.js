/******/ (() => { // webpackBootstrap
var __webpack_exports__ = {};
/*!**************************************************************************!*\
  !*** ./platform/plugins/language/resources/assets/js/language-global.js ***!
  \**************************************************************************/
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }

var LanguageGlobalManagement = /*#__PURE__*/function () {
  function LanguageGlobalManagement() {
    _classCallCheck(this, LanguageGlobalManagement);
  }

  _createClass(LanguageGlobalManagement, [{
    key: "init",
    value: function init() {
      var languageChoiceSelect = $('#post_lang_choice');
      languageChoiceSelect.data('prev', languageChoiceSelect.val());
      $(document).on('change', '#post_lang_choice', function (event) {
        $('.change_to_language_text').text($(event.currentTarget).find('option:selected').text());
        $('#confirm-change-language-modal').modal('show');
      });
      $(document).on('click', '#confirm-change-language-modal .btn-warning.float-start', function (event) {
        event.preventDefault();
        languageChoiceSelect = $('#post_lang_choice');
        languageChoiceSelect.val(languageChoiceSelect.data('prev')).trigger('change');
        $('#confirm-change-language-modal').modal('hide');
      });
      $(document).on('click', '#confirm-change-language-button', function (event) {
        event.preventDefault();

        var _self = $(event.currentTarget);

        var flagPath = $('#language_flag_path').val();

        _self.addClass('button-loading');

        languageChoiceSelect = $('#post_lang_choice');
        $.ajax({
          url: $('div[data-change-language-route]').data('change-language-route'),
          data: {
            lang_meta_current_language: languageChoiceSelect.val(),
            reference_id: $('#reference_id').val(),
            reference_type: $('#reference_type').val(),
            lang_meta_created_from: $('#lang_meta_created_from').val()
          },
          type: 'POST',
          success: function success(data) {
            $('.active-language').html('<img src="' + flagPath + languageChoiceSelect.find('option:selected').data('flag') + '.svg" width="16" title="' + languageChoiceSelect.find('option:selected').text() + '" alt="' + languageChoiceSelect.find('option:selected').text() + '" />');

            if (!data.error) {
              $('.current_language_text').text(languageChoiceSelect.find('option:selected').text());
              var html = '';
              $.each(data.data, function (index, el) {
                html += '<img src="' + flagPath + el.lang_flag + '.svg" width="16" title="' + el.lang_name + '" alt="' + el.lang_name + '">';

                if (el.reference_id) {
                  html += '<a href="' + $('#route_edit').val() + '"> ' + el.lang_name + ' <i class="fa fa-edit"></i> </a><br />';
                } else {
                  html += '<a href="' + $('#route_create').val() + '?ref_from=' + $('#content_id').val() + '&ref_lang=' + index + '"> ' + el.lang_name + ' <i class="fa fa-plus"></i> </a><br />';
                }
              });
              $('#list-others-language').html(html);
              $('#confirm-change-language-modal').modal('hide');
              languageChoiceSelect.data('prev', languageChoiceSelect.val()).trigger('change');
            }

            _self.removeClass('button-loading');
          },
          error: function error(data) {
            Botble.showError(data.message);

            _self.removeClass('button-loading');
          }
        });
      });
      $(document).on('click', '.change-data-language-item', function (event) {
        event.preventDefault();
        window.location.href = $(event.currentTarget).find('span[data-href]').data('href');
      });
    }
  }]);

  return LanguageGlobalManagement;
}();

;
$(document).ready(function () {
  new LanguageGlobalManagement().init();
  $.ajaxSetup({
    data: {
      'ref_from': $('meta[name="ref_from"]').attr('content'),
      'ref_lang': $('meta[name="ref_lang"]').attr('content')
    }
  });
});
/******/ })()
;