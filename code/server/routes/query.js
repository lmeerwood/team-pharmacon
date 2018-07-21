var express = require('express')
var router = express.Router()
var model = require('../models')

const isAuthenticated = require('../policies/isAuthenticated')

router.get('/', function (req, res, next) {
  model.sequelize
    .authenticate()
    .then(() => {
      res.send(JSON.stringify({
        'status': 200,
        'server': 'alive',
        'database': 'connected'
      }))
    })
    .catch(err => {
      console.log(err)
      res.send(JSON.stringify({
        'status': 500,
        'server': 'alive',
        'database': 'disconnected'
      }))
    })
})

// The error update route. The get is for retrieving details for a specific error and the post is for updating details
router.get('/error/:id', isAuthenticated, function (req, res) {
  model.error.find({
    where: {
      id: req.params.id
    }
  }).then(function (qres) {
    res.send(qres)
  })
})

router.post('/error/:id', function (req, res, next) {
  /**
   * As with the create error, some details may have to be created.
   * This function checks to see if it exists first, and if not, creates it.
   */
  async function updateError (req, res, next) {
    // Check if the patient already exist.
    var patient = await model.patient.findOrCreate({
      where: {
        patientHospitalId: req.body.patientId
      },
      // create new patient
      defaults: {
        patientFirstName: req.body.patientFirstName,
        patientSurname: req.body.patientSurname,
        patienttypeId: req.body.patientType
      }
    })
      .spread((patient, created) => {
        return patient
      })

    var patientid = patient.id
    console.log(patientid)

    // Check if the medication already exist.
    var medication = await model.medication.findOrCreate({
      where: {
        medicationName: req.body.medicationName,
        medicationtypeId: req.body.medicationtypeId
      },
      // create new medication
      defaults: {
        medicationName: req.body.medication
      }
    })
      .spread((medication, created) => {
        return medication
      })

    // Check if the physician already exist.
    var physician = await model.physician.findOrCreate({
      where: {
        providerNumber: req.body.providerNumber
      },
      // create new physician
      defaults: {
        physicianSurname: req.body.physicianSurname,
        physicianFirstName: req.body.physicianFirstName
      }
    })
      .spread((physician, created) => {
        return physician
      })

    // Now that the relating entries in other tables exist, make the error

    model.error.update({
      errorDate: req.body.errorDate,
      errorTime: req.body.errorTime,
      locationId: req.body.locationId,
      wasWorkerNotified: req.body.wasWorkerNotified,
      wasPhysicianNotified: req.body.wasPhysicianNotified,
      iimsCompleted: req.body.iimsCompleted,
      generalComment: req.body.generalComment,
      errortypeId: req.body.errortypeId,
      severityId: req.body.severityId,
      errorCausedByWorker: req.body.errorCausedByWorker,
      medicationId: medication.id,
      patientId: patient.id,
      physicianId: physician.id
    })
      .then(() => {
        res.send('success')
      }
      )
      .catch((error) => {
        res.status(500)
        res.send('error has occurred: ' + error)
      })
  }

  updateError(req, res, next)
})

// The error route. The get is for retrieving details and the post is for adding details
router.get('/error', isAuthenticated, function (req, res) {
  model.error.findAll({
    limit: 100
  }).then(function (qres) {
    res.send(qres)
  })
})

