PORT = process.env.PORT or 3058

express = require 'express'

app = express()

app.get '/*', (req, res, next) ->
	options =
		root: __dirname + '/../client/html/'

	res.sendFile 'index.html', options, (err) ->
		return next(err) if err

app.listen PORT, ->
	console.log 'Web server running on port', PORT