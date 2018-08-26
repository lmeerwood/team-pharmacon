var express = require('express')
var router = express.Router()
var model = require('../models')

const isAuthenticated = require('../policies/isAuthenticated')
const { check, validationResult } = require('express-validator/check')
const { sanitize } = require('express-validator/filter')

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

// The worker update route. The get is for retrieving details for a specific worker and the post is for updating details
router.get('/worker/:id', isAuthenticated, function (req, res) {
  const errors = validationResult(req)
  if (!errors.isEmpty()) {
    return res.status(422).json({ errors: errors.array() })
  }
  console.log('User id: ' + req.params.id)
  model.worker.find({
    where: {
      id: req.params.id
    }
  }).then(function (qres) {
    res.send(qres)
  })
})

// Check to see if the worker exists - returns true if worker ID exists, false otherwise
router.get('/worker/isvalid/:id', isAuthenticated, function (req, res) {
  model.worker.find({
    where: {
      id: req.params.id
    }
  }).then(function (qres) {
    res.send(qres !== null)
  })
})

router.post(
  '/worker/:id',
  isAuthenticated,
  // Input validation
  check('workerFirstName').not().isEmpty(),
  check('workerSurname').not().isEmpty(),
  check('workerRole').not().isEmpty(),
  sanitize('workerActive').toInt(),
  check('workerActive').custom(value => {
    if (value !== 0 && value !== 1) {
      throw new Error('workerActive must be 1 or 0')
    }
    return true
  }),
  function (req, res, next) {
    const errors = validationResult(req)
    if (!errors.isEmpty()) {
      return res.status(422).json({ errors: errors.array() })
    }
    async function updateWorker (req, res, next) {
      var workerId = req.params.id
      var values = {
        id: workerId,
        workerFirstName: req.body.workerFirstName,
        workerSurname: req.body.workerSurname,
        WorkerRole: req.body.workerRole,
        workerActive: req.body.workerActive
      }
      var selector = {
        where: { id: workerId }
      }
      model.worker.update(values, selector)
        .then(() => {
          res.send('Updated')
        })
        .catch((error) => {
          res.status(500)
          res.send('error has occurred: ' + error)
        })
    }

    updateWorker(req, res, next)
  })

// The worker route. The get is for retrieving details and the post is for adding details
router.get('/worker', isAuthenticated, function (req, res) {
  model.worker.findAll({
    limit: 100
  }).then(function (qres) {
    res.send(qres)
  })
})

router.post(
  '/worker',
  isAuthenticated,
  // Input validation
  check('workerFirstName').not().isEmpty(),
  check('workerSurname').not().isEmpty(),
  check('workerRole').not().isEmpty(),
  sanitize('workerActive').toInt(),
  check('workerActive').custom(value => {
    if (value !== 0 && value !== 1) {
      throw new Error('workerActive must be 1 or 0')
    }
    return true
  }),
  function (req, res, next) {
    async function addWorker (req, res, next) {
      model.worker.create({
        id: req.body.id,
        workerFirstName: req.body.workerFirstName,
        workerSurname: req.body.workerSurname,
        WorkerRole: req.body.WorkerRole,
        workerActive: req.body.workerActive
      })
        .then(() => {
          res.send('success')
        })
        .catch((error) => {
          res.status(500)
          res.send('An error occurred while creating an worker type: ' + error)
        })
    }

    addWorker(req, res, next)
  })

// The error update route. The get is for retrieving details for a specific error and the post is for updating details
router.get('/error/:id', isAuthenticated, function (req, res) {
  model.error.find({
    where: {
      id: req.params.id
    },
    include: [
      // model.diagnosis,
      model.errortype,
      model.location,
      model.medication,
      // model.medicationtype,
      model.patient,
      // model.patienttype,
      model.physician,
      model.severity,
      model.worker
    ]
  }).then(function (qres) {
    res.send(qres)
  })
})

