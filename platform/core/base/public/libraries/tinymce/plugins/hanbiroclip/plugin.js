/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 1);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports) {


    function parseShorthandMargins( style ) {
        var marginCase = style.margin ? 'margin' : style.MARGIN ? 'MARGIN' : false,
            key, margin;
        if ( marginCase ) {
            margin = tools.style.parse.margin( style[ marginCase ] );
            for ( key in margin ) {
                style[ 'margin-' + key ] = margin[ key ];
            }
            delete style[ marginCase ];
        }
    }
    
    var tools = {
        convertHexStringToBytes: function( hexString ) {
            var bytesArray = [],
                bytesArrayLength = hexString.length / 2,
                i;
    
            for ( i = 0; i < bytesArrayLength; i++ ) {
                bytesArray.push( parseInt( hexString.substr( i * 2, 2 ), 16 ) );
            }
            return bytesArray;
        },
        convertBytesToBase64: function( bytesArray ) {
            var base64characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/',
                base64string = '',
                bytesArrayLength = bytesArray.length,
                i;
    
            for ( i = 0; i < bytesArrayLength; i += 3 ) {
                var array3 = bytesArray.slice( i, i + 3 ),
                    array3length = array3.length,
                    array4 = [],
                    j;
    
                if ( array3length < 3 ) {
                    for ( j = array3length; j < 3; j++ ) {
                        array3[ j ] = 0;
                    }
                }
    
                // 0xFC -> 11111100 || 0x03 -> 00000011 || 0x0F -> 00001111 || 0xC0 -> 11000000 || 0x3F -> 00111111
                array4[ 0 ] = ( array3[ 0 ] & 0xFC ) >> 2;
                array4[ 1 ] = ( ( array3[ 0 ] & 0x03 ) << 4 ) | ( array3[ 1 ] >> 4 );
                array4[ 2 ] = ( ( array3[ 1 ] & 0x0F ) << 2 ) | ( ( array3[ 2 ] & 0xC0 ) >> 6 );
                array4[ 3 ] = array3[ 2 ] & 0x3F;
    
                for ( j = 0; j < 4; j++ ) {
                    // Example: if array3length == 1, then we need to add 2 equal signs at the end of base64.
                    // array3[ 0 ] is used to calculate array4[ 0 ] and array4[ 1 ], so there will be regular values,
                    // next two ones have to be replaced with `=`, because array3[ 1 ] and array3[ 2 ] wasn't present in the input string.
                    if ( j <= array3length ) {
                        base64string += base64characters.charAt( array4[ j ] );
                    } else {
                        base64string += '=';
                    }
                }
    
            }
            return base64string;
        },
        b64toBlobURL: function(base64){
            var splited, bloburl;
            splited = base64.split(';base64,');
            bloburl = tools.b64toBlob(splited[1], splited[0].replace('data:', ''));
    
            return URL.createObjectURL(bloburl);
        },
        b64toBlob: function(b64Data) {
            var contentType = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : '';
            var sliceSize = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : 512;
            var byteCharacters = atob(b64Data);
            var byteArrays = [];
    
            for (var offset = 0; offset < byteCharacters.length; offset += sliceSize) {
                var slice = byteCharacters.slice(offset, offset + sliceSize);
                var byteNumbers = new Array(slice.length);
    
                for (var i = 0; i < slice.length; i++) {
                byteNumbers[i] = slice.charCodeAt(i);
                }
    
                var byteArray = new Uint8Array(byteNumbers);
                byteArrays.push(byteArray);
            }
    
            var blob = new Blob(byteArrays, {
                type: contentType
            });
            return blob;
        },
        objectKeys: function( obj ) {
            var keys = [];
            for ( var i in obj )
                keys.push( i );
    
            return keys;
        },
        writeCssText: function( styles, sort ) {
            var name,
                stylesArr = [];
    
            for ( name in styles )
                stylesArr.push( name + ':' + styles[ name ] );
    
            if ( sort )
                stylesArr.sort();
    
            return stylesArr.join( '; ' );
        },
        indexOf: function( array, value ) {
            if ( typeof value == 'function' ) {
                for ( var i = 0, len = array.length; i < len; i++ ) {
                    if ( value( array[ i ] ) )
                        return i;
                }
            } else if ( array.indexOf )
                return array.indexOf( value );
            else {
                for ( i = 0, len = array.length; i < len; i++ ) {
                    if ( array[ i ] === value )
                        return i;
                }
            }
            return -1;
        },
        convertToPx: ( function() {
            var calculator;
    
            return function( cssLength, ed ) {
                if ( !calculator ) {
                    calculator = $( '<div style="position:absolute;left:-9999px;' +
                        'top:-9999px;margin:0px;padding:0px;border:0px;"' +
                        '></div>').appendTo(ed.getBody());
                }
    
                if ( !( /%$/ ).test( cssLength ) ) {
                    var isNegative = parseFloat( cssLength ) < 0,
                        ret;
    
                    if ( isNegative ) {
                        cssLength = cssLength.replace( '-', '' );
                    }
    
                    calculator.css( 'width', cssLength );
                    ret = calculator.clientWidth;
    
                    if ( isNegative ) {
                        return -ret;
                    }
                    return ret;
                }
    
                return cssLength;
            };
        } )(),
        normalizeHex: function( styleText ) {
            return styleText.replace( /#(([0-9a-f]{3}){1,2})($|;|\s+)/gi, function( match, hexColor, hexColorPart, separator ) {
                var normalizedHexColor = hexColor.toLowerCase();
                if ( normalizedHexColor.length == 3 ) {
                    var parts = normalizedHexColor.split( '' );
                    normalizedHexColor = [ parts[ 0 ], parts[ 0 ], parts[ 1 ], parts[ 1 ], parts[ 2 ], parts[ 2 ] ].join( '' );
                }
                return '#' + normalizedHexColor + separator;
            } );
        },
        convertRgbToHex: function( styleText ) {
            return styleText.replace( /(?:rgb\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\))/gi, function( match, red, green, blue ) {
                var color = [ red, green, blue ];
                // Add padding zeros if the hex value is less than 0x10.
                for ( var i = 0; i < 3; i++ )
                    color[ i ] = ( '0' + parseInt( color[ i ], 10 ).toString( 16 ) ).slice( -2 );
                return '#' + color.join( '' );
            } );
        },
        parseCssText: function( styleText, normalize ) {
            var retval = {};
    
    
            // Normalize colors.
            if ( styleText ) {
                styleText = tools.normalizeHex( tools.convertRgbToHex( styleText ) );
            }
            
            if ( !styleText || styleText == ';' )
                return retval;
    
            styleText.replace( /&quot;/g, '"' ).replace( /\s*([^:;\s]+)\s*:\s*([^;]+)\s*(?=;|$)/g, function( match, name, value ) {
                if ( normalize ) {
                    name = name.toLowerCase();
                    // Drop extra whitespacing from font-family.
                    if ( name == 'font-family' )
                        value = value.replace( /\s*,\s*/g, ',' );
                    value = $.trim( value );
                }
    
                retval[ name ] = value;
            } );
            return retval;
        },
        normalizedStyles: function( attribs, tagName, ed ) {
    
            // Some styles and style values are redundant, so delete them.
            var resetStyles = [
                    'background-color:transparent',
                    'border-image:none',
                    'color:windowtext',
                    'direction:ltr',
                    'mso-',
                    'visibility:visible',
                    'div:border:none' // This one stays because https://dev.ckeditor.com/ticket/6241
                ],
                textStyles = [
                    'font-family',
                    'font',
                    'font-size',
                    'color',
                    'background-color',
                    'line-height',
                    'text-decoration'
                ],
                matchStyle = function() {
                    var keys = [];
                    for ( var i = 0; i < arguments.length; i++ ) {
                        if ( arguments[ i ] ) {
                            keys.push( arguments[ i ] );
                        }
                    }
    
                    return tools.indexOf( resetStyles, keys.join( ':' ) ) !== -1;
                },
                removeFontStyles = false;
    
            var styles = tools.parseCssText( attribs.style );
    
            // li
    
            var keys = tools.objectKeys( styles );
    
            for ( var i = 0; i < keys.length; i++ ) {
                var styleName = keys[ i ].toLowerCase(),
                    styleValue = styles[ keys[ i ] ],
                    indexOf = tools.indexOf,
                    toBeRemoved = removeFontStyles && indexOf( textStyles, styleName.toLowerCase() ) !== -1;
    
                if ( toBeRemoved || matchStyle( null, styleName, styleValue ) ||
                    matchStyle( null, styleName.replace( /\-.*$/, '-' ) ) ||
                    matchStyle( null, styleName ) ||
                    matchStyle( tagName, styleName, styleValue ) ||
                    matchStyle( tagName, styleName.replace( /\-.*$/, '-' ) ) ||
                    matchStyle( tagName, styleName ) ||
                    matchStyle( styleValue )
                ) {
                    delete styles[ keys[ i ] ];
                }
            }
    
            var keepZeroMargins = false;
            // Still some elements might have shorthand margins or longhand with zero values.
            // parseShorthandMargins( styles );
            // normalizeMargins();
    
            return tools.writeCssText( styles );
    
            function normalizeMargins() {
                var keys = [ 'top', 'right', 'bottom', 'left' ];
                forEach( keys, function( key ) {
                    key = 'margin-' + key;
                    if ( !( key in styles ) ) {
                        return;
                    }
    
                    var value = tools.convertToPx( styles[ key ], ed );
                    // We need to get rid of margins, unless they are allowed in config (#2935).
                    if ( value || keepZeroMargins ) {
                        styles[ key ] = value ? value + 'px' : 0;
                    } else {
                        delete styles[ key ];
                    }
                } );
            }
        },
        getStyles: function(html) {
            var iframe;
            var get = function(d) {
                var css = {};
    
                for (var i = 0; i < d.styleSheets.length; ++i) {
                    var sheet = d.styleSheets[i];
                    for (var j = 0; j < sheet.cssRules.length; ++j) {
                        var rule = sheet.cssRules[j];
    
                        var cssText = rule.cssText.slice(rule.cssText.indexOf('{')+1);
                        var attrs = cssText.split(';');
    
                        var ruleSet = {};
                        for (var k = 0; k < attrs.length; ++k) {
                            var keyValue = attrs[k].split(':');
                            if (keyValue.length == 2) {
                                var key = keyValue[0].trim();
                                var value = keyValue[1].trim();
                                ruleSet[key] = value;
                            }
                        }
    
                        for (var testRule in ruleSet) { // We are going to add the rule iff it is not an empty object
                            css[rule.selectorText] = ruleSet;
                            break;
                        }
                    }
                }
    
                return css;
            }
    
            // handle
            iframe = document.createElement('iframe');
            iframe.style.display = 'none';
            document.body.appendChild(iframe);
    
            html = html.replace(/src=(["']).*?\1/gi, '');
            
            iframe.contentWindow.document.open('text/htmlreplace');
            iframe.contentWindow.document.write(html);
            iframe.contentWindow.document.close();
    
    
            return get(iframe.contentWindow.document);
        },
    
        word_filter: function(content) {
            var editor = $('<div />').append(content);
            // Word comments like conditional comments etc
            content = content.replace(/<!--[\s\S]+?-->/gi, '');
    
            // Remove comments, scripts (e.g., msoShowComment), XML tag, VML content,
            // MS Office namespaced tags, and a few other tags
            content = content.replace(/<(!|script[^>]*>.*?<\/script(?=[>\s])|\/?(\?xml(:\w+)?|img|meta|link|style|\w:\w+)(?=[\s\/>]))[^>]*>/gi, '');
    
            // Convert <s> into <strike> for line-though
            content = content.replace(/<(\/?)s>/gi, "<$1strike>");
    
            // Replace nbsp entites to char since it's easier to handle
            //content = content.replace(/&nbsp;/gi, "\u00a0");
            content = content.replace(/&nbsp;/gi, ' ');
    
            // Convert <span style="mso-spacerun:yes">___</span> to string of alternating
            // breaking/non-breaking spaces of same length
            content = content.replace(/<span\s+style\s*=\s*"\s*mso-spacerun\s*:\s*yes\s*;?\s*"\s*>([\s\u00a0]*)<\/span>/gi, function(str, spaces) {
                return (spaces.length > 0) ? spaces.replace(/./, " ").slice(Math.floor(spaces.length/2)).split("").join("\u00a0") : '';
            });
    
            // Parse out list indent level for lists
            $('p', editor).each(function(){
                var str = $(this).attr('style');
                var matches = /mso-list:\w+ \w+([0-9]+)/.exec(str);
                if (matches) {
                    $(this).data('_listLevel',  parseInt(matches[1], 10));
                }
            });
    
            // Parse Lists
            var last_level=0;
            var pnt = null, ulStyle = 'style="margin-bottom: 0cm; margin-top: 0px;"';
            $('p', editor).each(function(){
                var cur_level = $(this).data('_listLevel'), className = '', style = '';
                if(cur_level != undefined){
                    var txt = $(this).text();
                    var list_tag = '<ul '+ulStyle+'></ul>';
                    if (/^\s*\w+\./.test(txt)) {
                        var matches = /([0-9])\./.exec(txt);
                        if (matches) {
                            var start = parseInt(matches[1], 10);
                            list_tag = start>1 ? '<ol '+ulStyle+' start="' + start + '"></ol>' : '<ol></ol>';
                        }else{
                            list_tag = '<ol '+ulStyle+'></ol>';
                        }
                    }
    
                    if(cur_level>last_level){
                        if(last_level==0){
                            $(this).before(list_tag);
                            pnt = $(this).prev();
                        }else{
                            pnt = $(list_tag).appendTo(pnt);
                        }
                    }
                    if(cur_level<last_level){
                        for(var i=0; i<last_level-cur_level; i++){
                            pnt = pnt.parent();
                        }
                    }
                    $('span:first', this).remove();
                    if(this.className) {
                        className = ['class="', this.className, '"'].join('');
                    }
                    if($(this).attr('style')) {
                        style = ['style="', $(this).attr('style'), '"'].join('');
                    }
                    
                    pnt.append('<li '+style+' '+className+'>' + $(this).html() + '</li>')
                    $(this).remove();
                    last_level = cur_level;
                }else{
                    last_level = 0;
                }
    
                
            });
    
            return editor.html();
        },
    
        clone: function(thing, opts) {
            var newObject = {};
            if (thing instanceof Array) {
                return thing.map(function (i) { return this.clone(i, opts); });
            } else if (thing instanceof Date) {
                return new Date(thing);
            } else if (thing instanceof RegExp) {
                return new RegExp(thing);
            } else if (thing instanceof Function) {
                return opts && opts.newFns ?
                        new Function('return ' + thing.toString())() :
                        thing;
            } else if (thing instanceof Object) {
                Object.keys(thing).forEach(_.bind(function (key) {
                    newObject[key] = this.clone(thing[key], opts);
                }, this));
                return newObject;
            } else if ([ undefined, null ].indexOf(thing) > -1) {
                return thing;
            } else {
                if (thing.constructor.name === 'Symbol') {
                    return Symbol(thing.toString()
                            .replace(/^Symbol\(/, '')
                            .slice(0, -1));
                }
                // return _.clone(thing);  // If you must use _ ;)
                return thing.__proto__.constructor(thing);
            }
        },
    
        getStyleByClassName: function(styles, className, tagName, css) {
            var classes = Object.keys(styles), i, cl, css = css || false;
    
            var preventDuplicate = function(s, _css) {
                var lastestKeys = Object.keys(_css).toString();
                Object.keys(s).map(function(csskey) {
                    if(lastestKeys.indexOf(csskey) !== -1) {
                        delete(s[csskey]);
                    }
                });
    
                return s;
            }
    
            for(i = 0; i < classes.length; i++) {
                cl = classes[i];
                if((className && cl.match(className)) || tagName == cl) {
                    css = !css ? styles[cl] : ( tagName == cl ? 
                        _.extend(css, preventDuplicate(styles[cl], css)) : 
                        _.extend(preventDuplicate(css, styles[cl]), styles[cl]) );
                }
            }
    
            return css;
        },
    
        cleanSpecialAtrributes: function(html) {
            return html.replace(/xmlns="[^"]*"/gi, '');
        },
    
        style: {
            parse: {
                
                margin: function( value ) {
                    var ret = {};
    
                    var widths = value.match( /(?:\-?[\.\d]+(?:%|\w*)|auto|inherit|initial|unset)/g ) || [ '0px' ];
    
                    switch ( widths.length ) {
                        case 1:
                            mapStyles( [ 0, 0, 0, 0 ] );
                            break;
                        case 2:
                            mapStyles( [ 0, 1, 0, 1 ] );
                            break;
                        case 3:
                            mapStyles( [ 0, 1, 2, 1 ] );
                            break;
                        case 4:
                            mapStyles( [ 0, 1, 2, 3 ] );
                            break;
                    }
    
                    function mapStyles( map ) {
                        ret.top = widths[ map[ 0 ] ];
                        ret.right = widths[ map[ 1 ] ];
                        ret.bottom = widths[ map[ 2 ] ];
                        ret.left = widths[ map[ 3 ] ];
                    }
    
                    return ret;
                }
            }
        },
    
        keepSelfStyles: function(styles, self) {
            var cssText = '';
            parseShorthandMargins(styles);
            if(self) {
                parseShorthandMargins(self);
                if(self['text-indent'] && self['margin-left']) {
                    delete self['text-indent'];
                    self['margin-left'] = 0;
                }
            }
            
            styles = _.extend(styles, self);
            Object.keys(styles).map(function(attr) {
                cssText += [attr, styles[attr] + ';'].join(':');
            });
    
            return cssText;
        },
    
        isImageURL: function(html) {
            var regex = /(https?:\/\/.*\.(?:png|jpg))$/i;
            return html.match(regex) !== null;
        }
    }
    
    module.exports = tools;
    
    /***/ }),
    /* 1 */
    /***/ (function(module, exports, __webpack_require__) {
    
    /**
     * plugin.js
     * 
     * Author: Harry Tr <hung.tv@hanbiro.com>
     *
     * Last Modify: 04/06/2019
     */
    ;(function($, tinymce){
    
        var tools = __webpack_require__(0);
        var getImagesToBase64 = __webpack_require__(2);
        var getFileFromClipboard = __webpack_require__(3);
    
        var HanbiroClipboard = function(ed, options) {
            _.assign(this, options);
            if(typeof sanitizeHtml == 'undefined') {
                this._getSanitizeHtml();
            }
    
            this.editor = ed;
            this.html = null;
        }
    
        HanbiroClipboard.prototype = {
            constructor: HanbiroClipboard,
    
            init: function(){
                var ed = this.editor;
                if(!isIE()) {
                    ed.on('paste', _.bind(function(e){
                        var imaged = 0, prePasteEvent, types;
                        e.preventDefault();
                        if(e.clipboardData)
                        {
                            types = e.clipboardData.types;
                            if(types instanceof DOMStringList) {
                                types = Array.from(types);
                            }
    
                            if(types.indexOf('Files') !== -1 && types.indexOf('text/html') === -1) { // is file
                                getFileFromClipboard(e).then(function(file) {
                                    ed.insertContent('<img src="'+file+'" />');
                                }, function(){
                                    ed.windowManager.alert('We\'re sorry. The file was copied doesn\'t support paste to this Editor.');
                                });
                            } else {
                                this.html = e.clipboardData.getData('text/html'), text = e.clipboardData.getData('text/plain');
                                if(this.html == '' && text != '') this.html = text.replace(/(?:\r\n|\r|\n)/g, '<br>');
    
                                if(tools.isImageURL(this.html)) {
                                    // When user copied image url
                                    ed.insertContent('<img src="'+this.html+'" />');
                                } else {
                                    // normal content
                                    getImagesToBase64(e).then(_.bind(function(files) {
                                        if($.trim(this.html) != '' && (this.html.substr(0,6) == '<table'))
                                        {
                                            ed.insertContent(this.html);
                                            prePasteEvent = true;
                                            return;
                                        }
                                        // else if(this.html == '' && text != '' && e.clipboardData.types.indexOf('Files') === -1)
                                        // {
                                        //     text = text.replace(/(?:\r\n|\r|\n)/g, '<br />');
                                        //     ed.insertContent(text);
                                        //     prePasteEvent = true;
                                        //     return;
                                        // }
                    
                                        if(this.html.match(/microsoft.com|CocoaVersion|LibreOffice|google-sheets-html/)) {
                                            this.html = tools.word_filter(this.html);
                                            css = tools.getStyles(tools.clone(this.html));
                                            this.html = sanitizeHtml(this.html, {
                                                allowedAttributes: false,
                                                allowedSchemes: [ 'http', 'https', 'ftp', 'mailto', 'blob','data' ],
                                                allowedTags: [ 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'blockquote', 'p', 'a', 'ul', 'ol', 'img',
                                                'nl', 'li', 'b', 'i', 'strong', 'em', 'strike', 'code', 'hr', 'br', 'div',
                                                'table', 'thead', 'caption', 'tbody', 'tr', 'th', 'td', 'colgroup', 'pre', 'iframe', 'span', 'font' ],
                                                transformTags: {
                                                    'img': function(tagName, attribs) {
                                                        // var num = parseInt(attribs['v:shapes'].split('_')[2]) - 1;
                                                        if(files[imaged]) {
                                                            attribs.src = files[imaged];
                                                            imaged++;
                                                        }
                                                        return {
                                                            tagName: tagName,
                                                            attribs: attribs
                                                        };
                                                    },
                                                    '*': function(tagName, attribs) {
                                                        if(attribs.style) {
                                                            attribs.style = tools.normalizedStyles(attribs, tagName, ed);
                                                        }else {
                                                            attribs.style = '';
                                                        }
                                                        var style = tools.getStyleByClassName(tools.clone(css), attribs.class, tagName, false);
                                                        
                                                        if(style) {
                                                            attribs.style = tools.keepSelfStyles(style, tools.parseCssText(attribs.style));
                                                        }
    
                                                        if(tagName == 'br') {
                                                            attribs.style += ';clear:both'
                                                        }
    
                                                        // remove table-layout
                                                        if (tagName == 'table' && attribs.style.indexOf('table-layout') !== -1) {
                                                            attribs.style = attribs.style.split(';').reduce(function(style, o) {
                                                                if (o.indexOf('table-layout') === -1) {
                                                                    style.push(o);
                                                                }
                                                                return style;
                                                            }, []).join(';')
                                                        }
    
                                                        return {
                                                            tagName: tagName,
                                                            attribs: attribs
                                                        }; 
                                                    }
                                                }
                                            });
                                        }
                                        else {
                                            this.html = tools.cleanSpecialAtrributes(this.html);
                                        }
                                        this.tableValidation();
                                        // scan and replace url to a tags
                                        this.replaceHrefToATags();
                                        this.editor.insertContent(this.html);
                                    }, this));
                                }
                            }
                        }
                    }, this));
                } else {
                    ed.on('paste', _.bind(function(){
                        setTimeout(_.bind(function(){
                            this.resetContent();
                        }, this), 300);
                    }, this));
                }
    
                ed.on('dragover drop', _.bind(function(event){
                    if (!ed.selection.getNode() || ed.selection.getNode().nodeName !== 'IMG') { // fix image moving not works
                        event.stopPropagation(); 
                        event.preventDefault();
                        if (event.type == 'drop') {
                            for(var i = 0; i < event.dataTransfer.files.length; i++) {
                                var blob = event.dataTransfer.files[i];
                                if(blob.type.indexOf('image') === -1) return;
                                var reader = new FileReader();
                                var url;
    
                                reader.onload = function(event){
                                    url = tools.b64toBlobURL(event.target.result);
                                    var img = document.createElement('img');
                                    var style = '';
                                    if (img.width > 500) {
                                        style = 'style="width:500px"';
                                    }
                                    ed.insertContent('<img '+ style +' src="'+url+'" />');
                                    img.src = url;
                                };
                                reader.readAsDataURL(blob);
                            }
                            
                        }
                    }
                }, this));
            },
    
            resetContent: function() {
                var ed = this.editor;
                var currentContent = ed.getContent({type: 'raw'});
    
                if(currentContent.match(/colgroup><span/gi)) {
                    ed.setContent(currentContent);
                }
                ed.selection.collapse(false); // For paste IMG , cursor forcus to image just paste --> Set collapse false to remove focus and allow image to upload
            },
    
            _getSanitizeHtml: function() {
                var $oclazyLoad = ngElement('#wrapper').injector().get('$ocLazyLoad');
                $oclazyLoad.load([this.url, 'js/sanitize-html.js'].join('/'));
            },
    
            replaceHrefToATags: function() {
                var rex = /(="|blob:|">|>|url\(&quot;|&quot;|url\(\')?(http|ftp|https):\/\/([\w_-]+(?:(?:\.[\w_-]+)+))([\w.,@?^=%&:\/~+#-]*[\w@?^=%&\/~+#-])?/gi;
                //Regex : Apply <a> to link text
                // Exception: url in style (Ex: url("image.hanbiro"))\ 
                // ">|> => For normal url from GGSheet  >https://hanbiro 
                // ="|blob: For IMG 
                // url\(&quot;|&quot;|url\(\') : For style inline
                this.html = this.html.replace( rex, function ( $0, $1 ) {
                    return ($1 || $0.match(/href=|blob:|">|&quot;|src=|=/)) ? $0 : '<a href="' + $0 + '">' + $0 + '</a>';
                });
            },
    
            tableValidation: function() {
                if( this.html.indexOf('</table>') == -1){
                    return this.html;
                }
                var html = new DOMParser().parseFromString(this.html, "text/html");
                var tables = html.getElementsByTagName('table');
                for(var tableIt = 0; tableIt < tables.length; tableIt++) {
                    var table = tables[tableIt];
                    // Fix : Can't adjust column width when copy from google sheet
                    if(table.style.tableLayout && table.style.tableLayout == "fixed"){
                        table.style.tableLayout = "";// remove style for table;
                    }
                    if(table.style.width && table.style.width == "0px"){
                        table.style.width = "auto";
                    }
                    // Fix : Can't adjust column width when copy from microsoft excel
                    var listTd = table.querySelectorAll("tr:first-child td");
                    if(listTd.length){
                        // For first td from microsoft excel will have attribute width and style width
                        // To adjust cell --> Remove style {width} of first td
                        if(listTd[0] && listTd[0].hasAttribute("width")){
                            for(var index = 0; index < listTd.length; index++) {
                                listTd[index].style.width = null;
                            }
                        }
                    }
                    // Case for hyper link of GGSheet
                    var listTds = table.querySelectorAll("td");
                    if(listTds.length){
                        for(var index = 0; index < listTds.length; index++) {
                            if(listTds[index].hasAttribute("width")){
                                listTds[index].removeAttribute("data-sheets-hyperlinkruns");
                            }
                        }
                    }
                }
                //Format and convert HTMLDocument to string
                this.html = this.convertObjectToString(html);
            },
            // Format HTML and convert
            convertObjectToString: function(ObjectHtmlDocument) {
                var htmlAsString = new XMLSerializer().serializeToString(ObjectHtmlDocument);
                var unuseTags = ["</body></html>",'<html xmlns="http://www.w3.org/1999/xhtml"><head></head><body>','</google-sheets-html-origin>','<google-sheets-html-origin>','/<style(.*)\>(.*)\<\/style\>/g'];
                for (var i = 0; i < unuseTags; i++) {
                    htmlAsString = htmlAsString.replace(unuseTag[i], "");
                }
                return htmlAsString;
            },
        };
    
    
        tinymce.PluginManager.add('hanbiroclip', function(tinyEditor, ui) {
            console.log('Hanbiro Clipboard was installed.', tinyEditor, ui);
            
            return new HanbiroClipboard(tinyEditor, {
                url: ui
            });
        });
    
    
    })(window.jQuery, tinymce);
    
    /***/ }),
    /* 2 */
    /***/ (function(module, exports, __webpack_require__) {
    
    var tools = __webpack_require__(0);
    var createSrcWithBase64 = function( img ) {
        var splited, blob;
        var base64 = img.type ? 'data:' + img.type + ';base64,' + tools.convertBytesToBase64( tools.convertHexStringToBytes( img.hex ) ) : null;
        if(base64) {
            splited = base64.split(';base64,');
            base64 = tools.b64toBlob(splited[1], splited[0].replace('data:', ''));
            blob = URL.createObjectURL(base64);
            return blob;
        }
        return base64;
    }
    
    var extractFromRtf = function(rtfContent, officeType) {
        var ret = [],
            rePictureHeader = officeType == 'MicrosoftOffice' ? /\{\\pict[\s\S]+?\\bliptag\-?\d+(\\blipupi\-?\d+)?(\{\\\*\\blipuid\s?[\da-fA-F]+)?[\s\}]*?/ : /{\\pict\\(.*)\d\\?(.*)/,
            rePicture = new RegExp( '(?:(' + rePictureHeader.source + '))([\\da-fA-F\\s]+)\\}', 'g' ),
            wholeImages,
            imageType;
    
        wholeImages = rtfContent.match( rePicture );
        if ( !wholeImages ) {
            return ret;
        }
    
        for ( var i = 0; i < wholeImages.length; i++ ) {
            if ( rePictureHeader.test( wholeImages[ i ] ) ) {
                if ( wholeImages[ i ].indexOf( '\\pngblip' ) !== -1 ) {
                    imageType = 'image/png';
                } else if ( wholeImages[ i ].indexOf( '\\jpegblip' ) !== -1 ) {
                    imageType = 'image/jpeg';
                } else {
                    continue;
                }
    
                ret.push( {
                    hex: imageType ? wholeImages[ i ].replace( rePictureHeader, '' ).replace( /[^\da-fA-F]/g, '' ) : null,
                    type: imageType
                } );
            }
        }
    
        return ret;
    }
    
    var getOfficeType = function(e) {
        var type = 'MicrosoftOffice';
        var html = e.clipboardData.getData('text/html');
        
        if(html) {
            if(html.indexOf('LibreOffice') !== -1) type = 'LibreOffice';
        }
    
        return type;
    }
    
    var getImagesToBase64 = function(e){
        var arr = [], count = 0;
    
        return new Promise(function(resolve) {
            var rtf = e.clipboardData.getData('text/rtf');
            var officeType = getOfficeType(e);
            var hexImages = extractFromRtf(rtf, officeType);
            if(hexImages.length) {
                hexImages.map(function(img) {
                    arr.push(createSrcWithBase64(img));
                })
            }
    
            resolve(arr);
        });
    }
    
    module.exports = getImagesToBase64;
    
    /***/ }),
    /* 3 */
    /***/ (function(module, exports, __webpack_require__) {
    
    var tools = __webpack_require__(0);
    module.exports = function(event) {
        return new Promise(function(resolve, reject){
            var items = (event.clipboardData || event.originalEvent.clipboardData).items;
            var item;
            for (index in items) {
                item = items[index];
                if (item.kind === 'file') {
                    try{
                        var blob = item.getAsFile();
                        var reader = new FileReader();
                        reader.onload = function(event){
                            resolve(tools.b64toBlobURL(event.target.result));
                        }; // data url!
                        reader.readAsDataURL(blob);
                    }catch(e) {
                        reject();
                    }
                }
            }
        });
    }
    
    /***/ })
    /******/ ]);