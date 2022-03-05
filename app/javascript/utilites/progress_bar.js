document.addEventListener('turbolinks:load', function () {
    var bar = document.querySelector('.progress-bar')

    if (bar) {
        var progress = bar.dataset.current / bar.dataset.count * 100
        bar.style.width = progress + "%"
    }
})