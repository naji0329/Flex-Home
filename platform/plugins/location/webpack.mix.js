let mix = require('laravel-mix');

const path = require('path');
let directory = path.basename(path.resolve(__dirname));

const source = 'platform/plugins/' + directory;
const dist = 'public/vendor/core/plugins/' + directory;

mix
    .js(source + '/resources/assets/js/location.js', dist + '/js')
    .js(source + '/resources/assets/js/bulk-import.js', dist + '/js')
    .copyDirectory(dist + '/js', source + '/public/js');
