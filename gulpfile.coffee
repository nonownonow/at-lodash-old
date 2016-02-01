require 'cosffee-script'
gulp=require 'gulp'

gulp.task 'start',->
	console.log 'wow gulpss'
	require('./.comp/src/index.js').call @