document.addEventListener('turbolinks:load',
    function timer(event) {
        var seconds = document.querySelector('#seconds')
        var base_href = window.location.href

        if (seconds) {
            // used to disable changing time by user via js in devtools.
            base_seconds = seconds.textContent

            var interval = setInterval(function () {
                seconds.textContent = base_seconds -= 1

                if (base_seconds <= 0) {
                    window.location.href = window.location.href + '/result'
                }
                
                if (window.location.href !== base_href) {
                    clearInterval(interval)
                }
            }, 1000)
        }
}, true)