<template>
  <v-layout row class="pt-5 top-margin">
    <v-flex xs6 offset-xs3>
      <section class="page-head">
        <h1 id="introduction" class="display-1 primary--text">
          {{msg}}
        </h1>
        <fieldset class="white">
          <v-form v-model="valid" ref="form" lazy-validation>
            <v-container fluid>
                <v-layout row>
                <v-flex xs8 offset-xs1>
                  <v-menu
                  ref="datePicker"
                  :close-on-content-click="false"
                  v-model="datePicker"
                  :nudge-right="40"
                  :return-value.sync="date"
                  lazy
                  transition="scale-transition"
                  offset-y
                  full-width
                  min-width="290px"
                >
                  <v-text-field
                    slot="activator"
                    v-model="date"
                    label="Date of Error"
                    prepend-icon="event"
                    :rules="[() => !!date || 'This field is required']"
                    required
                    readonly
                  ></v-text-field>
                  <v-date-picker v-model="date" @input="$refs.datePicker.save(date)"></v-date-picker>
                </v-menu>
                </v-flex>
                <v-flex xs8 offset-xs1>
                  <v-menu
                    ref="timePicker"
                    :close-on-content-click="false"
                    v-model="timePicker"
                    :nudge-right="40"
                    :return-value.sync="time"
                    lazy
                    transition="scale-transition"
                    offset-y
                    full-width
                    max-width="290px"
                    min-width="290px"
                  >
                    <v-text-field
                      slot="activator"
                      v-model="time"
                      label="Time of Error"
                      prepend-icon="access_time"
                      :rules="[() => !!time || 'This field is required']"
                      required
                      readonly
                    ></v-text-field>
                    <v-time-picker format="24hr" v-model="time" @change="$refs.timePicker.save(time)"></v-time-picker>
                  </v-menu>
                </v-flex>
              </v-layout>

              <v-layout row v-if="showFields.showPatientFields">
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Patient MRN"
                    v-model="patientId"
                    :rules="[rules.required, rules.alphaNum]"
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row v-if="showFields.showPatientFields">
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Patient First Name"
                    v-model="patientFirstName"
                    :rules="[rules.required, rules.alphaDashApos]"
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row v-if="showFields.showPatientFields">
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Patient Surname"
                    v-model="patientSurname"
                    :rules="[rules.required, rules.alphaDashApos]"
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row v-if="showFields.showPatientFields">
                <v-flex xs8 offset-xs2>
                  <v-select
                    :loading="loading"
                    :items="patientTypes"
                    :rules="[rules.requiredSelect]"
                    label="Select Patient Type"
                    v-model="patientType"
                    autocomplete
                    cache-items
                    chips
                    required
                  ></v-select>
                </v-flex>
              </v-layout>

              <v-layout row v-if="showFields.showErrorType">
                <v-flex xs8 offset-xs2>
                  <v-select
                    :loading="loading"
                    :items="errorTypes"
                    :rules="[rules.requiredSelect]"
                    v-model="errorType"
                    label='Select an Error Type'
                    autocomplete
                    cache-items
                    chips
                    required
                  ></v-select>
                </v-flex>
              </v-layout>

              <v-layout row v-if="showFields.showMedicationFields">
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Medication Given"
                    v-model="medication"
                    :rules="[rules.required, rules.alphaDashApos]"
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row v-if="showFields.showMedicationFields">
                <v-flex xs8 offset-xs2>
                  <v-select
                    :loading="loading"
                    :items="medicationTypes"
                    :rules="[rules.requiredSelect]"
                    label="Select Medication Type"
                    v-model="medicationType"
                    autocomplete
                    cache-items
                    chips
                    required
                  ></v-select>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Error Description or General Comment"
                    v-model="errorComment"
                    :rules="[rules.alphaDashApos]"
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row v-if="showFields.showWorker">
                <v-flex xs8 offset-xs2>
                  <v-select
                    :loading="loading"
                    :items="workers"
                    :rules="[rules.requiredSelect]"
                    label="Select Person Who Made Error"
                    v-model="workerAtFault"
                    autocomplete
                    cache-items
                    chips
                    required
                  ></v-select>
                </v-flex>
              </v-layout>

              <v-layout row v-if="showFields.showWorkerNotified">
                <v-flex xs8 offset-xs2>
                  <h4>Was the person notified?</h4>
                </v-flex>
              </v-layout>
              <v-layout row v-if="showFields.showWorkerNotified">
                <v-flex xs8 offset-xs2>
                  <v-radio-group v-model="workerNotified" :mandatory="false" row="row">
                    <v-radio label="Yes" value="true"></v-radio>
                    <v-radio label="No" value="false"></v-radio>
                  </v-radio-group>
                </v-flex>
              </v-layout>

              <v-layout row v-if="showFields.showLocation">
                <v-flex xs8 offset-xs2>
                  <v-select
                    :loading="loading"
                    :items="errorLocations"
                    :rules="[rules.requiredSelect]"
                    v-model="errorLocation"
                    label='Where was error detected?'
                    autocomplete
                    cache-items
                    chips
                    required
                  ></v-select>
                </v-flex>
              </v-layout>

              <v-layout row v-if="showFields.showIIMScompleted">
                <v-flex xs8 offset-xs2>
                  <h4>Was an IIMS completed?</h4>
                </v-flex>
              </v-layout>
              <v-layout row v-if="showFields.showIIMScompleted">
                <v-flex xs8 offset-xs2>
                  <v-radio-group v-model="iimsCompleted" row="row">
                    <v-radio label="Yes" value="true"></v-radio>
                    <v-radio label="No" value="false"></v-radio>
                  </v-radio-group>
                </v-flex>
              </v-layout>

              <v-layout row v-if="showFields.showSeverity">
                <v-flex xs8 offset-xs2>
                  <v-select
                    :loading="loading"
                    :items="severityLevels"
                    :rules="[rules.requiredSelect]"
                    v-model="severity"
                    label='Select Severity Level'
                    autocomplete
                    cache-items
                    chips
                    required
                  ></v-select>
                </v-flex>
              </v-layout>

              <v-layout row v-if="showFields.showPhysicianFields">
                <v-flex xs8 offset-xs2>
                  <h4>Was the physician notified?</h4>
                </v-flex>
              </v-layout>
              <v-layout row v-if="showFields.showPhysicianFields">
                <v-flex xs8 offset-xs2>
                  <v-radio-group v-model="wasPhysicianNotified" row="row">
                    <v-radio label="Yes" value="true"></v-radio>
                    <v-radio label="No" value="false"></v-radio>
                  </v-radio-group>
                </v-flex>
              </v-layout>

              <v-layout row v-if="showFields.showPhysicianFields">
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Physician Provider Number"
                    v-model="providerNumber"
                    :disabled="this.wasPhysicianNotified == 'false' || this.wasPhysicianNotified == 0"
                    :rules="[rules.alphaNum]"
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row v-if="showFields.showPhysicianFields">
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Physician First Name"
                    v-model="physicianFirstName"
                    :disabled="this.wasPhysicianNotified == 'false' || this.wasPhysicianNotified == 0"
                    :rules="[rules.alphaDashApos]"
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row v-if="showFields.showPhysicianFields">
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Physician Surname"
                    v-model="physicianSurname"
                    :disabled="this.wasPhysicianNotified == 'false' || this.wasPhysicianNotified == 0"
                    :rules="[rules.alphaDashApos]"
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row v-if="showFields.showPhysicianFields">
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Physician Comments"
                    v-model="physicianComment"
                    :disabled="this.wasPhysicianNotified == 'false' || this.wasPhysicianNotified == 0"
                    :rules="[rules.alphaDashApos]"
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs12 >
                <v-alert :value="errorMessage" type="error">
                  {{ errorMessage }}
                </v-alert>
                <v-alert :value="message" type="success">
                  {{ message }}
                </v-alert>
                </v-flex>
              </v-layout>

              <v-layout row v-if="uploading">
                <v-flex xs12 >
                  <v-progress-linear :indeterminate="true" :disabled="false" ></v-progress-linear>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-btn
                    round
                    color="primary"
                    dark
                    :disabled="!valid"
                    @click="submit"
                  >Submit
                  </v-btn>
                  <v-btn
                    round color="secondary"
                    dark
                    @click="clear">
                    clear
                  </v-btn>
                  <v-btn
                    round color="secondary"
                    dark
                    @click="showAllCurrentFields"
                    :disabled="!this.fieldsAreHidden">
                    Show Missing Fields
                  </v-btn>
                </v-flex>
              </v-layout>
            </v-container>
          </v-form>
        </fieldset>
      </section>
    </v-flex>
  </v-layout>
