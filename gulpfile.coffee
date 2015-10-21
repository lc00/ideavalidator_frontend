gulp = require 'gulp'
jade = require 'gulp-jade'
runSequence = require 'run-sequence'
inject = require 'gulp-inject'
coffee = require 'gulp-coffee'
series = require 'stream-series'

bowerLibraries = [
	'./bower_components/angular/angular.js', 
	'./bower_components/bootstrap/dist/css/bootstrap.css',
	'./bower_components/angular-route/angular-route.js'
]

appFiles = [
	'./prod/client/js/**/*.js',
	'./prod/client/css/**/*.css'
]

gulp.task 'jade', ->
	gulp.src './dev/client/**/*.jade'
		.pipe jade {}
		.pipe gulp.dest './prod/client/'

gulp.task 'inject', ->
	target = gulp.src './prod/client/html/index.html'
	app = gulp.src appFiles, read: false

	lib = gulp.src bowerLibraries, read: false

	target.pipe inject series(lib, app), ignorePath: '/prod/client'
		.pipe gulp.dest './prod/client/html'

gulp.task 'coffee', ->
	gulp.src './dev/**/*.coffee'
		.pipe coffee(bare: true).on 'error', console.log
		.pipe gulp.dest './prod/'

gulp.task 'default', ->
	runSequence 'coffee', 'jade', 'inject'