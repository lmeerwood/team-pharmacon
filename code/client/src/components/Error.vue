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
                  <v-text-field
                    label="Date yyyy-mm-dd"
                    v-model="date"
                    :rules="[() => !!date || 'This field is required']"
                    required
                  ></v-text-field>
                </v-flex>
                <v-flex xs8 offset-xs1>
                  <v-text-field
                    label="Time hh:ss"
                    v-model="time"
                    :rules="[() => !!time || 'This field is required']"
                    required
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Patient MRN"
                    v-model="patientId"
                    :rules="[() => !!patientId || 'This field is required']"
                    required
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Patient First Name"
                    v-model="patientFirstName"
                    :rules="[() => !!patientFirstName || 'This field is required']"
                    required
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Patient Surname"
                    v-model="patientSurname"
                    :rules="[() => !!patientSurname || 'This field is required']"
                    required
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-select
                    :loading="loading"
                    :items="patientTypes"
                    :rules="[() => patientType.length > 0 || 'You must select one']"
                    label="Select Patient Type"
                    v-model="patientType"
                    autocomplete
                    cache-items
                    chips
                    required
                  ></v-select>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-select
                    :loading="loading"
                    :items="errorTypes"
                    :rules="[() => errorType.length > 0 || 'You must select one']"
                    v-model="errorType"
                    label='Select an Error Type'
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
                    label="Medication Given"
                    v-model="medication"
                    :rules="[() => !!medication || 'This field is required']"
                    required
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-select
                    :loading="loading"
                    :items="medicationTypes"
                    :rules="[() => medicationType.length > 0 || 'You must select one']"
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
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-select
                    :loading="loading"
                    :items="workers"
                    :rules="[() => workerAtFault.length > 0 || 'You must select one']"
                    label="Select Person Who Made Error"
                    v-model="workerAtFault"
                    autocomplete
                    cache-items
                    chips
                    required
                  ></v-select>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Was the person notified?</h4>
                </v-flex>
              </v-layout>
              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-radio-group v-model="workerNotified" :mandatory="false" row="row">
                    <v-radio label="Yes" value=true></v-radio>
                    <v-radio label="No" value=false></v-radio>
                  </v-radio-group>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-select
                    :loading="loading"
                    :items="errorLocations"
                    :rules="[() => errorLocation.length > 0 || 'You must select one']"
                    v-model="errorLocation"
                    label='Where did the error occur?'
                    autocomplete
                    cache-items
                    chips
                    required
                  ></v-select>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Was an IIMS completed?</h4>
                </v-flex>
              </v-layout>
              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-radio-group v-model="iimsCompleted" row="row">
                    <v-radio label="Yes" value="true"></v-radio>
                    <v-radio label="No" value="false"></v-radio>
                  </v-radio-group>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-select
                    :loading="loading"
                    :items="severityLevels"
                    :rules="[() => severity.length > 0 || 'You must select one']"
                    v-model="severity"
                    label='Select Severity Level'
                    autocomplete
                    cache-items
                    chips
                    required
                  ></v-select>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Was the physician notified?</h4>
                </v-flex>
              </v-layout>
              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-radio-group v-model="wasPhysicianNotified" row="row">
                    <v-radio label="Yes" value="true"></v-radio>
                    <v-radio label="No" value="false"></v-radio>
                  </v-radio-group>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Physician First Name"
                    v-model="physicianFirstName"
                    :disabled="this.wasPhysicianNotified == 'false' || this.wasPhysicianNotified == 0"
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Physician Surname"
                    v-model="physicianSurname"
                    :disabled="this.wasPhysicianNotified == 'false' || this.wasPhysicianNotified == 0"
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Physician Provider Number"
                    v-model="providerNumber"
                    :disabled="this.wasPhysicianNotified == 'false' || this.wasPhysicianNotified == 0"
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Physician Comments"
                    v-model="physicianComment"
                    :disabled="this.wasPhysicianNotified == 'false' || this.wasPhysicianNotified == 0"
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Diagnosis"
                    v-model="diagnosis"
                    :disabled="this.wasPhysicianNotified == 'false' || this.wasPhysicianNotified == 0"
                  ></v-text-field>
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
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <p>{{ message }}</p>
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
// import SeverityService from '@/services/SeverityService'
// import MedicationService from '@/services/MedicationService'
import MedicationtypeService from '@/services/MedicationtypeService'
// import PhysicianService from '@/services/PhysicianService'
// import DiagnosisService from '@/services/DiagnosisService'
import PatienttypeService from '@/services/PatienttypeService'
// import PatientService from '@/services/PatientService'
import LocationService from '@/services/LocationService'

export default {
  data: () => ({
    menu: false,
    msg: 'Error Form',
    loading: false,

    // Variables to hold drop down box values
    errorLocations: [],
    patientTypes: [],
    errorTypes: [],
    medicationTypes: [],
    workers: [],
    severityLevels: [],

    // Variables to store inputted values
    valid: true,
    date: '',
    time: '',
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
    diagnosis: '',
    message: ''
  }),
  created () {
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
        this.workers.sort(function (a, b) {
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
        this.workers.sort(function (a, b) {
          return a['text'].localeCompare(b['text'])
        })
      }.bind(this))
      
    // Worker
    WorkerService.getAll()
      .then(function (res, err) {
        this.workers = []
        var i
        for (i = 0; i < res.data.length; i++) {
          if (res.data[i].workerActive) {
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
      if (this.validForm()) {
        try {
          var wasPhysicianNotified = (this.wasPhysicianNotified.valueOf() === 'true') ? 1 : 0
          var iimsCompleted = (this.iimsCompleted.valueOf() === 'true') ? 1 : 0
          var workerNotified = (this.workerNotified.valueOf() === 'true') ? 1 : 0
          await ErrorService.logError({
            errorDate: this.date.valueOf(),
            errorTime: this.time,
            patientId: this.patientId,
            patientFirstName: this.patientFirstName,
            PatientSurname: this.patientSurname,
            patientType: this.patientType.valueOf(),
            errorType: this.errorType.valueOf(),
            medication: this.medication.valueOf(),
            medicationType: this.medicationType.valueOf(),
            generalComment: this.errorComment,
            errorCausedByWorker: this.workerAtFault.valueOf(),
            wasWorkerNotified: workerNotified,
            errorLocation: this.errorLocation.valueOf(),
            iimsCompleted: iimsCompleted,
            level: this.severity.valueOf(),
            wasPhysicianNotified: wasPhysicianNotified,
            physicianFirstName: this.physicianFirstName,
            physicianSurname: this.physicianSurname,
            providerNumber: this.providerNumber,
            physicianComment: this.physicianComment,
            diagnosis: this.diagnosis
          })
          this.clear()
          this.message = 'Form submitted successfully!'
        } catch (error) {
          this.message = error.response.data.error
        }
      } else {
        this.message = 'There was an error with your form.'
      }
    },
    clear: function () {
      this.$refs.form.reset()
      this.message = ''
    },
    validForm: function () {
      return this.$refs.form.validate()
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
