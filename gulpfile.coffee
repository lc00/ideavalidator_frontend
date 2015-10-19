gulp = require 'gulp'
jade = require 'gulp-jade'
runSequence = require 'run-sequence'
inject = require 'gulp-inject'

gulp.task 'jade', ->
	gulp.src './dev/client/html/**/*.jade'
		.pipe jade {}
		.pipe gulp.dest './prod/client/html/'

gulp.task 'injectJsDev', ->
	target = gulp.src './prod/client/html/index.html'
	sources = gulp.src './prod/client/js/**/*.js', read: false

	target.pipe inject sources, ignorePath: '/prod/client'
		.pipe gulp.dest './prod/client/html'

gulp.task 'default', ->
	runSequence 'jade', 'injectJsDev'