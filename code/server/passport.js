const passport = require('passport')

const model = require('./models')

const LocalStrategy = require('passport-local').Strategy
const JwtStrategy = require('passport-jwt').Strategy
const ExtractJwt = require('passport-jwt').ExtractJwt

const config = require('./config/config')

passport.use(
  new LocalStrategy({
    usernameField: 'username',
    passwordField: 'password'
  },
  function (username, password, cb) {
    return model.login.findOne({
      where: {
        username: username, 
        password: password
      }
    })
      .then(user => {
        if (!user) {
          return cb(null, false, {message: 'Incorrect email or password'})
        }
        var userParsed =  {
          username: user.username,
          authlevel: user.authlevel
        }
        return cb(null, userParsed, {message: 'Logged in successfully'})
      })
      .catch(err => {
        cb(err)
      })
  })
)

var jwtStrat = new JwtStrategy({
  jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
  secretOrKey: config.authentication.jwtSecret
},
function (jwtPayload, cb) {
  // find the user in db
  return model.login.findOne({
    where: {
      username: jwtPayload.username
    }
  })
    .then(user => {
      return cb(null, user)
    })
    .catch(err => {
      return cb(err)
    })
})

passport.use(
  jwtStrat
)

var jwtStratAdmin = new JwtStrategy({
  jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
  secretOrKey: config.authentication.jwtSecret
},
function (jwtPayload, cb) {
  // find the user in db
  return model.login.findOne({
    where: {
      username: jwtPayload.username
    }
  })
    .then(user => {
      if(user.authlevel !== 2) {
        return cb(null, false, { message: 'Not authorized for this resource'})
      }
      return cb(null, user)
    })
    .catch(err => {
      return cb(err)
    })
})

jwtStratAdmin.name = 'jwtAdmin'

passport.use(
  jwtStratAdmin
)