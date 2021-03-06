document.addEventListener('turbolinks:load', function () {
    var password = document.getElementById('user_password');
    var password_confirm = document.getElementById('user_password_confirmation');

    if (password_confirm) password_confirm.addEventListener('input', checkPassword)

    function checkPassword() {

        if (password_confirm.value === '') {
            document.querySelector('.octicon-alert').classList.add('hide')
            document.querySelector('.octicon-check').classList.add('hide')
            return
        }

        if (password.value === password_confirm.value) {
            document.querySelector('.octicon-check').classList.remove('hide')
            document.querySelector('.octicon-alert').classList.add('hide')
        } else {
            document.querySelector('.octicon-alert').classList.remove('hide')
            document.querySelector('.octicon-check').classList.add('hide')
        }
    }
})