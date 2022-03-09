document.addEventListener('turbolinks:load', function () {
    $('.form-inline-title').on('click', formInlineTitleHandler)

    var errors = document.querySelector('.resource-errors')

    if (errors) {
        var resourceId = errors.dataset.resourceId
        formInlineHandler(resourceId)
    }
})

function formInlineTitleHandler(event) {
    event.preventDefault()

    var testId = this.dataset.testId
    formInlineHandler(testId)
}

function formInlineHandler(testId) {
    var $testTitle = $('.test-title[data-test-id="' + testId + '"]')
    var $formInline = $('.form-inline[data-test-id="' + testId + '"]')

    $testTitle.toggle()
    $formInline.toggle()
}