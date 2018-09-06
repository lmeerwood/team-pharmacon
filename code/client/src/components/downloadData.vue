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

            <v-layout row v-if="!exporting">
              <v-flex xs8 offset-xs1>
              <v-menu
                  ref="datePickerFrom"
                  :close-on-content-click="false"
                  v-model="datePickerFrom"
                  :nudge-right="40"
                  :return-value.sync="dateFrom"
                  lazy
                  transition="scale-transition"
                  offset-y
                  full-width
                  min-width="290px"
                >
                  <v-text-field
                    slot="activator"
                    v-model="dateFrom"
                    label="Date from..."
                    prepend-icon="event"
                    :rules="[() => !!dateFrom || 'This field is required']"
                    required
                    readonly
                  ></v-text-field>
                  <v-date-picker v-model="dateFrom" @input="$refs.datePickerFrom.save(dateFrom)"></v-date-picker>
                </v-menu>
              </v-flex>
              </v-layout>

            <v-layout row  v-if="!exporting">
                <v-flex xs8 offset-xs1>
                <v-menu
                  ref="datePickerTo"
                  :close-on-content-click="false"
                  v-model="datePickerTo"
                  :nudge-right="40"
                  :return-value.sync="dateTo"
                  lazy
                  transition="scale-transition"
                  offset-y
                  full-width
                  min-width="290px"
                >
                  <v-text-field
                    slot="activator"
                    v-model="dateTo"
                    label="Date to..."
                    prepend-icon="event"
                    :rules="[() => !!dateTo || 'This field is required']"
                    required
                    readonly
                  ></v-text-field>
                  <v-date-picker v-model="dateTo" @input="$refs.datePickerTo.save(dateTo)"></v-date-picker>
                </v-menu>
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

            <v-layout row v-if="!exporting">
              <v-flex xs8 offset-xs2>
                <v-btn
                  @click="submit">
                  Export
                </v-btn>
                <v-btn
                  color="secondary"
                  dark
                  @click="clear">
                  Cancel
                </v-btn>
              </v-flex>
            </v-layout>

            <v-layout row  v-if="downloadReady">
              <v-flex xs8 offset-xs2>
                <download-excel
                  class = "btn btn-default"
                  :data = "json_data"
                  :fields = "json_fields"
                  type = "csv"
                  name = "report.csv"
                  color="secondary">
                  Download CSV File
                </download-excel>
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
import downloadDataService from '@/services/downloadDataService'

export default {
  data: () => ({
    menu: false,
    msg: 'Export Errors to CSV',
    loading: false,
    errorMessage: '',
    message: '',

    exporting: false,
    downloadReady: false,

    // Variables to hold menu helpers
    datePickerFrom: false,
    datePickerTo: false,

    // Variables to store input values
    valid: true,
    dateFrom: '',
    dateTo: '',
    json_fields: {
      'Error': 'generalComment',
      'Severity of error': 'medication.medicationName',
      'Medication given': 'medication.medicationtype.medicationType',
      'Medication type': 'severity.level',
      'Type of error': 'errortype.errorType',
      'Date of error': 'errorDate',
      'Time of error': {
        field: 'errorTime',
        callback: (value) => {
          return value.split('.')[0]
        }
      },
      'Patient ID': 'patient.patientHospitalId',
      'Patient surname': 'patient.patientSurname',
      'Patient firstname': 'patient.patientFirstName',
      'Patient Type': 'patient.patienttype.patientType',
      'Worker ID': 'worker.id',
      'Worker Surname': 'worker.workerSurname',
      'Worker Firstname': 'worker.workerFirstName',
      'Worker Role': 'worker.workerRole',
      'Was the worker notified of the error': {
        field: 'wasWorkerNotified',
        callback: (value) => {
          if (value) {
            return 'yes'
          } else {
            return 'no'
          }
        }
      },
      'Was an IIMS completed': {
        field: 'iimsCompleted',
        callback: (value) => {
          if (value) {
            return 'yes'
          } else {
            return 'no'
          }
        }
      },
      'Was a physicain notified': {
        field: 'wasPhysicianNotified',
        callback: (value) => {
          if (value) {
            return 'yes'
          } else {
            return 'no'
          }
        }
      },
      'Physician surname': 'physician.physicianSurname',
      'Physician firstname': 'physician.physicianFirstName',
      'Physician provider number': 'physician.providerNumber',
      'Physician comment': 'physician.physicianComment',
      'Location where error occured': 'location.errorLocation'
    },
    json_data: [{
      // data will be populated at a later date
    }],
    json_meta: [{
      key: 'charset',
      value: 'utf-8'
    }]
  }),
  methods: {
    async submit () {
      this.errorMessage = ''
      this.message = ''
      var dates = {
        startDate: this.dateFrom.valueOf(),
        endDate: this.dateTo.valueOf()
      }
      this.exporting = true
      this.message = 'Exporting data, please do not close window.'

      if (this.validForm()) {
        await downloadDataService.getAll(dates)
          .then(function (res, err) {
            if (res.data.length === 0) {
              this.message = ''
              this.errorMessage = 'No entries found in this date range'
              this.exporting = false
            } else {
              this.downloadReady = true
              this.message = 'Download Ready'
              this.json_data = res.data
              console.log(this.json_data)
            }
          }.bind(this))
      } else {
        this.errorMessage = 'There was an error with your form.'
      }
    },
    clear: function () {
      this.message = ''
      this.errorMessage = ''
      this.$router.push({
        name: 'adminWelcome'
      })
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
