require 'coffee-script'
sourcemaps=require 'gulp-sourcemaps'
coffee=require 'gulp-coffee'
plumber=require 'gulp-plumber'
del=require 'del'
gulp=require 'gulp'

gulp.task 'start',->
gulp.task 'debug init',['clean','coffee']
gulp.task 'clean',->
   del.sync(['.comp/**/*.js','.comp/**/*.map'])

gulp.task 'coffee',->
   gulp.src(['src/**/*.coffee'])
   .pipe(plumber())
   .pipe(sourcemaps.init())
   .pipe(coffee(bare:true))
   .pipe(sourcemaps.write('.',sourceRoot:'../../src'))
   .pipe(gulp.dest('.comp/src/'))
   gulp.src(['test/**/*.coffee'])
   .pipe(plumber())
   .pipe(sourcemaps.init())
   .pipe(coffee(bare:true))
   .pipe(sourcemaps.write('.',sourceRoot:'../../test'))
   .pipe(gulp.dest('.comp/test/'))

