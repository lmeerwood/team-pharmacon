
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
              <v-flex xs8 offset-xs2>
              <v-text-field
                label="Patient Name"
                v-model="patientName"
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
                  label='Error Type'
                  append-icon=""
                  return-object
                  ></v-select>
                </v-flex>
              </v-layout>
            <v-layout row>
              <v-flex xs8 offset-xs2>
              <v-btn
                @click="submit"
                :disabled="!valid"
              >Submit
              </v-btn>
              <v-btn @click="clear">clear</v-btn>
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
      { text: 'Incorrect directions', value: '0'},
      { text: 'Incorrect dosage', value: '1' },
      { text: 'Incorrect form of delivery', value: '2' },
      { text: 'Invalid batch number', value: '3' },
      { text: 'Past expiry date', value: '4' },
      { text: 'Incorrect medication', value: '5' },
      { text: 'Incorrect patient', value: '6' },
      { text: 'Incorrect quantity', value: '7' },
      { text: 'Other', value: '8' }
    ],
    patientName: '',
    patientMRN: '',
    errorType: '',
    valid: true,
    message: ''
  }),

  methods: {
    submit () {
      // Native form submission is not yet supported
      this.message = 'Error form sumbission not yet supported. Patient Name: ' + this.patientName + ' Patient MRN: ' + this.patientMRN + ' Error Type: ' + this.errorType.text
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
