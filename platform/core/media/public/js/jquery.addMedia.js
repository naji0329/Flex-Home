/******/ (() => { // webpackBootstrap
var __webpack_exports__ = {};
/*!********************************************************************!*\
  !*** ./platform/core/media/resources/assets/js/jquery.addMedia.js ***!
  \********************************************************************/
function _typeof(obj) { "@babel/helpers - typeof"; return _typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (obj) { return typeof obj; } : function (obj) { return obj && "function" == typeof Symbol && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }, _typeof(obj); }

/* ========================================================================
 * AddMedia.js v1.0
 * Requires Botble Media
 * ======================================================================== */
+function ($) {
  'use strict';
  /**
   * @param element
   * @param options
   * @constructor
   */

  var AddMedia = function AddMedia(element, options) {
    this.options = options;
    $(element).rvMedia({
      multiple: true,
      onSelectFiles: function onSelectFiles(files, $el) {
        if (typeof files !== 'undefined') {
          switch ($el.data('editor')) {
            case 'summernote':
              handleInsertImagesForSummerNote($el, files);
              break;

            case 'wysihtml5':
              var editor = $(options.target).data('wysihtml5').editor;
              handleInsertImagesForWysihtml5Editor(editor, files);
              break;

            case 'ckeditor':
              handleForCkeditor($el, files);
              break;

            case 'tinymce':
              handleForTinyMce(files);
              break;
          }
        }
      }
    });
  };

  AddMedia.VERSION = '1.1.0';
  /**
   * Insert images to summernote editor
   * @param $el
   * @param files
   */

  function handleInsertImagesForSummerNote($el, files) {
    if (files.length === 0) {
      return;
    }

    var instance = $el.data('target');

    for (var i = 0; i < files.length; i++) {
      if (files[i].type === 'image') {
        $(instance).summernote('insertImage', files[i].full_url, files[i].basename);
      } else {
        $(instance).summernote('pasteHTML', '<a href="' + files[i].full_url + '">' + files[i].full_url + '</a>');
      }
    }
  }
  /**
   * Insert images to Wysihtml5 editor
   * @param editor
   * @param files
   */


  function handleInsertImagesForWysihtml5Editor(editor, files) {
    if (files.length === 0) {
      return;
    } // insert images for the wysihtml5 editor


    var s = '';

    for (var i = 0; i < files.length; i++) {
      if (files[i].type === 'image') {
        s += '<img src="' + files[i].full_url + '" alt="' + files[i].name + '">';
      } else {
        s += '<a href="' + files[i].full_url + '">' + files[i].full_url + '</a>';
      }
    }

    if (editor.getValue().length > 0) {
      var length = editor.getValue();
      editor.composer.commands.exec('insertHTML', s);

      if (editor.getValue() === length) {
        editor.setValue(editor.getValue() + s);
      }
    } else {
      editor.setValue(editor.getValue() + s);
    }
  }
  /**
   * @param $el
   * @param files
   */


  function handleForCkeditor($el, files) {
    var instance = $el.data('target').replace('#', '');
    var content = '';
    $.each(files, function (index, file) {
      var link = file.full_url;

      if (file.type === 'image') {
        content += '<img src="' + link + '" alt="' + file.name + '" /><br />';
      } else {
        content += '<a href="' + link + '">' + file.name + '</a><br />';
      }
    });
    CKEDITOR.instances[instance].insertHtml(content);
  }
  /**
   * @param files
   */


  function handleForTinyMce(files) {
    var html = '';
    $.each(files, function (index, file) {
      var link = file.full_url;

      if (file.type === 'image') {
        html += '<img src="' + link + '" alt="' + file.name + '" /><br />';
      } else {
        html += '<a href="' + link + '">' + file.name + '</a><br />';
      }
    });
    tinymce.activeEditor.execCommand('mceInsertContent', false, html);
  }
  /**
   * @param option
   */


  function callAction(option) {
    return this.each(function () {
      var $this = $(this);
      var data = $this.data('bs.media');
      var options = $.extend({}, $this.data(), _typeof(option) === 'object' && option);

      if (!data) {
        $this.data('bs.media', new AddMedia(this, options));
      }
    });
  }

  $.fn.addMedia = callAction;
  $.fn.addMedia.Constructor = AddMedia;
  $(window).on('load', function () {
    $('[data-type="rv-media"]').each(function () {
      var $addMedia = $(this);
      callAction.call($addMedia, $addMedia.data());
    });
  });
}(jQuery);
/******/ })()
;