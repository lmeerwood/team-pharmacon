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
  res.locals.connection.query('SELECT * from `tempPETdb`.`errorForm`;', function (error, results) {
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
  var formDate = req.body.formDate
  var formTime = req.body.formTime
  var formPatientFirstName = req.body.formPatientFirstName
  var formPatientSurname = req.body.formPatientSurname
  var formPatientId = req.body.formPatientId
  var formPatientType = req.body.formPatientType
  var formErrorType = req.body.formErrorType
  var formErrorComment = req.body.formErrorComment
  var formWorkerAtFault = req.body.formWorkerAtFault
  var formWorkerNotified = req.body.formWorkerNotified
  var formErrorLocation = req.body.formErrorLocation
  var formIimsCompleted = req.body.formIimsCompleted
  var formMedication = req.body.formMedication
  var formSeverity = req.body.formSeverity
  var formPhysicianNotified = req.body.formPhysicianNotified
  var formPhysicianFirstName = req.body.formPatientFirstName
  var formPhysicianSurname = req.body.formPhysicianSurname
  var formProviderNumber = req.body.formProviderNumber
  var formPhysicianComment = req.body.formPhysicianComment
  var formDiagnosis = req.body.formDiagnosis

  var query = `INSERT INTO \`tempPETdb\`.\`errorForm\` 
  (date, time, patientFirstName, patientSurname, patientId, patientType, errorType, errorComment, workerAtFault, workerNotified,
    location, iimsCompleted, medication, severity, physicianNotified, physicianFirstName, physicianSurname, providerNumber,
    physicianComments, dianosis) 
  VALUES (
   '${formDate}',
   '${formTime}',
   '${formPatientFirstName}',
   '${formPatientSurname}',
   '${formPatientId}',
   '${formPatientType}',
   '${formErrorType}',
   '${formErrorComment}',
   '${formWorkerAtFault}',
   '${formWorkerNotified}',
   '${formErrorLocation}', 
   '${formIimsCompleted}',
   '${formMedication}',
   '${formSeverity}',
   '${formPhysicianNotified}',
   '${formPhysicianFirstName}',
   '${formPhysicianSurname}',
   '${formProviderNumber}',
   '${formPhysicianComment}',
   '${formDiagnosis}'
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
