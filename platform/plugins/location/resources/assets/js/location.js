class Location {
    static changeProvince($element) {
        let $city = $(document).find('select[data-type=city]');
        if ($element.data('related-city')) {
            $city = $(document).find('#' + $element.data('related-city'));
        }
        let url = $element.data('change-state-url');
        if (url !== null && url !== '' && $element.val() !== '') {
            $.ajax({
                url: url,
                type: 'GET',
                data: {'state_id': $element.val()},
                beforeSend: () => {
                    $element.closest('form').find('button[type=submit], input[type=submit]').prop('disabled', true);
                },
                success: data =>  {
                    let option = '<option value="">' + ($city.data('placeholder')) + '</option>';
                    $.each(data.data,(index, item) => {
                        if (item.id === $city.data('origin-value')) {
                            option += '<option value="' + item.id + '" selected="selected">' + item.name + '</option>';
                        } else {
                            option += '<option value="' + item.id + '">' + item.name + '</option>';
                        }

                    });
                    $city.html(option);
                    $element.closest('form').find('button[type=submit], input[type=submit]').prop('disabled', false);
                }
            });
        }
    }
}

$(document).ready(() => {
    let $state_fields = $(document).find('select[data-type=state]');
    if ($state_fields.length > 0) {
        $.each($state_fields, (index, el) => {
            Location.changeProvince($(el));
        });
        $(document).on('change', 'select[data-type=state]', event =>  {
            Location.changeProvince($(event.currentTarget));
        });
    }
});
