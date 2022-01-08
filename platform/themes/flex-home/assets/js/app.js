(function ($) {
    "use strict";
    $(document).ready(function () {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
        });

        let isRTL = $('body').prop('dir') === 'rtl';

        $(document).on('click', '.generic-form button[type=submit]', function (event) {
            event.preventDefault();
            event.stopPropagation();
            var buttonText = $(this).text();
            $(this).prop('disabled', true).html('<i class="fa fa-spin fa-spinner"></i>');

            $.ajax({
                type: 'POST',
                cache: false,
                url: $(this).closest('form').prop('action'),
                data: new FormData($(this).closest('form')[0]),
                contentType: false,
                processData: false,
                success: res => {
                    $(this).closest('form').find('.text-success').html('').hide();
                    $(this).closest('form').find('.text-danger').html('').hide();

                    if (!res.error) {
                        $(this).closest('form').find('input[type=text]:not([readonly])').val('');
                        $(this).closest('form').find('input[type=email]').val('');
                        $(this).closest('form').find('input[type=url]').val('');
                        $(this).closest('form').find('input[type=tel]').val('');
                        $(this).closest('form').find('select').val('');
                        $(this).closest('form').find('textarea').val('');

                        $(this).closest('form').find('.text-success').html(res.message).show();

                        if (res.data && res.data.next_page) {
                            window.location.href = res.data.next_page;
                        }

                        setTimeout(function () {
                            $(this).closest('form').find('.text-success').html('').hide();
                        }, 5000);
                    } else {
                        $(this).closest('form').find('.text-danger').html(res.message).show();

                        setTimeout(function () {
                            $(this).closest('form').find('.text-danger').html('').hide();
                        }, 5000);
                    }

                    if (typeof refreshRecaptcha !== 'undefined') {
                        refreshRecaptcha();
                    }

                    $(this).prop('disabled', false).html(buttonText);
                },
                error: res => {
                    if (typeof refreshRecaptcha !== 'undefined') {
                        refreshRecaptcha();
                    }
                    $(this).prop('disabled', false).html(buttonText);
                    handleError(res, $(this).closest('form'));
                }
            });
        });

        var handleError = function (data, form) {
            if (typeof (data.errors) !== 'undefined' && !_.isArray(data.errors)) {
                handleValidationError(data.errors, form);
            } else {
                if (typeof (data.responseJSON) !== 'undefined') {
                    if (typeof (data.responseJSON.errors) !== 'undefined') {
                        if (data.status === 422) {
                            handleValidationError(data.responseJSON.errors, form);
                        }
                    } else if (typeof (data.responseJSON.message) !== 'undefined') {
                        $(form).find('.text-danger').html(data.responseJSON.message).show();
                    } else {
                        var message = '';
                        $.each(data.responseJSON, (index, el) => {
                            $.each(el, (key, item) => {
                                message += item + '<br />';
                            });
                        });

                        $(form).find('.text-danger').html(message).show();
                    }
                } else {
                    $(form).find('.text-danger').html(data.statusText).show();
                }
            }
        };

        var handleValidationError = function (errors, form) {
            let message = '';
            $.each(errors, (index, item) => {
                message += item + '<br />';
            });

            $(form).find('.text-success').html('').hide();
            $(form).find('.text-danger').html('').hide();

            $(form).find('.text-danger').html(message).show();
        };

        $('#cityslide').owlCarousel({
            rtl: isRTL,
            margin: 20,
            dots: false,
            nav: true,
            navText: [$('.am-prev'), $('.am-next')],
            loop: false,
            responsive: {
                0: {
                    items: 1
                },
                400: {
                    items: 2
                },
                800: {
                    items: 3
                },
                1000: {
                    items: 4
                },
                1300: {
                    items: 5
                }
            }
        });

        $('#project-city-slides').owlCarousel({
            rtl: isRTL,
            margin: 20,
            dots: false,
            nav: true,
            navText: [$('.am-prev'), $('.am-next')],
            loop: false,
            responsive: {
                0: {
                    items: 1
                },
                400: {
                    items: 2
                },
                800: {
                    items: 3
                },
                1000: {
                    items: 4
                },
                1300: {
                    items: 5
                }
            }
        });

        $('#listcarousel').owlCarousel({
            rtl: isRTL,
            margin: 0,
            loop: true,
            autoplay: true,
            lazyLoad: true,
            dots: false,
            nav: false,
            center: true,
            responsive: {
                300: {
                    items: 1
                },
                900: {
                    items: 2
                },
                1100: {
                    items: 3
                }
            }
        });

        $('#listcarouselthumb').owlCarousel({
            rtl: isRTL,
            margin: 0,
            dots: false,
            loop: true,
            autoplay: true,
            lazyLoad: true,
            nav: true,
            navText: [$('.ar-prev'), $('.ar-next')],
            responsive: {
                300: {
                    items: 2
                },
                900: {
                    items: 3
                },
                1100: {
                    items: 5
                }
            }
        });

        var typeSearch = $('#hometypesearch a.active').attr('rel');
        var txtKey = $('#txtkey');
        var homeTypeSearch = $('#hometypesearch');
        homeTypeSearch.find('a').on('click', function () {
            $('.advanced-search-content').removeClass('active');

            if ($(this).attr('rel') === 'project') {
                $('.advanced-search-content.property-advanced-search input').prop('disabled', true);
                $('.advanced-search-content.property-advanced-search select').prop('disabled', true);

                $('.advanced-search-content.project-advanced-search input').prop('disabled', false);
                $('.advanced-search-content.project-advanced-search select').prop('disabled', false);
            } else {
                $('.advanced-search-content.project-advanced-search input').prop('disabled', true);
                $('.advanced-search-content.project-advanced-search select').prop('disabled', true);

                $('.advanced-search-content.property-advanced-search input').prop('disabled', false);
                $('.advanced-search-content.property-advanced-search select').prop('disabled', false);
            }

            $('.listsuggest').html('').hide();
            txtKey.val('');
            typeSearch = $(this).attr('rel');
            homeTypeSearch.find('a').removeClass('active');
            $(this).addClass('active');
            $('#txttypesearch').val(typeSearch);
            $('#frmhomesearch').prop('action', $(this).data('url'));
        });
        var timeout = null;
        txtKey.on('keydown', function () {
            $('.listsuggest').html('').hide();
            $(this).parents('.keyword-input').find('.spinner-icon').hide();
        });
        txtKey.on('keyup', function () {
            var k = $(this).val();
            if (k) {
                var parent = $(this).parents('.keyword-input');
                parent.find('.spinner-icon').show();
                clearTimeout(timeout);
                timeout = setTimeout(function () {
                    // Do AJAX shit here
                    $.get($('#hometypesearch a.active').data('url') + '?type=' + typeSearch + '&k=' + k + '&minimal=true', function (data) {
                        if (!data.error && data.data !== '') {
                            $('.listsuggest').html(data.data).show();
                        } else {
                            $('.listsuggest').html('').hide();
                        }
                        parent.find('.spinner-icon').hide();
                    });
                }, 500);
            }
        });

        var lazyloadImages = document.querySelectorAll('img.lazy');
        var lazyloadThrottleTimeout;

        function lazyload() {
            if (lazyloadThrottleTimeout) {
                clearTimeout(lazyloadThrottleTimeout);
            }
            lazyloadThrottleTimeout = setTimeout(function () {
                var scrollTop = window.pageYOffset;
                lazyloadImages.forEach(function (img) {

                    if (img.offsetTop < (window.innerHeight + scrollTop)) {
                        img.src = img.dataset.src;
                        img.classList.remove('lazy');
                    }
                });
                if (lazyloadImages.length == 0) {
                    document.removeEventListener('scroll', lazyload);
                    window.removeEventListener('resize', lazyload);
                    window.removeEventListener('orientationChange', lazyload);
                }
            }, 200);
        }

        lazyload();
        $(document).scroll(function () {
            var scroll = window.pageYOffset;
            if (scroll > 0) {
                $('.cd-top').find('.fas').attr('class', 'fas fa-arrow-up');
            } else {
                $('.cd-top').find('.fas').attr('class', 'fas fa-arrow-down');
            }
        });

        $('.pagination').addClass('pagination-sm');
        $('[data-toggle="tooltip"]').tooltip();

        $(document).on('click', '.cd-top', function (event) {
            event.preventDefault();
            var top = $('html').scrollTop();
            if (top > 0) {
                $('body,html').animate({
                    scrollTop: 0
                }, 800);
            } else {
                $('body,html').animate({
                    scrollTop: $('html').height()
                }, 800);
            }

            return false;
        });

        var locationTimeout = null;
        $('.select-city-state')
            .on('keydown', function () {
                $(this).parents('.location-input').find('.suggestion').html('').hide();
            })
            .on('keyup', function () {
                var k = $(this).val();
                if (k) {
                    var parent = $(this).parents('.location-input');
                    parent.find('.input-has-icon i').hide();
                    parent.find('.spinner-icon').show();
                    clearTimeout(locationTimeout);
                    locationTimeout = setTimeout(function () {
                        $.get((parent.data('url') ? parent.data('url') : window.siteUrl + '/ajax/cities') + '?k=' + k, function (data) {
                            if (!data.error && data.data !== '') {
                                parent.find('.suggestion').html(data.data).show();
                            } else {
                                parent.find('.suggestion').html('').hide();
                            }
                            parent.find('.spinner-icon').hide();
                            parent.find('.input-has-icon i').show();
                        });
                    }, 500);
                }
            });

        $(document).on('click', '.suggestion li a', function (event) {
            event.preventDefault();
            event.stopPropagation();

            var parent = $(this).parents('.location-input');

            parent.find('input[name=city_id]').val($(this).data('id'));
            parent.find('.select-city-state').val($(this).text());
            parent.find('.suggestion').html('').hide();
        });

        $('#header-waypoint').waypoint({
            handler: function (direction) {
                if (direction === 'down') {
                    $('.main-header').addClass('header-sticky');
                    $('body').addClass('is-sticky');
                } else {
                    $('.main-header').removeClass('header-sticky');
                    $('body').removeClass('is-sticky');
                }
            }
        });

        function _getScrollbarWidth() {
            // thx d.walsh
            const scrollDiv = document.createElement('div');
            scrollDiv.className = 'modal-scrollbar-measure';
            document.body.appendChild(scrollDiv);
            const scrollbarWidth = scrollDiv.getBoundingClientRect().width - scrollDiv.clientWidth;
            document.body.removeChild(scrollDiv);
            return scrollbarWidth;
        }

        $('#navbarSupportedContent')
            .on('show.bs.collapse', function () {
                $('body').addClass('hidden-scroll-main-menu').css('padding-right', _getScrollbarWidth());
            })
            .on('hidden.bs.collapse', function () {
                $('body').removeClass('hidden-scroll-main-menu').css('padding-right', '');
            });

        $(document).on('click', '.main-menu-darken, .toggle-main-menu-offcanvas', function (e) {
            e.preventDefault();
            $('#navbarSupportedContent').collapse('hide');
        })

        $(document).on('click', '.advanced-search-toggler', function (event) {
            event.preventDefault();

            if ($('#hometypesearch a.active').attr('rel') === 'project') {
                $('.advanced-search-content.property-advanced-search').removeClass('active');
                $('.advanced-search-content.project-advanced-search').toggleClass('active');
            } else {
                $('.advanced-search-content.project-advanced-search').removeClass('active');
                $('.advanced-search-content.property-advanced-search').toggleClass('active');
            }

            if ($('.advanced-search-content.active').length) {
                $('.listsuggest').css({top: $(this).closest('form').height() + $('.advanced-search-content.property-advanced-search').height() + 5 + 'px'});
            } else {
                $('.listsuggest').css({top: $(this).closest('form').height() + 'px'});
            }
        });

        $(document).on('change', '.shop__sort select', function (event) {
            event.preventDefault();
            $(this).closest('form').trigger('submit');
        });

        $(document).on('click', function (e) {
            if (e.target.className !== 'form-control') {
                if (e.target.className !== 'keyword-input') {
                    $('.listsuggest').hide();
                }

                if (e.target.className !== 'location-input') {
                    $('.suggestion').hide();
                }
            }
        });

        function initMaps() {
            let $map = $('#map');
            if (!$map.length) {
                return false;
            }
            if ($('.view-type-map').length && !$('.view-type-map').hasClass('active')) {
                return false;
            }

            var totalPage = 0;
            var currentPage = 1;
            var params = searchToObject();
            var center = $map.data('center');
            const centerFirst = $('#properties-list .property-item[data-lat][data-long]').filter(function () {
                return $(this).data('lat') && $(this).data('long')
            });
            if (centerFirst && centerFirst.length) {
                center = [centerFirst.data('lat'), centerFirst.data('long')]
            }
            if (window.activeMap) {
                window.activeMap.off();
                window.activeMap.remove();
            }

            let map = L.map('map', {
                zoomControl: true,
                scrollWheelZoom: true,
                dragging: true,
                maxZoom: 22
            }).setView(center, 14);

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(map);

            var markers = new L.MarkerClusterGroup();
            var markersList = [];
            let $templatePopup = $('#traffic-popup-map-template').html();

            function populate() {
                if ((totalPage == 0) || currentPage <= totalPage) {
                    params.page = currentPage;
                    $.ajax({
                        url: $map.data('url'),
                        type: 'GET',
                        data: params,
                        success: function (res) {
                            if (res.data.length > 0) {
                                res.data.forEach(house => {
                                    if (house.latitude && house.longitude) {
                                        var myIcon = L.divIcon({
                                            className: 'boxmarker',
                                            iconSize: L.point(50, 20),
                                            html: house.map_icon
                                        });
                                        let popup = templateReplace(house, $templatePopup);
                                        var m = new L.Marker(new L.LatLng(house.latitude, house.longitude), {icon: myIcon})
                                            .bindPopup(popup)
                                            .addTo(map);
                                        markersList.push(m);
                                        markers.addLayer(m);

                                        map.flyToBounds(L.latLngBounds(markersList.map(marker => marker.getLatLng())));
                                    }
                                });
                                if (totalPage == 0) {
                                    totalPage = res.meta.last_page
                                }
                                currentPage++;
                                populate();
                            }
                        }
                    });
                }

                return false;
            }

            populate();
            map.addLayer(markers);

            window.activeMap = map;
        }

        function setCookie(cname, cvalue, exdays) {
            var d = new Date();
            var url = new URL(window.siteUrl);
            d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
            var expires = 'expires=' + d.toUTCString();
            document.cookie = cname + '=' + cvalue + '; ' + expires + '; path=/' + '; domain=' + url.hostname;
        }

        $(document).on('click', '.view-type-map', function () {
            $('#properties-map').toggleClass('d-none');
            let className = $('#properties-list').data('class-left');
            let hasActive = $(this).hasClass('active');
            $(this).toggleClass('active');
            if (hasActive) {
                className = $('#properties-list').data('class-full');
            }
            $('#properties-list').attr('class', className);
            if (!hasActive) {
                initMaps();
            }
            setCookie('show_map_on_properties', hasActive ? 0 : 1, 60);
        });

        if ($('#map').length) {
            initMaps();
        }

        $('#ajax-filters-form').find('.select-dropdown').map(function () {
            showTextForDropdownSelect($(this))
        });

        $(document).on('click', '#ajax-filters-form .select-dropdown .btn-clear', function () {
            const $dropdown = $(this).closest('.select-dropdown');
            $dropdown.find('select[name]').map(function () {
                $(this).val('').trigger('change');
            });
            $('#ajax-filters-form').trigger('submit');
        });

        // submit form with submit button in select dropdown
        $(document).on('click', '#ajax-filters-form .select-dropdown button[type=submit]', function () {
            $('#ajax-filters-form').trigger('submit');
        });

        // Reset form
        $(document).on('click', '#ajax-filters-form button[type=reset]', function () {
            $('#ajax-filters-form').find(':input[name]').val('');
            $('#ajax-filters-form').trigger('submit');
        });

        $(document).on('submit', '#ajax-filters-form', function (event) {
            event.preventDefault();
            const $form = $(event.currentTarget);
            const formData = $form.serializeArray();
            let data = [];
            let uriData = [];
            formData.forEach(function (obj) {
                if (obj.value) {
                    data.push(obj);
                    uriData.push(obj.name + '=' + obj.value);
                }
            });
            const nextHref = $form.attr('action') + (uriData && uriData.length ? ('?' + uriData.join('&')) : '');

            // Show selects to dropdown
            $form.find('.select-dropdown').map(function () {
                showTextForDropdownSelect($(this))
            })
            // add to params get to popstate not show json
            data.push({name: 'is_searching', value: 1});

            $.ajax({
                url: $form.attr('action'),
                type: 'GET',
                data: data,
                beforeSend: function () {
                    $('#loading').show();
                    $('html, body').animate({
                        scrollTop: $('#ajax-filters-form').offset().top - ($('.main-header').height() + 50)
                    }, 500);
                    // Close filter on mobile
                    $form.find('.search-box').removeClass('active');
                },
                success: function (res) {
                    if (res.error == false) {
                        $form.find('.data-listing').html(res.data);
                        window.wishlishInElement($form.find('.data-listing'));
                        if (nextHref != window.location.href) {
                            window.history.pushState(data, res.message, nextHref);
                        }
                        initMaps();
                    } else {
                        window.showAlert('alert-error', res.message || 'Opp!');
                    }
                },
                complete: function () {
                    $('#loading').hide();
                }
            });
        });

        function searchToObject() {
            var pairs = window.location.search.substring(1).split('&'),
                obj = {},
                pair,
                i;

            for (i in pairs) {
                if (pairs[i] === '') continue;

                pair = pairs[i].split('=');
                obj[decodeURIComponent(pair[0])] = decodeURIComponent(pair[1]);
            }

            return obj;
        }

        window.addEventListener('popstate', function () {
            const $formSearch = $('#ajax-filters-form');
            var url = window.location.origin + window.location.pathname;
            if ($formSearch.attr('action') == url) {
                const pairs = searchToObject();
                $formSearch.find('input, select, textarea').each(function (e, i) {
                    const $el = $(i);
                    let value = (pairs[$el.attr('name')] || '');
                    if ($el.val() != value) {
                        $el.val(value).trigger('change');
                    }
                });
                $formSearch.trigger('submit');
            } else {
                history.back()
            }
            ;
        }, false);

        // Keep open dropdown when click inside
        $('.dropdown-menu.keep-open select').on('click', function (e) {
            e.stopPropagation();
        });

        function showTextForDropdownSelect($el) {
            let text = [];
            $el.find('select[name]').map(function () {
                const $this = $(this);
                const $option = $this.find('option:selected');
                if ($option.text() && $option.val()) {
                    text.push($option.text());
                }
            });
            $el.find('.dropdown-toggle span').text(text && text.length ? text.join(' - ') : $el.data('text-default'));
        }

        $(document).on('click', '.list-of-suggetions li', function (event) {
            event.preventDefault();
            const $this = $(event.currentTarget);
            const $parent = $this.closest('.dropdown');
            $parent.find('.dropdown-toggle span').text($this.text());
            const values = $this.data('value').split('-');
            $parent.find('input.min-input').val(values[0]).trigger('change')
            $parent.find('input.max-input').val(values[1]).trigger('change');
            $this.closest('form').trigger('submit')
        });

        function setLabelInputMinMax($el) {
            const calc = $el.data('calc');
            const $min = $el.find('input.min-input');
            const $minLabel = $el.find('.min-label');
            const $maxLabel = $el.find('.max-label');
            const $max = $el.find('input.max-input');
            var minValue = parseInt($min.val());
            var maxValue = parseInt($max.val());
            $min.val(minValue || '');
            $max.val(maxValue || '');

            let dropdownLabel = $el.data('all');
            let minLabel = '';
            let maxLabel = '';

            if (maxValue || minValue) {
                calc.map(function (e) {
                    if (minValue >= e.number && !minLabel) {
                        minLabel = e.label.replace('__value__', new Intl.NumberFormat().format(parseFloat((minValue / (e.number || 1)).toFixed(2))));
                    }
                    if (maxValue >= e.number && !maxLabel) {
                        maxLabel = e.label.replace('__value__', new Intl.NumberFormat().format(parseFloat((maxValue / (e.number || 1)).toFixed(2))));
                    }
                })
                $minLabel.text(minLabel);
                $maxLabel.text(maxLabel);

                if (!minValue) {
                    dropdownLabel = '< ';
                }

                if (maxValue) {
                    if (minValue) {
                        dropdownLabel = minLabel + ' - ' + maxLabel;
                    } else {
                        dropdownLabel = dropdownLabel + maxLabel;
                    }
                } else {
                    dropdownLabel = '> ' + minLabel;
                }
            } else {
                $minLabel.text(minLabel);
                $maxLabel.text(maxLabel);
            }

            $el.closest('.dropdown').find('.dropdown-toggle span').text(dropdownLabel);
        }

        $(document).on('change keyup', 'input.min-input, input.max-input', function () {
            const parent = $(this).closest('.form-group');
            setLabelInputMinMax(parent)
        });

        $('.dropdown .min-max-input').map(function () {
            setLabelInputMinMax($(this));
        })

        $(document).on('click', '#ajax-filters-form .pagination a', function (e) {
            e.preventDefault();
            var url = new URL($(e.currentTarget).attr('href'));
            var page = url.searchParams.get('page');
            $('#ajax-filters-form input[name=page]').val(page)
            $('#ajax-filters-form').trigger('submit');
        });

        $(document).on('click', '.toggle-filter-offcanvas', function (e) {
            e.preventDefault();
            $('#ajax-filters-form .search-box').toggleClass('active');
        });

        function checkResizeFilter() {
            // main menu
            if (window.innerWidth > 991) {
                $('#navbarSupportedContent').collapse('hide')
            }
            if (window.innerWidth <= 767) {
                $('#ajax-filters-form .search-box').addClass('animation');
            } else {
                $('#ajax-filters-form .search-box').removeClass('animation');
            }
        }

        checkResizeFilter();
        $(window).on('resize', function () {
            checkResizeFilter();
        });

        $(document).on('click', '#ajax-filters-form .screen-darken', function (e) {
            e.preventDefault();
            $('#ajax-filters-form .search-box').removeClass('active');
        });

        // Property detail
        let trafficMap;

        function setTrafficMap($related) {
            if (trafficMap) {
                trafficMap.off();
                trafficMap.remove();
            }
            trafficMap = L.map($related.data('map-id'), {
                zoomControl: false,
                scrollWheelZoom: true,
                dragging: true,
                maxZoom: 22
            }).setView($related.data('center'), 14);
            var myIcon = L.divIcon({
                className: 'boxmarker',
                iconSize: L.point(50, 20),
                html: $related.data('map-icon')
            });
            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(trafficMap);
            L.marker($related.data('center'), {icon: myIcon}).addTo(trafficMap)
                .bindPopup($($related.data('popup-id')).html())
                .openPopup();
        }

        if ($('[data-popup-id="#traffic-popup-map-template"]').length) {
            setTrafficMap($('[data-popup-id="#traffic-popup-map-template"]'));
        }

        function templateReplace(data, template) {
            const keys = Object.keys(data);
            for (const i in keys) {
                if (keys.hasOwnProperty(i)) {
                    const key = keys[i]
                    template = template.replace(new RegExp('__' + key + '__', 'gi'), data[key] || '')
                }
            }
            return template;
        }

        if (jQuery().magnificPopup) {

            $('.show-gallery-image').on('click', function () {
                $('#listcarouselthumb .owl-item:not(.cloned) .showfullimg:first').trigger('click');
            });

            $('#listcarouselthumb, #listcarousel').magnificPopup({
                delegate: '.owl-item:not(.cloned) .showfullimg',
                type: 'image',
                tLoading: 'Loading image #%curr%...',
                mainClass: 'mfp-img-mobile',
                gallery: {
                    enabled: true,
                    navigateByImgClick: true,
                    preload: [0, 1] // Will preload 0 - before current, and 1 after the current image
                },
                image: {
                    tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
                    titleSrc: function (item) {
                        return item.el.attr('title');
                    }
                }
            });

            $('.popup-youtube').magnificPopup({
                type: 'iframe',
                mainClass: 'mfp-fade',
                removalDelay: 160,
                preloader: false,
                hiddenClass: 'zxcv',
                overflowY: 'hidden',
                iframe: {
                    patterns: {
                        youtube: {
                            index: 'youtube.com',
                            id: function (url) {
                                var regExp = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#&?]*).*/;
                                var match = url.match(regExp);
                                return (match && match[7].length == 11) ? match[7] : url;
                            },
                            src: '//www.youtube.com/embed/%id%?autoplay=1'
                        }
                    }
                }
            });

            $(document).on('click', '[data-magnific-popup]', function (e) {
                var $this = $(e.currentTarget),
                    id = $this.data('magnific-popup');
                $.magnificPopup.open({
                    items: {
                        src: id,
                        type: "inline",
                    },
                    removalDelay: 300,
                    overflowY: 'hidden',
                    midClick: true,
                    callbacks: {
                        beforeOpen: function () {
                            if (!$this.data('clicked')) {
                                $(this.st.items.src).html('');
                            }
                        },
                        open: function () {
                            if (!$this.data('clicked')) {
                                $this.data('clicked', true);
                                setTrafficMap($this);
                            }
                        }
                    }
                });
                e.preventDefault()
            });
        }

        $('.menu--mobile .menu-item-has-children > .sub-toggle').on(
            'click',
            function (e) {
                e.preventDefault();
                let current = $(this).parent('.menu-item-has-children');
                $(this).toggleClass('active');
                current
                    .siblings()
                    .find('.sub-toggle')
                    .removeClass('active');
                current.children('.sub-menu').slideToggle(350);
                current
                    .siblings()
                    .find('.sub-menu')
                    .slideUp(350);
            }
        );
    });

})(jQuery);