router.post(
  '/error/:id',
  isAuthenticated,
  // Input validation
  check('patientId').not().isEmpty(),
  check('patientFirstName').not().isEmpty(),
  check('patientSurname').not().isEmpty(),
  check('patientType').not().isEmpty(),

  check('medicationName').not().isEmpty(),
  check('medicationtypeId').not().isEmpty(),
  check('medication').not().isEmpty(),
  function (req, res, next) {
  /**
   * As with the create error, some details may have to be created.
   * This function checks to see if it exists first, and if not, creates it.
   */
    async function updateError (req, res, next) {
    // Check if the patient already exist.
      await model.patient.upsert({
        patientHospitalId: req.body.patientId,
        patientFirstName: req.body.patientFirstName,
        patientSurname: req.body.patientSurname,
        patienttypeId: req.body.patientType
      })

      var patient = await model.patient.find({
        where: {
          patientHospitalId: req.body.patientId
        }
      })

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

      var medicationId = medication.id
      console.log(medicationId)

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

      var physicianId = physician.id
      console.log(physicianId)

      // Now that the relating entries in other tables exist, make the error

      var errorId = req.params.id
      var values = {
        errorDate: req.body.errorDate,
        errorTime: req.body.errorTime,
        wasWorkerNotified: req.body.wasWorkerNotified,
        wasPhysicianNotified: req.body.wasPhysicianNotified,
        iimsCompleted: req.body.iimsCompleted,
        generalComment: req.body.generalComment,
        errortypeId: req.body.errortypeId,
        severityId: req.body.severityId,
        medicationId: medicationId,
        physicianId: physicianId,
        patientId: patient.id,
        locationId: req.body.locationId,
        errorCausedByWorker: req.body.errorCausedByWorker
      }
      var selector = {
        where: { id: errorId }
      }

      model.error.update(values, selector)
        .then(() => {
          res.send('Updated')
        })
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
    include: [
      model.patient,
      model.medication,
      model.physician
    ]
  }).then(function (qres) {
    res.send(qres)
  })
})

