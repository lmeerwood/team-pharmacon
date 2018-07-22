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
                <v-flex xs8 offset-xs1 v-if="show_DatePicker">
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
                <v-flex xs8 offset-xs1 v-if="show_TimePicker">
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

              <v-layout row v-if="show_PatientMRN">
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Patient MRN"
                    v-model="patientId"
                    :rules="[() => !!patientId || 'This field is required']"
                    required
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row v-if="show_PatientFirstName">
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Patient First Name"
                    v-model="patientFirstName"
                    :rules="[() => !!patientFirstName || 'This field is required']"
                    required
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row v-if="show_PatientSurname">
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Patient Surname"
                    v-model="patientSurname"
                    :rules="[() => !!patientSurname || 'This field is required']"
                    required
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row v-if="show_PatientType">
                <v-flex xs8 offset-xs2>
                  <v-select
                    :loading="loading"
                    :items="patientTypes"
                    :rules="[() => patientType > 0 || 'You must select one']"
                    label="Select Patient Type"
                    v-model="patientType"
                    autocomplete
                    cache-items
                    chips
                    required
                  ></v-select>
                </v-flex>
              </v-layout>

              <v-layout row v-if="show_ErrorType">
                <v-flex xs8 offset-xs2>
                  <v-select
                    :loading="loading"
                    :items="errorTypes"
                    :rules="[() => errorType > 0 || 'You must select one']"
                    v-model="errorType"
                    label='Select an Error Type'
                    autocomplete
                    cache-items
                    chips
                    required
                  ></v-select>
                </v-flex>
              </v-layout>

              <v-layout row v-if="show_Medication">
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Medication Given"
                    v-model="medication"
                    :rules="[() => !!medication || 'This field is required']"
                    required
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row v-if="show_MedicationType">
                <v-flex xs8 offset-xs2>
                  <v-select
                    :loading="loading"
                    :items="medicationTypes"
                    :rules="[() => medicationType > 0 || 'You must select one']"
                    label="Select Medication Type"
                    v-model="medicationType"
                    autocomplete
                    cache-items
                    chips
                    required
                  ></v-select>
                </v-flex>
              </v-layout>

              <v-layout row v-if="show_ErrorComment">
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Error Description or General Comment"
                    v-model="errorComment"
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row v-if="show_WorkerAtFault">
                <v-flex xs8 offset-xs2>
                  <v-select
                    :loading="loading"
                    :items="workers"
                    :rules="[() => workerAtFault > 0 || 'You must select one']"
                    label="Select Person Who Made Error"
                    v-model="workerAtFault"
                    autocomplete
                    cache-items
                    chips
                    required
                  ></v-select>
                </v-flex>
              </v-layout>

              <v-layout row v-if="show_WorkerNotified">
                <v-flex xs8 offset-xs2>
                  <h4>Was the person notified?</h4>
                </v-flex>
              </v-layout>
              <v-layout row v-if="show_WorkerNotified">
                <v-flex xs8 offset-xs2>
                  <v-radio-group v-model="workerNotified" :mandatory="false" row="row">
                    <v-radio label="Yes" value=true></v-radio>
                    <v-radio label="No" value=false></v-radio>
                  </v-radio-group>
                </v-flex>
              </v-layout>

              <v-layout row v-if="show_ErrorLocation">
                <v-flex xs8 offset-xs2>
                  <v-select
                    :loading="loading"
                    :items="errorLocations"
                    :rules="[() => errorLocation > 0 || 'You must select one']"
                    v-model="errorLocation"
                    label='Where was error detected?'
                    autocomplete
                    cache-items
                    chips
                    required
                  ></v-select>
                </v-flex>
              </v-layout>

              <v-layout row v-if="show_IIMSCompleted">
                <v-flex xs8 offset-xs2>
                  <h4>Was an IIMS completed?</h4>
                </v-flex>
              </v-layout>
              <v-layout row v-if="show_IIMSCompleted">
                <v-flex xs8 offset-xs2>
                  <v-radio-group v-model="iimsCompleted" row="row">
                    <v-radio label="Yes" value="true"></v-radio>
                    <v-radio label="No" value="false"></v-radio>
                  </v-radio-group>
                </v-flex>
              </v-layout>

              <v-layout row v-if="show_Severity">
                <v-flex xs8 offset-xs2>
                  <v-select
                    :loading="loading"
                    :items="severityLevels"
                    :rules="[() => severity > 0 || 'You must select one']"
                    v-model="severity"
                    label='Select Severity Level'
                    autocomplete
                    cache-items
                    chips
                    required
                  ></v-select>
                </v-flex>
              </v-layout>

              <v-layout row v-if="show_WasPhysicianNotified">
                <v-flex xs8 offset-xs2>
                  <h4>Was the physician notified?</h4>
                </v-flex>
              </v-layout>
              <v-layout row v-if="show_WasPhysicianNotified">
                <v-flex xs8 offset-xs2>
                  <v-radio-group v-model="wasPhysicianNotified" row="row">
                    <v-radio label="Yes" value="true"></v-radio>
                    <v-radio label="No" value="false"></v-radio>
                  </v-radio-group>
                </v-flex>
              </v-layout>

              <v-layout row v-if="show_ProviderNumber">
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Physician Provider Number"
                    v-model="providerNumber"
                    :disabled="this.wasPhysicianNotified == 'false' || this.wasPhysicianNotified == 0"
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row v-if="show_PhysicianFirstName">
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Physician First Name"
                    v-model="physicianFirstName"
                    :disabled="this.wasPhysicianNotified == 'false' || this.wasPhysicianNotified == 0"
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row v-if="show_PhysicianSurname">
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Physician Surname"
                    v-model="physicianSurname"
                    :disabled="this.wasPhysicianNotified == 'false' || this.wasPhysicianNotified == 0"
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row v-if="show_PhysicianComment">
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Physician Comments"
                    v-model="physicianComment"
                    :disabled="this.wasPhysicianNotified == 'false' || this.wasPhysicianNotified == 0"
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row v-if="show_Diagnosis">
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Diagnosis"
                    v-model="diagnosis"
                    :disabled="this.wasPhysicianNotified == 'false' || this.wasPhysicianNotified == 0"
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
// import DiagnosisService from '@/services/DiagnosisService'
import PatienttypeService from '@/services/PatienttypeService'
// import PatientService from '@/services/PatientService'
import LocationService from '@/services/LocationService'

