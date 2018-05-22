var express = require('express')
// var path = require('path')
var bodyParser = require('body-parser')
var cors = require('cors')
// const config = require('config/config')
require('dotenv').config()
require('./passport')
var app = express()

// Set up Body Parser
app.use(bodyParser.json()) // Support json encoded bodies
app.use(bodyParser.urlencoded({ extended: true })) // Support encoded bodies

var queryRoute = require('./routes/query')
var authRoute = require('./routes/authentication')
var vue = require('./routes/vue')

// app.use('/node_modules', express.static(path.join(__dirname, 'node_modules')))

app.use(express.json())
app.use(express.urlencoded({ extended: false }))
app.use(cors())
// app.use(express.static(path.join(__dirname, 'public')));

// Define Query URL
app.use('/api/v1/query', queryRoute)
app.use('/auth', authRoute)

app.use('/static', express.static('static'))
app.use('/', vue)

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  // render the error page
  res.status(404)
  res.send('not found')
})

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message
  res.locals.error = req.app.get('env') === 'development' ? err : {}

  // render the error page
  res.status(500)
  res.send('error: ' + err.stack)
})

app.use(function (req, res, next) {
  console.warn('Time: %d', Date.now())
  next()
})

module.exports = app
