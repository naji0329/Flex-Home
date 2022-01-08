let mix = require('laravel-mix');
let glob = require('glob');

const path = require('path');
let directory = path.basename(path.resolve(__dirname));

const source = 'platform/core/' + directory;
const dist = 'public/vendor/core/core/' + directory;

glob.sync(source + '/resources/assets/sass/base/themes/*.scss').forEach(item => {
    mix.sass(item, dist + '/css/themes');
});

mix
    .sass(source + '/resources/assets/sass/core.scss', dist + '/css')
    .sass(source + '/resources/assets/sass/custom/system-info.scss', dist + '/css')
    .sass(source + '/resources/assets/sass/custom/email.scss', dist + '/css')
    .sass(source + '/resources/assets/sass/custom/error-pages.scss', dist + '/css')
    .sass(source + '/resources/assets/sass/rtl.scss', dist + '/css')
    .sass(source + '/resources/assets/sass/tree-category.scss', dist + '/css')

    .js(source + '/resources/assets/js/app.js', dist + '/js')
    .js(source + '/resources/assets/js/core.js', dist + '/js')
    .js(source + '/resources/assets/js/editor.js', dist + '/js')
    .js(source + '/resources/assets/js/cache.js', dist + '/js')
    .js(source + '/resources/assets/js/tags.js', dist + '/js')
    .js(source + '/resources/assets/js/system-info.js', dist + '/js')
    .js(source + '/resources/assets/js/repeater-field.js', dist + '/js')
    .js(source + '/resources/assets/js/tree-category.js', dist + '/js')
    .vue()

    .copyDirectory(dist + '/css', source + '/public/css')
    .copyDirectory(dist + '/js', source + '/public/js');

