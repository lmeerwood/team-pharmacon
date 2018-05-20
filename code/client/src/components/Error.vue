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
                :rules="[() => date.length > 0 || 'This field is required']"
                required
                ></v-text-field>
              </v-flex>
              <v-flex xs8 offset-xs1>
                <v-text-field
                label="Time hh:ss"
                v-model="time"
                :rules="[() => time.length > 0 || 'This field is required']"
                required
                ></v-text-field>
              </v-flex>
            </v-layout>

            <v-layout row>
              <v-flex xs8 offset-xs2>
                <v-text-field
                label="Patient First Name"
                v-model="patientFirstName"
                :rules="[() => patientFirstName.length > 0 || 'This field is required']"
                required
                ></v-text-field>
              </v-flex>
            </v-layout>

            <v-layout row>
              <v-flex xs8 offset-xs2>
                <v-text-field
                label="Patient Surname"
                v-model="patientSurname"
                :rules="[() => patientSurname.length > 0 || 'This field is required']"
                required
                ></v-text-field>
              </v-flex>
            </v-layout>

            <v-layout row>
              <v-flex xs8 offset-xs2>
                <v-text-field
                label="Patient MRN"
                v-model="patientId"
                :rules="[() => patientId.length > 0 || 'This field is required']"
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
                :search-input.sync="search"
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
                <v-select
                :loading="loading"
                :items="medications"
                :rules="[() => medication.length > 0 || 'You must select one']"
                label="Select Medication"
                v-model="medication"
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
                <v-radio-group v-model="workerNotified" :mandatory="false" row=true>
                  <v-radio label="Yes" value=1></v-radio>
                  <v-radio label="No" value=0></v-radio>
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
                <v-radio-group v-model="iimsCompleted" row=true>
                  <v-radio label="Yes" value=1></v-radio>
                  <v-radio label="No" value=0></v-radio>
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
                <v-radio-group v-model="wasPhysicianNotified" row="true">
                  <v-radio label="Yes" value=1></v-radio>
                  <v-radio label="No" value=0></v-radio>
                </v-radio-group>
              </v-flex>
            </v-layout>

            <v-layout row>
               <v-flex xs8 offset-xs2>
                <v-text-field
                label="Physician First Name"
                v-model="physicianFirstName"
                :disabled="this.wasPhysicianNotified == 0"
                ></v-text-field>
              </v-flex>
            </v-layout>

            <v-layout row>
              <v-flex xs8 offset-xs2>
                <v-text-field
                label="Physician Surname"
                v-model="physicianSurname"
                :disabled="this.wasPhysicianNotified == 0"
                ></v-text-field>
              </v-flex>
            </v-layout>

            <v-layout row>
              <v-flex xs8 offset-xs2>
                <v-text-field
                label="Physician Provider Number"
                v-model="providerNumber"
                :disabled="this.wasPhysicianNotified == 0"
                ></v-text-field>
              </v-flex>
            </v-layout>

            <v-layout row>
              <v-flex xs8 offset-xs2>
                <v-text-field
                label="Physician Comments"
                v-model="physicianComment"
                :disabled="this.wasPhysicianNotified == 0"
                ></v-text-field>
              </v-flex>
            </v-layout>

            <v-layout row>
              <v-flex xs8 offset-xs2>
                <v-text-field
                label="Diagnosis"
                v-model="diagnosis"
                :disabled="this.wasPhysicianNotified == 0"
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
                round color="primary"
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
var axios = require('axios')
export default {
  data: () => ({
    menu: false,
    loading: false,
    patientTypes: [
      { text: 'Discharge', value: '0' },
      { text: 'Inpatient', value: '1' },
      { text: 'Outpatient', value: '2' },
      { text: 'Day patient', value: '3' }
    ],
    workers: [
      { text: 'Pat Smith', value: '0' },
      { text: 'Timothy Myers', value: '1' },
      { text: 'Jessica Noble', value: '2' },
      { text: 'Amanda Stait', value: '3' },
      { text: 'Wang Shu', value: '4' }
    ],
    errorTypes: [
      { text: 'Batch Number', value: '0' },
      { text: 'Directions', value: '1' },
      { text: 'Dosage / Strength', value: '2' },
      { text: 'Expiry Date', value: '3' },
      { text: 'Form Intravenous', value: '4' },
      { text: 'Form Per Oral', value: '5' },
      { text: 'Incorrect Medication', value: '6' },
      { text: 'Incorrect Patient', value: '7' },
      { text: 'Incorrect Quantity', value: '8' },
      { text: 'Other', value: '9' }
    ],
    errorLocations: [
      { text: 'Dispensary', value: '0' },
      { text: 'On the ward', value: '1' },
      { text: 'Outside hospital', value: '2' }
    ],
    medications: [
      { text: '5 mg Acetaminophen USP - Oral', value: '0' },
      { text: '7.5 mg Acetaminophen USP - Oral', value: '1' },
      { text: '10 mg Acetaminophen USP - Oral', value: '2' },
      { text: 'Isotretinoin - Oral', value: '3' },
      { text: 'Ambien - Oral', value: '4' },
      { text: 'Diclofenac Sodium - Oral', value: '5' },
      { text: 'Mustargen - Intravenous', value: '6' },
      { text: 'Sulfamethoxazole and trimethoprim - Oral', value: '7' },
      { text: 'Sodium Fluoride - Oral', value: '8' },
      { text: 'Ceftriaxone - Intravenous', value: '9' },
      { text: 'Claforan - Intravenous', value: '10' },
      { text: 'Albuterol Sulfate Inhalation Solution - Inhalation', value: '11' },
      { text: 'Azathioprine - Oral', value: '12' },
      { text: 'CitraNatal Harmony 2.1 - Oral', value: '13' },
      { text: 'Hydrocodone Bitartrate and Acetaminophen - Oral', value: '14' },
      { text: 'Tinnitus - Oral', value: '15' },
      { text: 'Atovaquone and Proguanil Hydrochloride - Oral', value: '16' },
      { text: 'Succimer - Oral', value: '17' }
    ],
    severityLevels: [
      { text: 'Minor', value: '0' },
      { text: 'Low', value: '1' },
      { text: 'Moderate-Low', value: '2' },
      { text: 'Moderate', value: '3' },
      { text: 'Moderate-Severe', value: '4' },
      { text: 'Severe', value: '5' }
    ],
    valid: true,
    date: '',
    time: '',
    patientFirstName: '',
    patientSurname: '',
    patientId: '',
    patientType: '',
    errorType: '',
    errorComment: '',
    workerAtFault: '',
    workerNotified: null,
    errorLocation: '',
    iimsCompleted: null,
    medication: '',
    severity: '',
    wasPhysicianNotified: null,
    physicianFirstName: '',
    physicianSurname: '',
    providerNumber: '',
    physicianComment: '',
    diagnosis: '',
    message: ''
  }),

  methods: {
    submit: function () {
      if (this.validForm()) {
        this.message = ''

        var url = 'http://localhost:3000/api/v1/query/error'
        axios.post(url,
          {
            formDate: this.date,
            formTime: this.time,
            formPatientFirstName: this.patientFirstName,
            formPatientSurname: this.patientSurname,
            formPatientId: this.patientId,
            formPatientType: this.patientType,
            formErrorType: this.errorType,
            formErrorComment: this.errorComment,
            formWorkerAtFault: this.workerAtFault,
            formWorkerNotified: this.workerNotified,
            formErrorLocation: this.errorLocation,
            formIimsCompleted: this.iimsCompleted,
            formMedication: this.medication,
            formSeverity: this.severity,
            formPhysicianNotified: this.wasPhysicianNotified,
            formPhysicianFirstName: this.physicianFirstName,
            formPhysicianSurname: this.physicianSurname,
            formProviderNumber: this.providerNumber,
            formPhysicianComment: this.physicianComment,
            formDiagnosis: this.diagnosis
          })
          .then(function (response) {
            if (response.data['status'] === 200) {
              this.message = 'Error added successfully'
              this.clear()
            }
          }.bind(this))
          .catch(function (error) {
            this.message = 'There was an error adding the Error:' +
            error.stack
          }.bind(this))
      } else {
        this.message = 'There was an error with your form.'
      }
    },
    clear: function () {
      this.$refs.form.reset()
      this.message = ''
    },
    validForm: function () {
      this.$refs.form.validate()
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
