/******/ (() => { // webpackBootstrap
var __webpack_exports__ = {};
/*!********************************************************!*\
  !*** ./platform/core/acl/resources/assets/js/login.js ***!
  \********************************************************/
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }

var Login = /*#__PURE__*/function () {
  function Login() {
    _classCallCheck(this, Login);
  }

  _createClass(Login, [{
    key: "handleLogin",
    value: function handleLogin() {
      $('.login-form').validate({
        errorElement: 'span',
        //default input error message container
        errorClass: 'help-block',
        // default input error message class
        focusInvalid: false,
        // do not focus the last invalid input
        rules: {
          username: {
            required: true
          },
          password: {
            required: true
          },
          remember: {
            required: false
          }
        },
        messages: {
          username: {
            required: 'Username is required.'
          },
          password: {
            required: 'Password is required.'
          }
        },
        invalidHandler: function invalidHandler() {
          //display error alert on form submit
          $('.alert-danger', $('.login-form')).show();
        },
        highlight: function highlight(element) {
          // highlight error inputs
          $(element).closest('.form-group').addClass('has-error'); // set error class to the control group
        },
        success: function success(label) {
          label.closest('.form-group').removeClass('has-error');
          label.remove();
        },
        errorPlacement: function errorPlacement(error, element) {
          error.insertAfter(element.closest('.form-control'));
        },
        submitHandler: function submitHandler(form) {
          form.submit(); // form validation success, call ajax form submit
        }
      });
      $('.login-form input').keypress(function (e) {
        if (e.which === 13) {
          var $form = $('.login-form');

          if ($form.validate().form()) {
            $form.submit(); //form validation success, call ajax form submit
          }

          return false;
        }
      });
    }
  }, {
    key: "handleForgetPassword",
    value: function handleForgetPassword() {
      $('.forget-form').validate({
        errorElement: 'span',
        //default input error message container
        errorClass: 'help-block',
        // default input error message class
        focusInvalid: false,
        // do not focus the last invalid input
        ignore: '',
        rules: {
          email: {
            required: true,
            email: true
          }
        },
        messages: {
          email: {
            required: 'Email is required.'
          }
        },
        invalidHandler: function invalidHandler() {
          //display error alert on form submit
          $('.alert-danger', $('.forget-form')).show();
        },
        highlight: function highlight(element) {
          // hightlight error inputs
          $(element).closest('.form-group').addClass('has-error'); // set error class to the control group
        },
        success: function success(label) {
          label.closest('.form-group').removeClass('has-error');
          label.remove();
        },
        errorPlacement: function errorPlacement(error, element) {
          error.insertAfter(element.closest('.form-control'));
        },
        submitHandler: function submitHandler(form) {
          form.submit();
        }
      });
      $('.forget-form input').keypress(function (e) {
        if (e.which === 13) {
          if ($('.forget-form').validate().form()) {
            $('.forget-form').submit();
          }

          return false;
        }
      });
    }
  }, {
    key: "init",
    value: function init() {
      this.handleLogin();
      this.handleForgetPassword();
    }
  }]);

  return Login;
}();

$(document).ready(function () {
  new Login().init();
  var username = document.querySelector('[name="username"]');
  var email = document.querySelector('[name="email"]');
  var password = document.querySelector('[name="password"]');
  var passwordConfirmation = document.querySelector('[name="password_confirmation"]');

  if (username) {
    username.focus();
    document.getElementById('emailGroup').classList.add('focused'); // Focus events for email and password fields

    username.addEventListener('focusin', function () {
      document.getElementById('emailGroup').classList.add('focused');
    });
    username.addEventListener('focusout', function () {
      document.getElementById('emailGroup').classList.remove('focused');
    });
  }

  if (email) {
    email.focus();
    document.getElementById('emailGroup').classList.add('focused'); // Focus events for email and password fields

    email.addEventListener('focusin', function () {
      document.getElementById('emailGroup').classList.add('focused');
    });
    email.addEventListener('focusout', function () {
      document.getElementById('emailGroup').classList.remove('focused');
    });
  }

  if (password) {
    password.addEventListener('focusin', function () {
      document.getElementById('passwordGroup').classList.add('focused');
    });
    password.addEventListener('focusout', function () {
      document.getElementById('passwordGroup').classList.remove('focused');
    });
  }

  if (passwordConfirmation) {
    passwordConfirmation.addEventListener('focusin', function () {
      document.getElementById('passwordConfirmationGroup').classList.add('focused');
    });
    passwordConfirmation.addEventListener('focusout', function () {
      document.getElementById('passwordConfirmationGroup').classList.remove('focused');
    });
  }
});
/******/ })()
;