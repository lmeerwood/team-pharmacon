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

module.exports = router