router.post('/error', function (req, res, next) {
  /**
   * This is a longer route due to the fact we need to
   * check if the entries from linking tables are created yet.
   * If they are, we use those, if they aren't we create them.
   * Some of them will be updated with newer values.
   */
  async function addError (req, res, next) {
    // Check if the patient already exist.
    var patient = await model.patient.findOrCreate({
      where: {
        patientHospitalId: req.body.patientId
      },
      // create new patient
      defaults: {
        patientFirstName: req.body.patientFirstName,
        patientSurname: req.body.patientSurname,
        patienttypeId: req.body.patientType
      }
    })
      .spread((patient, created) => {
        return patient
      })

    var patientid = patient.id
    console.log(patientid)

    // Check if the medication already exist.
    var medication = await model.medication.findOrCreate({
      where: {
        medicationName: req.body.medicationName,
        medicationtypeId: req.body.medicationtypeId
      },
      // create new medication
      defaults: {
        medicationName: req.body.medication
      }
    })
      .spread((medication, created) => {
        return medication
      })

    // Check if the physician already exist.
    var physician = await model.physician.findOrCreate({
      where: {
        providerNumber: req.body.providerNumber
      },
      // create new physician
      defaults: {
        physicianSurname: req.body.physicianSurname,
        physicianFirstName: req.body.physicianFirstName
      }
    })
      .spread((physician, created) => {
        return physician
      })

    // Now that the relating entries in other tables exist, make the error

    model.error.create({
      errorDate: req.body.errorDate,
      errorTime: req.body.errorTime,
      locationId: req.body.locationId,
      wasWorkerNotified: req.body.wasWorkerNotified,
      wasPhysicianNotified: req.body.wasPhysicianNotified,
      iimsCompleted: req.body.iimsCompleted,
      generalComment: req.body.generalComment,
      errortypeId: req.body.errortypeId,
      severityId: req.body.severityId,
      errorCausedByWorker: req.body.errorCausedByWorker,
      medicationId: medication.id,
      patientId: patient.id,
      physicianId: physician.id
    })
      .then(() => {
        res.send('success')
      }
      )
      .catch((error) => {
        res.status(500)
        res.send('error has occurred: ' + error)
      })
  }

  addError(req, res, next)
})

// The errortype route. The get is for retrieving details and the post is for adding details
router.get('/errortype', function (req, res) {
  model.errortype.findAll({
    limit: 100
  }).then(function (qres) {
    res.send(qres)
  })
})

router.post('/errortype', function (req, res, next) {
  model.errortype.create(req.body)
    .then(function (qres) {
      res.send(qres)
    })
    .catch(function (e) {
      res.send('An error occurred while creating an error type. ' + e)
    })
})

// The patienttype route. The get is for retrieving details and the post is for adding details
router.get('/patienttype', function (req, res) {
  model.patienttype.findAll({
    limit: 100
  }).then(function (qres) {
    res.send(qres)
  })
})

router.post('/patienttype', function (req, res, next) {
  model.patienttype.create(req.body)
    .then(function (qres) {
      res.send(qres)
    })
    .catch(function (e) {
      res.send('An error occurred while creating a patient type! ' + e)
    })
})

// The worker route. The get is for retrieving details and the post is for adding details
router.get('/worker', function (req, res) {
  model.worker.findAll({
    limit: 100
  }).then(function (qres) {
    res.send(qres)
  })
})

router.post('/worker', function (req, res, next) {
  model.worker.create(req.body)
    .then(function (qres) {
      res.send(qres)
    })
    .catch(function (e) {
      res.send('An error occurred creating a new worker! ' + e)
    })
})

// The medication type route. The get is for retrieving details and the post is for adding details
router.get('/medicationtype', function (req, res) {
  model.medicationtype.findAll({
    limit: 100
  }).then(function (qres) {
    res.send(qres)
  })
})

router.post('/medicationtype', function (req, res, next) {
  model.medicationtype.create(req.body)
    .then(function (qres) {
      res.send(qres)
    })
    .catch(function (e) {
      res.send('An error occurred creating a new medication type! ' + e)
    })
})

// The medication type route. The get is for retrieving details and the post is for adding details
router.get('/locations', function (req, res) {
  model.location.findAll({
    limit: 100
  }).then(function (qres) {
    res.send(qres)
  })
})

router.post('/locations', function (req, res, next) {
  model.location.create(req.body)
    .then(function (qres) {
      res.send(qres)
    })
    .catch(function (e) {
      res.send('An error occurred creating a new location! ' + e)
    })
})

// The severity levels route. The get is for retrieving details and the post is for adding details
router.get('/severity', function (req, res) {
  model.severity.findAll({
    limit: 100
  }).then(function (qres) {
    res.send(qres)
  })
})

router.post('/severity', function (req, res, next) {
  model.severity.create(req.body)
    .then(function (qres) {
      res.send(qres)
    })
    .catch(function (e) {
      res.send('An error occurred creating a new severity level! ' + e)
    })
})

module.exports = router
