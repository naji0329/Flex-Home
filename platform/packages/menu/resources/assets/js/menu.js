import sanitizeHTML from 'sanitize-html';

class MenuNestable {
    constructor() {
        this.$nestable = $('#nestable');
    }

    setDataItem(target) {
        target.each((index, el) => {
            let current = $(el);
            current.data('id', current.attr('data-id'));
            current.data('title', current.attr('data-title'));
            current.data('reference-id', current.attr('data-reference-id'));
            current.data('reference-type', current.attr('data-reference-type'));
            current.data('custom-url', current.attr('data-custom-url'));
            current.data('class', current.attr('data-class'));
            current.data('target', current.attr('data-target'));
        });
    }

    updatePositionForSerializedObj(arrayObject) {
        let result = arrayObject;
        let that = this;

        $.each(result, (index, val) => {
            val.position = index;
            if (typeof val.children == 'undefined') {
                val.children = [];
            }
            that.updatePositionForSerializedObj(val.children);
        });

        return result;
    }

    // Main function to initiate the module
    init() {
        let depth = parseInt(this.$nestable.attr('data-depth'));
        if (depth < 1) {
            depth = 5;
        }
        $('.nestable-menu').nestable({
            group: 1,
            maxDepth: depth,
            expandBtnHTML: '',
            collapseBtnHTML: ''
        });

        this.handleNestableMenu();
    }