router.post('/error',
  isAuthenticated,

  check('patientId').not().isEmpty(),
  check('patientFirstName').not().isEmpty(),
  check('patientSurname').not().isEmpty(),
  check('patientType').not().isEmpty(),

  check('medicationName').not().isEmpty(),
  check('medicationtypeId').not().isEmpty(),
  check('medication').not().isEmpty(),

  function (req, res, next) {
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
router.get('/errortype', isAuthenticated, function (req, res) {
  model.errortype.findAll({
    limit: 100
  }).then(function (qres) {
    res.send(qres)
  })
})

router.post('/errortype',
  isAuthenticated,
  check('errorType').not().isEmpty(),
  function (req, res, next) {
    model.errortype.create(req.body)
      .then(function (qres) {
        res.send(qres)
      })
      .catch(function (e) {
        res.send('An error occurred while creating an error type. ' + e)
      })
  })

// The worker route. The get is for retrieving details and the post is for adding details
router.get('/worker', isAuthenticated, function (req, res) {
  model.worker.findAll({
    limit: 100
  }).then(function (qres) {
    res.send(qres)
  })
})

// The locations route. The get is for retrieving details and the post is for adding details
router.get('/locations', isAuthenticated, function (req, res) {
  model.location.findAll({
    limit: 100
  }).then(function (qres) {
    res.send(qres)
  })
})

router.post('/locations',
  isAuthenticated,
  check('location').not().isEmpty(),
  function (req, res, next) {
    model.location.create(req.body)
      .then(function (qres) {
        res.send(qres)
      })
      .catch(function (e) {
        res.send('An error occurred creating a new location! ' + e)
      })
  })

// The severity levels route. The get is for retrieving details and the post is for adding details
router.get('/severity', isAuthenticated, function (req, res) {
  model.severity.findAll({
    limit: 100
  }).then(function (qres) {
    res.send(qres)
  })
})

router.post('/severity',
  isAuthenticated,
  check('severity').not().isEmpty(),
  function (req, res, next) {
    model.severity.create(req.body)
      .then(function (qres) {
        res.send(qres)
      })
      .catch(function (e) {
        res.send('An error occurred creating a new severity level! ' + e)
      })
  })

// ChangePassword post function
router.post('/changePassword', function (req, res, next) {
  model.login.findOne({
    where: {
      email: req.body.email
    }
  }).then(user => {
    console.log('we are now in the then function')
    if (!user) {
      return res.status(403).send({
        error: 'The login information was incorrect'
      })
    }
    console.log('the values are: password - ' + user.password)
    var valid = user.comparePassword(req.body.password)
    if (!valid) {
      return res.status(403).send({
        error: 'The login information was incorrect'
      })
    }
    var passwordsMatch = user.compareTwoPasswords(req.body.newPassword, req.body.checkPassword)
    if (!passwordsMatch) {
      return res.status(403).send({
        error: 'Your new passwords do not match'
      })
    }
    console.log('I am about to update the record!!!!')
    model.login.update(
      {password: req.body.newPassword},
      {where: {email: req.body.email}}
    ).then(function (qres) {
      return res.send(qres)
    }).catch((error) => {
      res.status(500)
      res.send('error has occurred: ' + error)
    })
  })
    .catch((error) => {
      res.status(500)
      res.send('error has occurred: ' + error)
    })
})

// The Physician update route. The get is for retrieving details for a specific physician and the post is for updating details
router.get('/physician/:id', isAuthenticated, function (req, res) {
  model.physician.find({
    where: {
      id: req.params.id
    }
  }).then(function (qres) {
    res.send(qres)
  })
})

router.post('/physician/:id', isAuthenticated, function (req, res, next) {
  async function updatePhysician (req, res, next) {
    var physicianId = req.params.id
    var values = {
      physicianSurname: req.body.physicianSurname,
      physicianFirstName: req.body.physicianFirstName,
      providerNumber: req.body.providerNumber,
      physicianComment: req.body.physicianComment
    }
    var selector = {
      where: { id: physicianId }

    }
    model.physician.update(values, selector)
      .then(() => {
        res.send('Updated')
      })
      .catch((error) => {
        res.status(500)
        res.send('error has occurred updating Physician: ' + error)
      })
  }

  updatePhysician(req, res, next)
})

// The physician route. The get is for retrieving details and the post is for adding details
router.get('/physician', isAuthenticated, function (req, res) {
  model.physician.findAll({
    limit: 100
  }).then(function (qres) {
    res.send(qres)
  })
})

// The Error Type update route. The get is for retrieving details for a specific Error Type and the post is for updating details
router.get('/errortype/:id', isAuthenticated, function (req, res) {
  const errors = validationResult(req)
  if (!errors.isEmpty()) {
    return res.status(422).json({ errors: errors.array() })
  }
  console.log('ErrorType id: ' + req.params.id)
  model.errortype.find({
    where: {
      id: req.params.id
    }
  }).then(function (qres) {
    res.send(qres)
  })
})

router.post(
  '/errortype/:id',
  isAuthenticated,
  // Input validation
  check('errorType').not().isEmpty(),
  function (req, res, next) {
    const errors = validationResult(req)
    if (!errors.isEmpty()) {
      return res.status(422).json({ errors: errors.array() })
    }
    async function updateErrorType (req, res, next) {
      var errorTypeId = req.params.id
      var values = {
        errorType: req.body.errorType
      }
      var selector = {
        where: { id: errorTypeId }
      }
      model.errortype.update(values, selector)
        .then(() => {
          res.send('Updated')
        })
        .catch((error) => {
          res.status(500)
          res.send('error has occurred: ' + error)
        })
    }

    updateErrorType(req, res, next)
  })

// The Error Type route. The get is for retrieving details and the post is for adding details
router.get('/errortype', isAuthenticated, function (req, res) {
  model.errortype.findAll({
    limit: 100
  }).then(function (qres) {
    res.send(qres)
  })
})

router.post(
  '/errortype',
  isAuthenticated,
  // Input validation
  check('errorType').not().isEmpty(),
  function (req, res, next) {
    async function addErrorType (req, res, next) {
      model.errortype.create({
        errorType: req.body.errorType
      })
        .then(() => {
          res.send('success')
        })
        .catch((error) => {
          res.status(500)
          res.send('An error occurred while creating an worker type: ' + error)
        })
    }

    addErrorType(req, res, next)
  })

// The Medication Type update route. The get is for retrieving details for a specific Medication Type and the post is for updating details
router.get('/medicationtype/:id', isAuthenticated, function (req, res) {
  const errors = validationResult(req)
  if (!errors.isEmpty()) {
    return res.status(422).json({ errors: errors.array() })
  }
  console.log('MedicationType id: ' + req.params.id)
  model.medicationtype.find({
    where: {
      id: req.params.id
    }
  }).then(function (qres) {
    res.send(qres)
  })
})

router.post(
  '/medicationtype/:id',
  isAuthenticated,
  // Input validation
  check('medicationType').not().isEmpty(),
  function (req, res, next) {
    const errors = validationResult(req)
    if (!errors.isEmpty()) {
      return res.status(422).json({ errors: errors.array() })
    }
    async function updateMedicationType (req, res, next) {
      var medicationTypeId = req.params.id
      console.log('Server side post update Med Type id: ' + req.params.id)
      var values = {
        medicationType: req.body.medicationType
      }
      var selector = {
        where: { id: medicationTypeId }
      }
      model.medicationtype.update(values, selector)
        .then(() => {
          res.send('Updated')
        })
        .catch((error) => {
          res.status(500)
          res.send('error has occurred: ' + error)
        })
    }

    updateMedicationType(req, res, next)
  })

// The Medication Type route. The get is for retrieving details and the post is for adding details
router.get('/medicationtype', isAuthenticated, function (req, res) {
  model.medicationtype.findAll({
    limit: 100
  }).then(function (qres) {
    res.send(qres)
  })
})

router.post(
  '/medicationtype',
  isAuthenticated,
  // Input validation
  check('medicationType').not().isEmpty(),
  function (req, res, next) {
    async function addMedicationType (req, res, next) {
      console.log('inside query - add medication type. Values: ' + req.body.medicationType)
      model.medicationtype.create({
        medicationType: req.body.medicationType
      })
        .then(() => {
          res.send('success')
        })
        .catch((error) => {
          res.status(500)
          res.send('An error occurred while creating an medication type: ' + error)
        })
    }

    addMedicationType(req, res, next)
  })

router.post('/medicationtype',
  isAuthenticated,
  check('medicationtype').not().isEmpty(),
  function (req, res, next) {
    model.medicationtype.create(req.body)
      .then(function (qres) {
        res.send(qres)
      })
      .catch(function (e) {
        res.send('An error occurred creating a new medication type! ' + e)
      })
  })

// The patienttype route. The get is for retrieving details and the post is for adding details
router.get('/patienttype', isAuthenticated, function (req, res) {
  model.patienttype.findAll({
    limit: 100
  }).then(function (qres) {
    res.send(qres)
  })
})

// The Patient Type update route. The get is for retrieving details for a specific Patient Type and the post is for updating details
router.get('/patienttype/:id', isAuthenticated, function (req, res) {
  const errors = validationResult(req)
  if (!errors.isEmpty()) {
    return res.status(422).json({ errors: errors.array() })
  }
  console.log('Server side get PatientType id: ' + req.params.id)
  model.patienttype.find({
    where: {
      id: req.params.id
    }
  }).then(function (qres) {
    res.send(qres)
  })
})

router.post('/patienttype',
  isAuthenticated,
  check('patienttype').not().isEmpty(),
  function (req, res, next) {
    model.patienttype.create(req.body)
      .then(function (qres) {
        res.send(qres)
      })
      .catch(function (e) {
        res.send('An error occurred while creating a patient type! ' + e)
      })
  })

router.post(
  '/patienttype',
  isAuthenticated,
  // Input validation
  check('patienttype').not().isEmpty(),
  function (req, res, next) {
    async function addPatientType (req, res, next) {
      console.log('inside query - add patient type. Values: ' + req.body.patientType)
      model.patienttype.create({
        patientType: req.body.patientType
      })
        .then(() => {
          res.send('success')
        })
        .catch((error) => {
          res.status(500)
          res.send('An error occurred while creating an patient type: ' + error)
        })
    }

    addPatientType(req, res, next)
  })

router.post(
  '/patienttype/:id',
  isAuthenticated,
  // Input validation
  check('patienttype').not().isEmpty(),
  function (req, res, next) {

    console.log('Server side post before update Patient Type id: ' + req.params.id)
    console.log('Server side post before update Patient Type: ' + req.body.patientType)
    
    const errors = validationResult(req)
    if (!errors.isEmpty()) {
      return res.status(422).json({ errors: errors.array() })
    }
    
    async function updatePatientType (req, res, next) {
      var patientTypeId = req.params.id
      console.log('Server side post update Patient Type id: ' + req.params.id)
      console.log('Server side post update Patient Type: ' + req.body.patientType)
      var values = {
        patientType: req.body.patientType
      }
      var selector = {
        where: { id: patientTypeId }
      }
      model.patienttype.update(values, selector)
        .then(() => {
          res.send('Updated')
        })
        .catch((error) => {
          res.status(500)
          res.send('error has occurred: ' + error)
        })
    }

    updatePatientType(req, res, next)
  })

module.exports = router
