'use strict';

let handleRecentlyViewedProperties = function () {
    let cookieName = window.currentLanguage + '_recently_viewed_properties';
    let propertyId = $('div[data-property-id]').data('property-id');
    let recentPropertyCookies = decodeURIComponent(getCookie(cookieName));

    let arrList = [];
    if (recentPropertyCookies != null && recentPropertyCookies != undefined && recentPropertyCookies.length > 0)
        arrList = JSON.parse(getCookie(cookieName));

    if (propertyId != null && propertyId != 0 && propertyId != undefined) {
        let item = {id: propertyId};
        if (recentPropertyCookies == undefined || recentPropertyCookies == null || recentPropertyCookies == '') {
            arrList.push(item);

            setCookie(cookieName, JSON.stringify(arrList), 60);
        } else {
            arrList = JSON.parse(recentPropertyCookies);
            var index = arrList.map(function (e) {
                return e.id;
            }).indexOf(item.id);

            if (index === -1) {
                if (arrList.length >= 20)
                    arrList.shift();

                arrList.push(item);
                clearCookies(cookieName);
                setCookie(cookieName, JSON.stringify(arrList), 60);
            } else {
                arrList.splice(index, 1);
                arrList.push(item);

                clearCookies(cookieName);
                setCookie(cookieName, JSON.stringify(arrList), 60);
            }
        }
    }

    function setCookie(cname, cvalue, exdays) {
        var d = new Date();
        var url = new URL(window.siteUrl);
        d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
        var expires = 'expires=' + d.toUTCString();
        document.cookie = cname + '=' + cvalue + "; " + expires + '; path=/' + '; domain=' + url.hostname;
    }

    function getCookie(cname) {
        var name = cname + "=";
        var ca = document.cookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') {
                c = c.substring(1);
            }
            if (c.indexOf(name) == 0) {
                return c.substring(name.length, c.length);
            }
        }
        return '';
    }

    function clearCookies(name) {
        var url = new URL(window.siteUrl);
        document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT; path=/' + '; domain=' + url.hostname;
    }
}

handleRecentlyViewedProperties();
