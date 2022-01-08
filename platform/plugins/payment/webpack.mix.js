let mix = require('laravel-mix');

const path = require('path');
let directory = path.basename(path.resolve(__dirname));

const source = 'platform/plugins/' + directory;
const dist = 'public/vendor/core/plugins/' + directory;

mix
    .js(source + '/resources/assets/js/payment.js', dist + '/js/payment.js')
    .js(source + '/resources/assets/js/payment-methods.js', dist + '/js/payment-methods.js')
    .js(source + '/resources/assets/js/payment-detail.js', dist + '/js/payment-detail.js')

    .sass(source + '/resources/assets/sass/payment.scss', dist + '/css')
    .sass(source + '/resources/assets/sass/payment-methods.scss', dist + '/css')

    .copyDirectory(dist + '/js', source + '/public/js')
    .copyDirectory(dist + '/css', source + '/public/css');
