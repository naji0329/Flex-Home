class Login {
    handleLogin() {

        $('.login-form').validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
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

            invalidHandler: () => { //display error alert on form submit
                $('.alert-danger', $('.login-form')).show();
            },

            highlight: element => { // highlight error inputs
                $(element)
                    .closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            success: label => {
                label.closest('.form-group').removeClass('has-error');
                label.remove();
            },

            errorPlacement: (error, element) => {
                error.insertAfter(element.closest('.form-control'));
            },

            submitHandler: form => {
                form.submit(); // form validation success, call ajax form submit
            }
        });

        $('.login-form input').keypress(e => {
            if (e.which === 13) {
                let $form = $('.login-form');
                if ($form.validate().form()) {
                    $form.submit(); //form validation success, call ajax form submit
                }
                return false;
            }
        });
    }

    handleForgetPassword() {
        $('.forget-form').validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
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

            invalidHandler: () => { //display error alert on form submit
                $('.alert-danger', $('.forget-form')).show();
            },

            highlight: (element) => { // hightlight error inputs
                $(element)
                    .closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            success: label => {
                label.closest('.form-group').removeClass('has-error');
                label.remove();
            },

            errorPlacement: (error, element) => {
                error.insertAfter(element.closest('.form-control'));
            },

            submitHandler: form => {
                form.submit();
            }
        });

        $('.forget-form input').keypress(e => {
            if (e.which === 13) {
                if ($('.forget-form').validate().form()) {
                    $('.forget-form').submit();
                }
                return false;
            }
        });

    }

    init() {
        this.handleLogin();
        this.handleForgetPassword();
    }
}

$(document).ready(() => {
    new Login().init();

    var username = document.querySelector('[name="username"]');
    var email = document.querySelector('[name="email"]');
    var password = document.querySelector('[name="password"]');
    var passwordConfirmation = document.querySelector('[name="password_confirmation"]');

    if (username) {
        username.focus();

        document.getElementById('emailGroup').classList.add('focused');

        // Focus events for email and password fields
        username.addEventListener('focusin', function () {
            document.getElementById('emailGroup').classList.add('focused');
        });

        username.addEventListener('focusout', function () {
            document.getElementById('emailGroup').classList.remove('focused');
        });
    }

    if (email) {
        email.focus();

        document.getElementById('emailGroup').classList.add('focused');

        // Focus events for email and password fields
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
