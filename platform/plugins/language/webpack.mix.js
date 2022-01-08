let mix = require('laravel-mix');

const path = require('path');
let directory = path.basename(path.resolve(__dirname));

const source = 'platform/plugins/' + directory;
const dist = 'public/vendor/core/plugins/' + directory;

mix
    .js(source + '/resources/assets/js/language.js', dist + '/js/language.js')
    .js(source + '/resources/assets/js/language-global.js', dist + '/js/language-global.js')
    .js(source + '/resources/assets/js/language-public.js', dist + '/js')

    .sass(source + '/resources/assets/sass/language.scss', dist + '/css')
    .sass(source + '/resources/assets/sass/language-public.scss', dist + '/css')

    .copyDirectory(dist + '/js', source + '/public/js')
    .copyDirectory(dist + '/css', source + '/public/css');
