let mix = require('laravel-mix');

const path = require('path');
let directory = path.basename(path.resolve(__dirname));

const source = 'platform/core/' + directory;
const dist = 'public/vendor/core/core/' + directory;

mix
    .js(source + '/resources/assets/js/table.js', dist + '/js')
    .js(source + '/resources/assets/js/filter.js', dist + '/js')
    .sass(source + '/resources/assets/sass/table.scss', dist + '/css')

    .copyDirectory(dist + '/js', source + '/public/js')
    .copyDirectory(dist + '/css', source + '/public/css');
