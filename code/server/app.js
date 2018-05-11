var express = require('express')
// var path = require('path')
var mysql = require('mysql')
var bodyParser = require('body-parser')

var app = express()

// Set up Body Parser
app.use(bodyParser.json()) // Support json encoded bodies
app.use(bodyParser.urlencoded({ extended: true })) // Support encoded bodies

var queryRoute = require('./routes/query')

// app.use('/node_modules', express.static(path.join(__dirname, 'node_modules')))

app.use(express.json())
app.use(express.urlencoded({ extended: false }))
// app.use(express.static(path.join(__dirname, 'public')));

// MySQL setup
app.use(function (req, res, next) {
  res.locals.connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'password',
    database: 'petdatabase'
  })
  res.locals.connection.connect(function (err) {
    if (err) {
      console.log(err)
    } else {
      console.log('Successfully connected to database')
    }
  })
  next()
})

// Define Query URL
app.use('/api/v1/query', queryRoute)

// View Engine
app.set('view engine', 'pug')

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
