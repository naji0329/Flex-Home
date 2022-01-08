class TagsManager {
    init() {
        $(document).find('.tags').each(function (index, element) {

            let tagify = new Tagify(element, {
                keepInvalidTags: $(element).data('keep-invalid-tags') !== undefined ? $(element).data('keep-invalid-tags') : true,
                enforceWhitelist: $(element).data('enforce-whitelist') !== undefined ? $(element).data('enforce-whitelist') : false,
                delimiters: $(element).data('delimiters') !== undefined ? $(element).data('delimiters') : ',',
                whitelist: element.value.trim().split(/\s*,\s*/),
            });

            if ($(element).data('url')) {
                tagify.on('input', e => {
                    tagify.settings.whitelist.length = 0; // reset current whitelist
                    tagify.loading(true).dropdown.hide.call(tagify) // show the loader animation

                    $.ajax({
                        type: 'GET',
                        url: $(element).data('url'),
                        success: data => {
                            tagify.settings.whitelist = data;

                            // render the suggestions dropdown.
                            tagify.loading(false).dropdown.show.call(tagify, e.detail.value);
                        },
                    });
                });
            }
        });
    }
}

$(document).ready(() => {
    (new TagsManager()).init();
})