</template>

<script>
import ErrorService from '@/services/ErrorService'
import WorkerService from '@/services/WorkerService'
import ErrortypeService from '@/services/ErrortypeService'
import SeverityService from '@/services/SeverityService'
// import MedicationService from '@/services/MedicationService'
import MedicationtypeService from '@/services/MedicationtypeService'
// import PhysicianService from '@/services/PhysicianService'
import PatienttypeService from '@/services/PatienttypeService'
// import PatientService from '@/services/PatientService'
import LocationService from '@/services/LocationService'
import HiddenFieldsService from '@/services/HiddenFieldsService'

export default {

  data: () => ({
    menu: false,
    msg: 'Error Form',
    loading: false,
    uploading: false,
    errorMessage: '',
    message: '',

    // Variables to hold drop down box values
    errorLocations: [],
    patientTypes: [],
    errorTypes: [],
    medicationTypes: [],
    workers: [],
    severityLevels: [],

    // Variables to hold menu helpers
    datePicker: false,
    timePicker: false,

    // Variables to store inputted values
    valid: true,
    date: '',
    time: null,
    patientId: '',
    patientFirstName: '',
    patientSurname: '',
    patientType: '',
    errorType: '',
    medication: '',
    medicationType: '',
    errorComment: '',
    workerAtFault: '',
    workerNotified: false,
    errorLocation: '',
    iimsCompleted: false,
    severity: '',
    wasPhysicianNotified: false,
    physicianFirstName: '',
    physicianSurname: '',
    providerNumber: '',
    physicianComment: '',
    rules: {
      required: value => !!value || 'This field is required',
      requiredSelect: value => value > 0 || 'You must select one',
      alphaNum: value => {
        const pattern = /^$|^([a-zA-Z0-9]+)$/
        return pattern.test(value) || 'Alpha-numeric field only'
      },
      alphaDashApos: value => {
        const pattern = /^$|^([a-zA-Z-' ]+)$/
        return pattern.test(value) || 'Field must contain letters and/or dash/apostrophe only'
      }
    },
    showFields: {
      showPatientFields: true,
      showErrorType: true,
      showMedicationFields: true,
      showWorker: true,
      showWorkerNotified: true,
      showLocation: true,
      showIIMScompleted: true,
      showSeverity: true,
      showPhysicianFields: true
    },
    fieldsAreHidden: false
  }),
  created () {
    HiddenFieldsService.getHiddenFields(1)
      .then(function (res, err) {
        if (!res.data[1] && !this.$route.query.errorId) {
          this.showFields = res.data[0]
        }
      }.bind(this))

    // Retrieve specific error and load into the form.
    if (this.$route.query.errorId) {
      ErrorService.getError(this.$route.query.errorId)
        .then(function (res, err) {
          this.errorId = this.$route.query.errorId
          this.date = res.data.errorDate
          this.time = res.data.errorTime.split(':', 2).join(':')
          this.errorComment = res.data.generalComment

          if (res.data.patient) {
            this.showFields.showPatientFields = true
            this.patientId = res.data.patient.patientHospitalId
            this.patientFirstName = res.data.patient.patientFirstName
            this.patientSurname = res.data.patient.patientSurname
            this.patientType = res.data.patient.patienttypeId
          } else { this.showFields.showPatientFields = false }

          if (res.data.errortype) {
            this.showFields.showErrorType = true
            this.errorType = res.data.errortype.id
          } else { this.showFields.showErrorType = false }

          if (res.data.medication) {
            this.showFields.showMedicationFields = true
            this.medication = res.data.medication.medicationName
            this.medicationType = res.data.medication.medicationtypeId
          } else { this.showFields.showMedicationFields = false }

          if (res.data.worker) {
            this.showFields.showWorker = true
            this.workerAtFault = res.data.worker.id
          } else { this.showFields.showWorker = false }

          if (res.data.wasWorkerNotified === 'null') {
            this.showFields.showWorkerNotified = true
            this.workerNotified = res.data.wasWorkerNotified ? 'true' : 'false'
          } else { this.showFields.showWorkerNotified = false }

          if (res.data.location) {
            this.showFields.showLocation = true
            this.errorLocation = res.data.location.id
          } else { this.showFields.showLocation = false }

          if (res.data.iimsCompleted === 'null') {
            this.showFields.showIIMScompleted = true
            this.iimsCompleted = res.data.iimsCompleted ? 'true' : 'false'
          } else { this.showFields.showIIMScompleted = false }

          if (res.data.severity) {
            this.showFields.showSeverity = true
            this.severity = res.data.severity.id
          } else { this.showFields.showSeverity = false }

          if (res.data.physician) {
            this.showFields.showPhysicianFields = true
            this.wasPhysicianNotified = res.data.wasPhysicianNotified ? 'true' : 'false'
            this.physicianFirstName = res.data.physician.physicianFirstName
            this.physicianSurname = res.data.physician.physicianSurname
            this.providerNumber = res.data.physician.providerNumber
            this.physicianComment = res.data.physician.physicianComment
          } else { this.showFields.showPhysicianFields = false }
          this.fieldsAreHidden = true
          console.log('data initialised')
        }.bind(this))
    }

    // These go through and retrieve the values from the server to load into the drop
    // down boxes in the form

    // ErrorType
    ErrortypeService.getAll()
      .then(function (res, err) {
        this.errorTypes = []
        var i
        for (i = 0; i < res.data.length; i++) {
          this.errorTypes.push({
            value: res.data[i].id,
            text: res.data[i].errorType
          })
        }
        // Sort the array by the text field rather than the value
        this.errorTypes.sort(function (a, b) {
          return a['text'].localeCompare(b['text'])
        })
      }.bind(this))

    // Patient Type
    PatienttypeService.getAll()
      .then(function (res, err) {
        this.patientTypes = []
        var i
        for (i = 0; i < res.data.length; i++) {
          this.patientTypes.push({
            value: res.data[i].id,
            text: res.data[i].patientType
          })
        }
        // Sort the array by the text field rather than the value
        this.patientTypes.sort(function (a, b) {
          return a['text'].localeCompare(b['text'])
        })
      }.bind(this))

    // Medication Type
    MedicationtypeService.getAll()
      .then(function (res, err) {
        this.medicationTypes = []
        var i
        for (i = 0; i < res.data.length; i++) {
          this.medicationTypes.push({
            value: res.data[i].id,
            text: res.data[i].medicationType
          })
        }
        // Sort the array by the text field rather than the value
        this.medicationTypes.sort(function (a, b) {
          return a['text'].localeCompare(b['text'])
        })
      }.bind(this))

    // Location Type
    LocationService.getAll()
      .then(function (res, err) {
        this.errorLocations = []
        var i
        for (i = 0; i < res.data.length; i++) {
          this.errorLocations.push({
            value: res.data[i].id,
            text: res.data[i].errorLocation
          })
        }
        // Sort the array by the text field rather than the value
        this.errorLocations.sort(function (a, b) {
          return a['text'].localeCompare(b['text'])
        })
      }.bind(this))

    // Severity Type
    SeverityService.getAll()
      .then(function (res, err) {
        this.severityLevels = []
        var i
        for (i = 0; i < res.data.length; i++) {
          this.severityLevels.push({
            value: res.data[i].id,
            text: res.data[i].level
          })
        }
      }.bind(this))

    // Worker
    WorkerService.getAll()
      .then(function (res, err) {
        this.workers = []
        var i
        for (i = 0; i < res.data.length; i++) {
          if (res.data[i].workerActive) {
            // Combine the worker details into 'Surname, FirstName'
            var name = res.data[i].workerSurname + ', ' + res.data[i].workerFirstName
            this.workers.push({
              value: res.data[i].id,
              text: name
            })
          }
        }
        // Sort the array by the text field rather than the value
        this.workers.sort(function (a, b) {
          return a['text'].localeCompare(b['text'])
        })
      }.bind(this))
  },
  methods: {
    async submit () {
      this.errorMessage = ''
      this.message = ''
      this.uploading = true
      var wasPhysicianNotified = (this.wasPhysicianNotified.valueOf() === 'true') ? 1 : 0
      var iimsCompleted = (this.iimsCompleted.valueOf() === 'true') ? 1 : 0
      var workerNotified = (this.workerNotified.valueOf() === 'true') ? 1 : 0
      var errorId = this.$route.query.errorId

      var values = {
        errorDate: this.date.valueOf(),
        errorTime: this.time,
        patientId: this.patientId,
        patientFirstName: this.patientFirstName,
        patientSurname: this.patientSurname,
        generalComment: this.errorComment,
        physicianFirstName: this.physicianFirstName,
        physicianSurname: this.physicianSurname,
        providerNumber: this.providerNumber,
        physicianComment: this.physicianComment
      }
      if (this.showFields.showPatientFields) { values = Object.assign(values, { patientType: this.patientType.valueOf() }) }
      if (this.showFields.showErrorType) { values = Object.assign(values, { errortypeId: this.errorType.valueOf() }) }
      if (this.showFields.showMedicationFields) { values = Object.assign(values, { medicationName: this.medication.valueOf() }) }
      if (this.showFields.showMedicationFields) { values = Object.assign(values, { medicationtypeId: this.medicationType.valueOf() }) }
      if (this.showFields.showWorker) { values = Object.assign(values, { errorCausedByWorker: this.workerAtFault.valueOf() }) }
      if (this.showFields.showWorkerNotified) { values = Object.assign(values, { wasWorkerNotified: workerNotified }) }
      if (this.showFields.showLocation) { values = Object.assign(values, { locationId: this.errorLocation.valueOf() }) }
      if (this.showFields.showIIMScompleted) { values = Object.assign(values, { iimsCompleted: iimsCompleted }) }
      if (this.showFields.showSeverity) { values = Object.assign(values, { severityId: this.severity.valueOf() }) }
      if (this.showFields.showPhysicianFields) { values = Object.assign(values, { wasPhysicianNotified: wasPhysicianNotified }) }

      if (this.validForm() && errorId != null) {
        try {
          await ErrorService.updateError(errorId, values)
          this.clear()
          this.uploading = false
          this.message = 'Record updated successfully!'
          setTimeout(function () {
            this.$router.push('/searchError')
          }.bind(this), 1000)
        } catch (error) {
          this.uploading = false
          this.errorMessage = error.response.data.error
        }
      } else if (this.validForm()) {
        try {
          await ErrorService.logError(values)
          this.uploading = false
          this.clear()
          this.message = 'Record submitted successfully!'
        } catch (error) {
          this.uploading = false
          this.errorMessage = error.response.data.error
        }
      } else {
        this.uploading = false
        this.errorMessage = 'There was an error with your form.'
      }
    },
    clear: function () {
      this.$refs.form.reset()
      this.message = ''
      this.errorMessage = ''
    },
    validForm: function () {
      return this.$refs.form.validate()
    },
    showAllCurrentFields: function () {
      HiddenFieldsService.getHiddenFields(1)
        .then(function (res, err) {
          this.showFields = res.data[0]
          this.fieldsAreHidden = false
        }.bind(this))
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .top-margin {
    margin-top: 58px;
  }
</style>