export default {
  data: () => ({
    menu: false,
    msg: 'Error Form',
    loading: false,
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

    // Variables to hide/show fields
    show_DatePicker: true,
    show_TimePicker: true,
    show_PatientMRN: true,
    show_PatientFirstName: true,
    show_PatientSurname: true,
    show_PatientType: true,
    show_ErrorType: true,
    show_Medication: true,
    show_MedicationType: true,
    show_ErrorComment: true,
    show_WorkerAtFault: true,
    show_WorkerNotified: true,
    show_ErrorLocation: true,
    show_IIMSCompleted: true,
    show_Severity: true,
    show_WasPhysicianNotified: true,
    show_ProviderNumber: true,
    show_PhysicianFirstName: true,
    show_PhysicianSurname: true,
    show_PhysicianComment: true,
    show_Diagnosis: true,

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
    diagnosis: ''
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
            patientSurname: this.patientSurname,
            patientType: this.patientType.valueOf(),
            errortypeId: this.errorType.valueOf(),
            medicationName: this.medication.valueOf(),
            medicationtypeId: this.medicationType.valueOf(),
            generalComment: this.errorComment,
            errorCausedByWorker: this.workerAtFault.valueOf(),
            wasWorkerNotified: workerNotified,
            locationId: this.errorLocation.valueOf(),
            iimsCompleted: iimsCompleted,
            severityId: this.severity.valueOf(),
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
          this.errorMessage = error.response.data.error
        }
      } else {
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
