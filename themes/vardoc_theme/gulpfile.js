let gulp = require('gulp'),
  sass = require('gulp-sass'),
  postcss = require('gulp-postcss'),
  csscomb = require('gulp-csscomb'),
  autoprefixer = require('autoprefixer'),
  browserSync = require('browser-sync').create()

const paths = {
  scss: {
    src: 'scss/**/*/*.scss',
    dest: 'css',
    watch: 'scss/**/*/*.scss'
  },
  js: {
    bootstrap: {
      alert: './node_modules/bootstrap/js/dist/alert.js',
      button: './node_modules/bootstrap/js/dist/button.js',
      carousel: './node_modules/bootstrap/js/dist/carousel.js',
      collapse: './node_modules/bootstrap/js/dist/collapse.js',
      dropdown: './node_modules/bootstrap/js/dist/dropdown.js',
      modal: './node_modules/bootstrap/js/dist/modal.js',
      popover: './node_modules/bootstrap/js/dist/popover.js',
      scrollspy: './node_modules/bootstrap/js/dist/scrollspy.js',
      tab: './node_modules/bootstrap/js/dist/tab.js',
      toast: './node_modules/bootstrap/js/dist/toast.js',
      tooltip: './node_modules/bootstrap/js/dist/tooltip.js',
      util: './node_modules/bootstrap/js/dist/util.js',
      full_bootstrap: './node_modules/bootstrap/dist/js/bootstrap.min.js'
    },
    bootstrap_dest: './js/bootstrap',
    popper: './node_modules/popper.js/dist/umd/popper.min.js',
    popper_dest: './js/popper'
  }
}

// Compile sass into CSS & auto-inject into browsers
function compile () {
  var sassOptions = {
    outputStyle: 'expanded',
    indentType: 'space',
    indentWidth: 2,
    linefeed: 'lf'
  };

  return gulp.src([paths.scss.src])
    .pipe(sass(sassOptions).on('error', sass.logError))
    .pipe(postcss([autoprefixer({
      browsers: [
        'Chrome >= 35',
        'Firefox >= 38',
        'Edge >= 12',
        'Explorer >= 10',
        'iOS >= 8',
        'Safari >= 8',
        'Android 2.3',
        'Android >= 4',
        'Opera >= 12']
    })]))
    .pipe(csscomb())
    .pipe(gulp.dest(paths.scss.dest))
    .pipe(browserSync.stream())
}

// Move the Bootstrap JavaScript files into our js/bootstrap folder.
function move_bootstrap_js_files () {
  return gulp.src([
        paths.js.bootstrap.alert,
        paths.js.bootstrap.button,
        paths.js.bootstrap.carousel,
        paths.js.bootstrap.collapse,
        paths.js.bootstrap.dropdown,
        paths.js.bootstrap.modal,
        paths.js.bootstrap.popover,
        paths.js.bootstrap.scrollspy,
        paths.js.bootstrap.tab,
        paths.js.bootstrap.toast,
        paths.js.bootstrap.tooltip,
        paths.js.bootstrap.util,
        paths.js.bootstrap.full_bootstrap
     ])
    .pipe(gulp.dest(paths.js.bootstrap_dest))
    .pipe(browserSync.stream())
}

// Move the Popper JavaScript files into our js/popper folder.
function move_popper_js_files () {
  return gulp.src([paths.js.popper])
    .pipe(gulp.dest(paths.js.popper_dest))
    .pipe(browserSync.stream())
}

// Watching scss files
function watch () {
  gulp.watch([paths.scss.watch], compile)
}

const build = gulp.series(compile, move_bootstrap_js_files, move_popper_js_files, gulp.parallel(watch))

exports.compile = compile
exports.move_bootstrap_js_files = move_bootstrap_js_files
exports.move_popper_js_files = move_popper_js_files
exports.watch = watch

exports.default = build
