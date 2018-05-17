var express = require('express')
// var mysql = require('mysql')
var router = express.Router()

router.get('/', function (req, res, next) {
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

// The physician route. The get is for retrieving details and the post is for adding details
router.get('/error', function (req, res, next) {
  res.locals.connection.query('SELECT * from `petdatabase`.`error`;', function (error, results) {
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

router.post('/error', function (req, res, next) {
  var date = req.body.date
  var time = req.body.time
  var type = req.body.type
  var location = req.body.location
  var workerAtFault = req.body.worker
  var workerNotified = req.body.workerNotified
  var physicianNotified = req.body.physicianNotified
  var iimsCompleted = req.body.iimsCompleted
  var comment = req.body.comment
  var severity = req.body.severity

  var query = `INSERT INTO \`petdatabase\`.\`error\` 
  (errorDate, errorTime, errorTypeId, errorDetectedLocation, errorCausedByWorker, wasWorkerNotified,
  wasPhysicianNotified, iimsCompleted, generalComment, severityId) 
  VALUES (
   '${date}',
   '${time}',
   '${type}',
   '${location}',
   '${workerAtFault}',
   '${workerNotified}',
   '${physicianNotified}', 
   '${iimsCompleted}', 
   '${comment}', 
   '${severity}'
   );`

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

module.exports = router
