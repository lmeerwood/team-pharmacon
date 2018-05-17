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
              ></v-text-field>
              </v-flex>
              <v-flex xs8 offset-xs1>
                <v-text-field
                label="Time hh:ss"
                v-model="time"
              ></v-text-field>
              </v-flex>
              </v-layout>

            <v-layout row>
              <v-flex xs8 offset-xs2>
              <v-text-field
                label="Patient First Name"
                v-model="patientFirstName"
              ></v-text-field>
              </v-flex>
              </v-layout>

            <v-layout row>
              <v-flex xs8 offset-xs2>
              <v-text-field
                label="Patient Surname"
                v-model="patientSurname"
              ></v-text-field>
              </v-flex>
              </v-layout>

            <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Patient MRN"
                    v-model="patientMRN"
                  ></v-text-field>
                </v-flex>
              </v-layout>

            <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-select
                  :items="errorTypes"
                  v-model="errorType"
                  label='Select an Error Type'
                  return-object
                  ></v-select>
                </v-flex>
              </v-layout>

            <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Error Description or General Comment"
                    v-model="errorDesc"
                  ></v-text-field>
                </v-flex>
              </v-layout>

            <v-layout row>
              <v-flex xs8 offset-xs2>
                <h4>Person who made the error</h4>
              <v-text-field
                label="First Name"
                v-model="workerFirstName"
              ></v-text-field>
              </v-flex>
              </v-layout>

            <v-layout row>
              <v-flex xs8 offset-xs2>
              <v-text-field
                label="Surname"
                v-model="workerSurname"
              ></v-text-field>
              </v-flex>
              </v-layout>

            <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Was the person notified?</h4>
                </v-flex>
              </v-layout>
            <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-radio-group v-model="wasPersonNotified" :mandatory="false" row= true>
                    <v-radio label="Yes" value="yes"></v-radio>
                    <v-radio label="No" value="no"></v-radio>
                  </v-radio-group>
                </v-flex>
              </v-layout>

            <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-select
                  :items="errorLocations"
                  v-model="errorLocation"
                  label='Where did the error occur?'
                  return-object
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
                  <v-radio-group v-model="wasIIMScompleted" :mandatory="false" row= true>
                    <v-radio label="Yes" value="yes"></v-radio>
                    <v-radio label="No" value="no"></v-radio>
                  </v-radio-group>
                </v-flex>
              </v-layout>

            <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Medication Name"
                    v-model="medication"
                  ></v-text-field>
                </v-flex>
              </v-layout>

            <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-select
                  :items="medicationTypes"
                  v-model="medicationType"
                  label='Medication Type'
                  return-object
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
                  <v-radio-group v-model="wasPhysicianNotified" :mandatory="false" row= true>
                    <v-radio label="Yes" value="yes"></v-radio>
                    <v-radio label="No" value="no"></v-radio>
                  </v-radio-group>
                </v-flex>
              </v-layout>

            <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Physician Name"
                    v-model="physicianName"
                    :disabled="this.wasPhysicianNotified == 'no'"
                  ></v-text-field>
                </v-flex>
              </v-layout>

            <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Physician Provider Number"
                    v-model="physicianProviderNumber"
                    :disabled="this.wasPhysicianNotified == 'no'"
                  ></v-text-field>
                </v-flex>
              </v-layout>

            <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Patient Diagnosis"
                    v-model="diagnosis"
                    :disabled="this.wasPhysicianNotified == 'no'"
                  ></v-text-field>
                </v-flex>
              </v-layout>

            <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Physician Comments"
                    v-model="physicianComments"
                    :disabled="this.wasPhysicianNotified == 'no'"
                  ></v-text-field>
                </v-flex>
              </v-layout>

            <v-layout row>
              <v-flex xs8 offset-xs2>
              <v-btn
                round
                color="primary"
                dark
                @click="submit"
                :disabled="!valid"
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
export default {
  data: () => ({
    errorTypes: [
      { text: 'Incorrect directions', value: '0' },
      { text: 'Incorrect dosage', value: '1' },
      { text: 'Incorrect form of delivery', value: '2' },
      { text: 'Invalid batch number', value: '3' },
      { text: 'Past expiry date', value: '4' },
      { text: 'Incorrect medication', value: '5' },
      { text: 'Incorrect patient', value: '6' },
      { text: 'Incorrect quantity', value: '7' },
      { text: 'Other', value: '8' }
    ],
    errorLocations: [
      { text: 'Location 1', value: '0' },
      { text: 'Location 2', value: '1' },
      { text: 'Location 3', value: '2' },
      { text: 'Other', value: '3' }
    ],
    medicationTypes: [
      { text: 'Type 1', value: '0' },
      { text: 'Type 2', value: '1' },
      { text: 'Type 3', value: '2' },
      { text: 'Other', value: '3' }
    ],
    date: '',
    time: '',
    patientFirstName: '',
    patientSurname: '',
    patientMRN: '',
    errorType: '',
    errorDesc: '',
    workerFirstName: '',
    workerSurname: '',
    wasPersonNotified: '',
    errorLocation: '',
    wasIIMScompleted: '',
    medication: '',
    medicationType: '',
    wasPhysicianNotified: '',
    physicianName: '',
    physicianProviderNumber: '',
    diagnosis: '',
    physicianComments: '',
    valid: true,
    message: '',
    msg: 'Submit an Error'
  }),

  methods: {
    submit () {
      // Native form submission is not yet supported
      this.message = 'Error form sumbission not yet supported. Date ' +
      this.date + ' Time ' + this.time +
      ' Patient FirstName: ' +
      this.patientFirstName +
      ' Patient Surname: ' +
      this.patientSurname +
      ' Patient MRN: ' +
      this.patientMRN +
      ' Error Type: ' +
      this.errorType.text +
      ' Worker FirstName: ' +
      this.workerFirstName +
      ' Worker Surname: ' +
      this.workerSurname +
      ' IIMS Completed: ' +
      this.wasIIMScompleted
    },
    clear () {
      this.$refs.form.reset()
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
