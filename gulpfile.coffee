gulp = require 'gulp'
jade = require 'gulp-jade'
runSequence = require 'run-sequence'
inject = require 'gulp-inject'
coffee = require 'gulp-coffee'

gulp.task 'jade', ->
	gulp.src './dev/client/html/**/*.jade'
		.pipe jade {}
		.pipe gulp.dest './prod/client/html/'

gulp.task 'injectJsDev', ->
	target = gulp.src './prod/client/html/index.html'
	sources = gulp.src './prod/client/js/**/*.js', read: false

	target.pipe inject sources, ignorePath: '/prod/client'
		.pipe gulp.dest './prod/client/html'

gulp.task 'coffee', ->
	gulp.src './dev/**/*.coffee'
		.pipe coffee(bare: true).on 'error', console.log
		.pipe gulp.dest './prod/'

gulp.task 'default', ->
	runSequence 'coffee', 'jade', 'injectJsDev'