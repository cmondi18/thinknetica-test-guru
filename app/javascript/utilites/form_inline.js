document.addEventListener('turbolinks:load', function () {
    $('.form-inline-link').on('click', formInlineLinkHandler)

    var errors = document.querySelector('.resource-errors')

    if (errors) {
        var resourceId = errors.dataset.resourceId
        formInlineHandler(resourceId)
    }
})

function formInlineLinkHandler(event) {
    event.preventDefault()

    var testId = this.dataset.testId
    formInlineHandler(testId)
}

function formInlineHandler(testId) {
    var $link = $('.form-inline-link[data-test-id="' + testId + '"]')
    var $testTitle = $('.test-title[data-test-id="' + testId + '"]')
    var $formInline = $('.form-inline[data-test-id="' + testId + '"]')

    $testTitle.toggle()
    $formInline.toggle()

    if ($formInline.is(':visible')) {
        $link.text('Cancel')
    } else {
        $link.text('Edit')
    }
}