const passport = require('passport')

module.exports = function (req, res, next) {
  passport.authenticate('jwt', function (err, user) {
    if (err || !user) {
      res.status(401).send({
        error: 'You must be logged in to access this resource'
      })
    } else if (err || user.authlevel !== 2) {
      res.status(403).send({
        error: 'You don\'t have sufficient permission to view this resource'
      })
    } else {
      req.user = user
      next()
    }
  })(req, res, next)
}
