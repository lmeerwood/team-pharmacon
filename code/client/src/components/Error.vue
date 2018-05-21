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
                  <v-radio-group v-model="iimsCompleted" row=true>
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
                  <v-radio-group v-model="wasPhysicianNotified" row=true>
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
    msg: 'Error Form',
    loading: false,
    patientTypes: [
      { text: 'Discharge', value: 'Discharge' },
      { text: 'Inpatient', value: 'Inpatient' },
      { text: 'Outpatient', value: 'Outpatient' },
      { text: 'Day patient', value: 'Day patient' }
    ],
    workers: [
      { text: 'Pat Smith', value: 'Pat Smith' },
      { text: 'Timothy Myers', value: 'Timothy Myers' },
      { text: 'Jessica Noble', value: 'Jessica Noble' },
      { text: 'Amanda Stait', value: 'Amanda Stait' },
      { text: 'Wang Shu', value: 'Wang Shu' }
    ],
    errorTypes: [
      { text: 'Batch Number', value: 'Batch Number' },
      { text: 'Directions', value: 'Directions' },
      { text: 'Dosage / Strength', value: 'Dosage / Strength' },
      { text: 'Expiry Date', value: 'Expiry Date' },
      { text: 'Form Intravenous', value: 'Form Intravenous' },
      { text: 'Form Per Oral', value: 'Form Per Oral' },
      { text: 'Incorrect Medication', value: 'Incorrect Medication' },
      { text: 'Incorrect Patient', value: 'Incorrect Patient' },
      { text: 'Incorrect Quantity', value: 'Incorrect Quantity' },
      { text: 'Other', value: 'Other' }
    ],
    errorLocations: [
      { text: 'Dispensary', value: 'Dispensary' },
      { text: 'On the ward', value: 'On the ward' },
      { text: 'Outside hospital', value: 'Outside hospital' }
    ],
    medications: [
      { text: '5 mg Acetaminophen USP - Oral', value: '5 mg Acetaminophen USP - Oral' },
      { text: '7.5 mg Acetaminophen USP - Oral', value: '7.5 mg Acetaminophen USP - Oral' },
      { text: '10 mg Acetaminophen USP - Oral', value: '10 mg Acetaminophen USP - Oral' },
      { text: 'Isotretinoin - Oral', value: 'Isotretinoin - Oral' },
      { text: 'Ambien - Oral', value: 'Ambien - Oral' },
      { text: 'Diclofenac Sodium - Oral', value: 'Diclofenac Sodium - Oral' },
      { text: 'Mustargen - Intravenous', value: 'Mustargen - Intravenous' },
      { text: 'Sulfamethoxazole and trimethoprim - Oral', value: 'Sulfamethoxazole and trimethoprim - Oral' },
      { text: 'Sodium Fluoride - Oral', value: 'Sodium Fluoride - Oral' },
      { text: 'Ceftriaxone - Intravenous', value: 'Ceftriaxone - Intravenous' },
      { text: 'Claforan - Intravenous', value: 'Claforan - Intravenous' },
      { text: 'Albuterol Sulfate Inhalation Solution - Inhalation', value: 'Albuterol Sulfate Inhalation Solution - Inhalation' },
      { text: 'Azathioprine - Oral', value: 'Azathioprine - Oral' },
      { text: 'CitraNatal Harmony 2.1 - Oral', value: 'CitraNatal Harmony 2.1 - Oral' },
      { text: 'Hydrocodone Bitartrate and Acetaminophen - Oral', value: 'Hydrocodone Bitartrate and Acetaminophen - Oral' },
      { text: 'Tinnitus - Oral', value: 'Tinnitus - Oral' },
      { text: 'Atovaquone and Proguanil Hydrochloride - Oral', value: 'Atovaquone and Proguanil Hydrochloride - Oral' },
      { text: 'Succimer - Oral', value: 'Succimer - Oral' }
    ],
    severityLevels: [
      { text: 'Minor', value: 'Minor' },
      { text: 'Low', value: 'Low' },
      { text: 'Moderate-Low', value: 'Moderate-Low' },
      { text: 'Moderate', value: 'Moderate' },
      { text: 'Moderate-Severe', value: 'Moderate-Severe' },
      { text: 'Severe', value: 'Severe' }
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
    workerNotified: false,
    errorLocation: '',
    iimsCompleted: false,
    medication: '',
    severity: '',
    wasPhysicianNotified: false,
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
        console.log(this.wasPhysicianNotified.valueOf())
        var wasPhysicianNotified = (this.wasPhysicianNotified.valueOf() === 'true') ? 1 : 0
        var iimsCompleted = (this.iimsCompleted.valueOf() === 'true') ? 1 : 0
        var workerNotified = (this.workerNotified.valueOf() === 'true') ? 1 : 0
        axios.post(url,
          {
            formDate: this.date.valueOf(),
            formTime: this.time,
            formPatientFirstName: this.patientFirstName,
            formPatientSurname: this.patientSurname,
            formPatientId: this.patientId,
            formPatientType: this.patientType.valueOf(),
            formErrorType: this.errorType.valueOf(),
            formErrorComment: this.errorComment,
            formWorkerAtFault: this.workerAtFault.valueOf(),
            formWorkerNotified: workerNotified,
            formErrorLocation: this.errorLocation.valueOf(),
            formIimsCompleted: iimsCompleted,
            formMedication: this.medication.valueOf(),
            formSeverity: this.severity.valueOf(),
            formPhysicianNotified: wasPhysicianNotified,
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
              error
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
