const passport = require('passport')

module.exports = function (req, res, next) {
  passport.authenticate('jwt', function (err, user) {
    if (err || !user) {
      // res.status(403).send({
      //   error: 'you do not have access to this resource'
      // })
      next()
    } else {
      // req.user = user
      next()
    }
  })(req, res, next)
}
