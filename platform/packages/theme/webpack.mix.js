let mix = require('laravel-mix');

const path = require('path');
let directory = path.basename(path.resolve(__dirname));

const source = 'platform/packages/' + directory;
const dist = 'public/vendor/core/packages/' + directory;

mix
    .js(source + '/resources/assets/js/custom-css.js', dist + '/js')
    .js(source + '/resources/assets/js/custom-js.js', dist + '/js')
    .js(source + '/resources/assets/js/theme-options.js', dist + '/js')
    .js(source + '/resources/assets/js/theme.js', dist + '/js')

    .sass(source + '/resources/assets/sass/custom-css.scss', dist + '/css')
    .sass(source + '/resources/assets/sass/theme-options.scss', dist + '/css')
    .sass(source + '/resources/assets/sass/admin-bar.scss', dist + '/css')

    .copyDirectory(dist + '/js', source + '/public/js')
    .copyDirectory(dist + '/css', source + '/public/css');
