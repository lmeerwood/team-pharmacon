var express = require('express')
var router = express.Router()
var model = require('../models')
const jwt = require('jsonwebtoken')
const config = require('../config/config')
const passport = require('passport')

function jwtSignUser (user) {
  const ONE_WEEK = 60 * 60 * 24 * 7
  return jwt.sign(user, config.authentication.jwtSecret, {
    expiresIn: ONE_WEEK
  })
}

router.post('/login', function (req, res) {
  passport.authenticate('local', {session: false}, (err, user, info) => {
    if (err || !user) {
      return res.status(400).json({
        message: 'Something is not right',
        user: user
      })
    }

    req.login(user, {session: false}, (err) => {
      if (err) {
        res.send(err)
      }

      const token = jwtSignUser(user)
      return res.json({user, token})
    })
  })(req, res)
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

// The search Users route.
router.get('/user', passport.authenticate('jwt', {session: false}), function (req, res) {
  model.login.findAll({
    limit: 100
  }).then(function (qres) {
    res.send(qres)
  })
})

// The Delete User update route.

router.delete('/user/:id', passport.authenticate('jwtAdmin', {session: false}),
  function (req, res, next) {
    async function deleteUser (req, res, next) {
      model.login.destroy({ where: {
        id: req.params.id }
      })
        .then(() => {
          res.send('Deleted user')
        })
        .catch((error) => {
          res.status(500)
          res.send('Error has occurred: ' + error)
        })
    }
    console.log('Deleting user' + req.params.id)
    deleteUser(req, res, next)
  })

module.exports = router
