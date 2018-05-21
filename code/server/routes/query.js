var express = require('express')
var router = express.Router()
var model = require('../models')

const isAuthenticated = require('../policies/isAuthenticated')

router.get('/', isAuthenticated, function (req, res, next) {
  res.send(JSON.stringify({
    'status': 200,
    'works': 'yes'
  }))
})

// The physician route. The get is for retrieving details and the post is for adding details
router.get('/physician', function (req, res, next) {
  res.locals.connection.query('SELECT * from `petdatabase`.`physician`;', function (error, results) {
    if (error) {
      res.status(500)
      res.send(JSON.stringify({
        'status': 500,
        'error': error.stack,
        'response': null
      }))
    } else {
      res.send(JSON.stringify({
        'status': 200,
        'error': null,
        'response': results
      }))
    }
  })
})

router.post('/physician', function (req, res, next) {
  var name = req.body.name
  var number = req.body.number
  var comment = req.body.comment

  var query = 'INSERT INTO `petdatabase`.`physician` (physicianName, providerNumber, physicianComment)' +
    ` VALUES ('${name}', '${number}', '${comment}');`

  console.log(query)

  res.locals.connection.query(query, function (error, results) {
    if (error) {
      res.status(500)
      res.send(JSON.stringify({
        'status': 500,
        'error': error.stack,
        'response': null
      }))
    } else {
      res.send(JSON.stringify({
        'status': 200,
        'error': null,
        'response': results
      }))
    }
  })
})

// The error route. The get is for retrieving details and the post is for adding details
router.get('/error', function (req, res) {
  model.errorForm.findAll({
    limit: 100
  }).then(function (errors) {
    res.send(errors)
  })
})

router.post('/error', function (req, res, next) {
  model.errorForm.create(req.body)
    .then(function (errors) {
      res.send(errors)
    })
    .catch(function (e) {
      res.send('Ruh-roh!')
    })
})

module.exports = router
