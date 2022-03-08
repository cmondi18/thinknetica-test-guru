document.addEventListener('turbolinks:load', function () {
    var startButtons = document.querySelectorAll('.btn-start-test')

    for (var i = 0; i < startButtons.length; i++) {
        if (startButtons[i].dataset.questionCount == 0) {
            startButtons[i].disabled = true
        }
    }
})