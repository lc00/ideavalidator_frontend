gulp = require 'gulp'

gulp.task 'hello', ->
	console.log 'Hello world task called'

gulp.task 'default', ->
	console.log 'default task called'