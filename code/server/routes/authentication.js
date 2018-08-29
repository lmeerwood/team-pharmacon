var express = require('express')
var router = express.Router()
var model = require('../models')
const jwt = require('jsonwebtoken')
const config = require('../config/config')

function jwtSignUser (user) {
  const ONE_WEEK = 60 * 60 * 24 * 7
  return jwt.sign(user, config.authentication.jwtSecret, {
    expiresIn: ONE_WEEK
  })
}

router.post('/login', function (req, res) {
  try {
    const {username, password} = req.body
    model.login.findOne({
      where: {
        username: username
      }
    }).then(function (user) {
      if (!user) {
        return res.status(401).send({
          error: 'No such user'
        })
      }

      var valid = user.comparePassword(password)
      if (!valid) {
        return res.status(401).send({
          error: 'The Password was incorrect'
        })
      }

      const userJson = user.toJSON()
      res.send({
        user: {
          'id': user.id,
          'username': user.username,
          'authlevel': user.authlevel
        },
        token: jwtSignUser(userJson)
      })
    })
  } catch (err) {
    res.status(500).send({
      error: 'An error has occured trying to log in'
    })
  }
})

// TODO: Add authentication
router.post('/login/create', function (req, res) {
  model.login.create(req.body)
    .then(function (qres) {
      res.send(qres)
    })
    .catch(function (e) {
      res.send('An error occurred creating a new login! ' + e)
    })
})

module.exports = router
