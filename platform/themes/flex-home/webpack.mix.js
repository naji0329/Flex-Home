let mix = require('laravel-mix');
const purgeCss = require('@fullhuman/postcss-purgecss');

const path = require('path');
let directory = path.basename(path.resolve(__dirname));

const source = 'platform/themes/' + directory;
const dist = 'public/themes/' + directory;

mix.js(source + '/assets/js/components.js', dist + '/js').vue({ version: 2 });

mix
    .sass(
        source + '/assets/sass/style.scss',
        dist + '/css',
        {},
        [
            purgeCss({
                content: [
                    source + '/assets/js/components/*.vue',
                    source + '/layouts/*.blade.php',
                    source + '/partials/*.blade.php',
                    source + '/partials/**/*.blade.php',
                    source + '/views/*.blade.php',
                    source + '/views/**/*.blade.php',
                    source + '/views/**/**/*.blade.php',
                    source + '/views/**/**/**/*.blade.php',
                    source + '/views/**/**/**/*.blade.php',
                    source + '/widgets/**/templates/frontend.blade.php',
                ],
                defaultExtractor: content => content.match(/[\w-/.:]+(?<!:)/g) || [],
                safelist: [
                    /^navigation-/,
                    /^label-/,
                    /^status-/,
                    /^owl-/,
                    /^fa-/,
                    /^language/,
                    /^pagination/,
                    /^page-/,
                    /show-admin-bar/,
                    /breadcrumb/,
                    /active/,
                    /header-sticky/,
                    /show/
                ],
            })
        ]
    )

    .sass(source + '/assets/sass/rtl-style.scss', dist + '/css')

    .js(source + '/assets/js/app.js', dist + '/js')
    .js(source + '/assets/js/wishlist.js', dist + '/js')
    .js(source + '/assets/js/property.js', dist + '/js')
    .js(source + '/assets/js/icons-field.js', dist + '/js')

    .copyDirectory(dist + '/css/style.css', source + '/public/css')
    .copyDirectory(dist + '/css/rtl-style.css', source + '/public/css')
    .copyDirectory(dist + '/js', source + '/public/js');
