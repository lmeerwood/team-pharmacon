var express = require('express')
var router = express.Router()
var path = require('path')

// The only route this program has.
router.get('/', function (req, res) {
  res.sendFile(path.join(__dirname, '/../index.html'))
})

module.exports = router
