var express = require('express')
var router = express.Router()
var model = require('../models')

const isAuthenticated = require('../policies/isAuthenticated')

router.get('/', function (req, res, next) {
  model.sequelize
    .authenticate()
    .then(() => {
      res.send(JSON.stringify({
        'status': 200,
        'server': 'alive',
        'database': 'connected'
      }))
    })
    .catch(err => {
      console.log(err)
      res.send(JSON.stringify({
        'status': 500,
        'server': 'alive',
        'database': 'disconnected'
      }))
    })
})

// The error route. The get is for retrieving details and the post is for adding details
router.get('/error', isAuthenticated, function (req, res) {
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

// The errortype route. The get is for retrieving details and the post is for adding details
router.get('/errortype', function (req, res) {
  model.errortype.findAll({
    limit: 100
  }).then(function (errors) {
    res.send(errors)
  })
})

router.post('/errortype', function (req, res, next) {
  model.errortype.create(req.body)
    .then(function (errors) {
      res.send(errors)
    })
    .catch(function (e) {
      res.send('Ruh-roh!')
    })
})

// The patienttype route. The get is for retrieving details and the post is for adding details
router.get('/patienttype', function (req, res) {
  model.patienttype.findAll({
    limit: 100
  }).then(function (errors) {
    res.send(errors)
  })
})

router.post('/patienttype', function (req, res, next) {
  model.patienttype.create(req.body)
    .then(function (errors) {
      res.send(errors)
    })
    .catch(function (e) {
      res.send('Ruh-roh!')
    })
})

module.exports = router
