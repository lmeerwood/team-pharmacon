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

// The error route. The get is for retrieving details and the post is for adding details
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
  var errorType = req.body.errorType
  var patientFirstName = req.body.patientFirstName
  var patientSurame = req.body.patientSurame
  var patientMRN = req.body.patientMRN
  var patientType = req.body.patientType
  var errorlocation = req.body.errorlocation
  var medication = req.body.medication
  var medicationType = req.body.medicationType
  var workerAtFault = req.body.workerAtFault
  var workerNotified = req.body.workerNotified
  var physicianNotified = req.body.physicianNotified
  var physicianFirstName = req.body.patientFirstName
  var physicianSurname = req.body.physicianSurname
  var iimsCompleted = req.body.iimsCompleted
  var comment = req.body.comment
  var severity = req.body.severity

  var query = `INSERT INTO \`petdatabase\`.\`error\` 
  (errorDate, errorTime, errorTypeId, errorDetectedLocation, errorCausedByWorker, wasWorkerNotified,
  wasPhysicianNotified, iimsCompleted, generalComment, severityId) 
  VALUES (
   '${date}',
   '${time}',
   '${errorType}',
   '${errorlocation}',
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

  var queryPatient = `INSERT INTO \`petdatabase\`.\`patient\` 
  (patientHospitalId, patientSurname, patientFirstName, patientType) 
  VALUES (
   '${patientMRN}',
   '${patientSurame}',
   '${patientFirstName}',
   '${patientType}'
  );`

  res.locals.connection.query(queryPatient, function (error, results) {
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