    handleNestableMenu() {
        let that = this;
        // Show node details
        $(document).on('click', '.dd-item .dd3-content a.show-item-details', event => {
            event.preventDefault();
            let parent = $(event.currentTarget).parent().parent();
            $(event.currentTarget).toggleClass('active');
            parent.toggleClass('active');
        });

        // Edit attributes
        $(document).on('change blur keyup', '.nestable-menu .item-details input[type="text"], .nestable-menu .item-details select', event => {
            event.preventDefault();
            let current = $(event.currentTarget);
            let parent = current.closest('li.dd-item');
            let value = sanitizeHTML(current.val());
            let name = sanitizeHTML(current.attr('name'));
            let old = sanitizeHTML(current.attr('data-old'));
            parent.attr('data-' + name, value);
            parent.data(name, value);
            parent.find('> .dd3-content .text[data-update="' + name + '"]').text(value);
            if (value.trim() === '') {
                parent.find('> .dd3-content .text[data-update="' + name + '"]').text(old);
            }
            that.setDataItem(that.$nestable.find('> ol.dd-list li.dd-item'));
        });

        // Add nodes
        $(document).on('click', '.box-links-for-menu .btn-add-to-menu', event => {
            event.preventDefault();
            let current = $(event.currentTarget);
            let parent = current.parents('.the-box');
            let html = '';
            if (parent.attr('id') === 'external_link') {
                let data_type = 'custom-link';
                let data_reference_id = 0;
                let data_title = sanitizeHTML($('#node-title').val());
                let data_url = sanitizeHTML($('#node-url').val());
                let data_css_class = sanitizeHTML($('#node-css').val());
                let data_font_icon = sanitizeHTML($('#node-icon').val());
                let data_target = sanitizeHTML($('#target').find('option:selected').val());
                let url_html = '<label class="pb-3"><span class="text" data-update="custom-url">Url</span><input type="text" data-old="' + data_url + '" value="' + data_url + '" name="custom-url"></label>';
                html += '<li data-reference-type="' + data_type + '" data-reference-id="' + data_reference_id + '" data-title="' + data_title + '" data-class="' + data_css_class + '" data-id="0" data-custom-url="' + data_url + '" data-icon-font="' + data_font_icon + '" data-target="' + data_target + '" class="dd-item dd3-item">';
                html += '<div class="dd-handle dd3-handle"></div>';
                html += '<div class="dd3-content">';
                html += '<span class="text float-start" data-update="title">' + data_title + '</span>';
                html += '<span class="text float-end">' + data_type.split('\\').pop() + '</span>';
                html += '<a href="#" class="show-item-details"><i class="fa fa-angle-down"></i></a>';
                html += '<div class="clearfix"></div>';
                html += '</div>';
                html += '<div class="item-details">';
                html += '<label class="pb-3">';
                html += '<span class="text" data-update="title">Title</span>';
                html += '<input type="text" data-old="' + data_title + '" value="' + data_title + '" name="title" class="form-control">';
                html += '</label>';
                html += url_html;
                html += '<label class="pb-3"><span class="text" data-update="icon-font">Icon - font</span><input type="text" name="icon-font" value="' + data_font_icon + '" data-old="' + data_font_icon + '" class="form-control"></label>';
                html += '<label class="pb-3">';
                html += '<span class="text" data-update="class">CSS class</span>';
                html += '<input type="text" data-old="' + data_css_class + '" value="' + data_css_class + '" name="class" class="form-control">';
                html += '</label>';
                html += '<label class="pb-3">';
                html += '<span class="text" data-update="target">Target</span>';
                html += '<div style="width: 228px; display: inline-block"><select name="target" id="target" data-old="' + data_target + '" class="form-control select-full">';
                html += '<option value="_self">Open link directly</option>';
                html += '<option value="_blank" ' + (data_target === '_blank' ? 'selected="selected"' : '') + '>Open link in new tab</option>';
                html += '</select></div>';
                html += '</label>';
                html += '<div class="text-end">';
                html += '<a class="btn red btn-remove" href="#">Remove</a>';
                html += '<a class="btn blue btn-cancel" href="#">Cancel</a>';
                html += '</div>';
                html += '</div>';
                html += '<div class="clearfix"></div>';
                html += '</li>';
                parent.find('input[type="text"]').val('');
            } else {
                parent.find('.list-item li.active').each((index, el) => {
                    let find_in = $(el).find('> label');
                    let data_type = sanitizeHTML(find_in.attr('data-reference-type'));
                    let data_reference_id = sanitizeHTML(find_in.attr('data-reference-id'));
                    let data_title = sanitizeHTML(find_in.attr('data-title'));

                    html += '<li data-reference-type="' + data_type + '" data-reference-id="' + data_reference_id + '" data-title="' + data_title + '" data-id="0" data-target="_self" class="dd-item dd3-item">';
                    html += '<div class="dd-handle dd3-handle"></div>';
                    html += '<div class="dd3-content">';
                    html += '<span class="text float-start" data-update="title">' + data_title + '</span>';
                    html += '<span class="text float-end">' + data_type.split('\\').pop() + '</span>';
                    html += '<a href="#" class="show-item-details"><i class="fa fa-angle-down"></i></a>';
                    html += '<div class="clearfix"></div>';
                    html += '</div>';
                    html += '<div class="item-details">';
                    html += '<label class="pb-3">';
                    html += '<span class="text" data-update="title">Title</span>';
                    html += '<input type="text" data-old="' + data_title + '" value="' + data_title + '" name="title" class="form-control">';
                    html += '</label>';
                    html += '<label class="pb-3"><span class="text" data-update="icon-font">Icon - font</span><input type="text" name="icon-font" class="form-control"></label>';
                    html += '<label class="pb-3">';
                    html += '<span class="text" data-update="class">CSS class</span>';
                    html += '<input type="text" name="class" class="form-control">';
                    html += '</label>';
                    html += '<label class="pb-3">';
                    html += '<span class="text" data-update="target">Target</span>';
                    html += '<div style="width: 228px; display: inline-block"><select name="target" id="target" class="form-control select-full">';
                    html += '<option value="_self">Open link directly</option>';
                    html += '<option value="_blank">Open link in new tab</option>';
                    html += '</select></div>';
                    html += '</label>';
                    html += '<div class="text-end">';
                    html += '<a class="btn red btn-remove" href="#">Remove</a>';
                    html += '<a class="btn blue btn-cancel" href="#">Cancel</a>';
                    html += '</div>';
                    html += '</div>';
                    html += '<div class="clearfix"></div>';
                    html += '</li>';

                    $(el).find('input[type=checkbox]').prop('checked', false);
                });
            }

            $('.nestable-menu > ol.dd-list').append(html.replace('<script>', '').replace('<\\/script>', ''));

            $('.nestable-menu').find('.select-full').select2({
                width: '100%',
                minimumResultsForSearch: -1
            });

            // Change json
            that.setDataItem(that.$nestable.find('> ol.dd-list li.dd-item'));
            parent.find('.list-item li.active').removeClass('active');
        });

        // Remove nodes
        $('.form-save-menu input[name="deleted_nodes"]').val('');
        $(document).on('click', '.nestable-menu .item-details .btn-remove', event => {
            event.preventDefault();
            let current = $(event.currentTarget);
            let dd_item = current.parents('.item-details').parent();

            let $elm = $('.form-save-menu input[name="deleted_nodes"]');
            // Add id of deleted nodes to delete in controller
            $elm.val($elm.val() + ' ' + dd_item.attr('data-id'));
            let children = dd_item.find('> .dd-list').html();
            if (children !== '' && children != null) {
                dd_item.before(children.replace('<script>', '').replace('<\\/script>', ''));
            }
            dd_item.remove();
        });

        $(document).on('click', '.nestable-menu .item-details .btn-cancel', event => {
            event.preventDefault();
            let current_pa = $(event.currentTarget);
            let parent = current_pa.parents('.item-details').parent();
            parent.find('input[type="text"]').each((index, el) => {
                $(el).val($(el).attr('data-old'));
            });

            parent.find('select').each((index, el) => {
                $(el).val($(el).val());
            });

            parent.find('input[type="text"]').trigger('change');
            parent.find('select').trigger('change');
            parent.removeClass('active');
        });

        $(document).on('change', '.box-links-for-menu .list-item li input[type=checkbox]', event => {
            $(event.currentTarget).closest('li').toggleClass('active');
        });

        $(document).on('submit', '.form-save-menu', () => {
            if (that.$nestable.length < 1) {
                $('#nestable-output').val('[]');
            } else {
                let nestable_obj_returned = that.$nestable.nestable('serialize');
                let the_obj = that.updatePositionForSerializedObj(nestable_obj_returned);
                $('#nestable-output').val(JSON.stringify(the_obj));
            }
        });

        let accordion = $('#accordion');

        let toggleChevron = event => {
            $(event.target).prev('.widget-heading').find('.narrow-icon').toggleClass('fa-angle-down fa-angle-up');
        };

        accordion.on('hidden.bs.collapse', toggleChevron);
        accordion.on('shown.bs.collapse', toggleChevron);

        Botble.callScroll($('.list-item'));
    }
}

$(window).on('load', () => {
    new MenuNestable().init();
});
