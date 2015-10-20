gulp = require 'gulp'
jade = require 'gulp-jade'
runSequence = require 'run-sequence'
inject = require 'gulp-inject'
coffee = require 'gulp-coffee'
series = require 'stream-series'

gulp.task 'jade', ->
	gulp.src './dev/client/html/**/*.jade'
		.pipe jade {}
		.pipe gulp.dest './prod/client/html/'

gulp.task 'injectJsDev', ->
	target = gulp.src './prod/client/html/index.html'
	appJs = gulp.src './prod/client/js/**/*.js', read: false
	libJs = gulp.src './bower_components/angular/angular.js', read: false

	target.pipe inject series(libJs, appJs), ignorePath: '/prod/client'
		.pipe gulp.dest './prod/client/html'

gulp.task 'coffee', ->
	gulp.src './dev/**/*.coffee'
		.pipe coffee(bare: true).on 'error', console.log
		.pipe gulp.dest './prod/'

gulp.task 'default', ->
	runSequence 'coffee', 'jade', 'injectJsDev'