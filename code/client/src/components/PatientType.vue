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
                label="Patient Type"
                :rules="[rules.required, rules.alphaDashApos]"
                v-model="patientType"
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
import PatienttypeService from '@/services/PatienttypeService'

export default {
  data: () => ({
    menu: false,
    msg: 'Patient Type Details',
    loading: false,
    errorMessage: '',
    message: '',

    // Variables to store input values
    valid: true,
    patientTypeId: '',
    patientType: '',
    rules: {
      required: value => !!value || 'This field is required',
      alphaDashApos: value => {
        const pattern = /^([a-zA-Z-' ]+)$/
        return pattern.test(value) || 'Field must contain letters and/or dash/apostrophe only'
      }
    }
  }),
  created () {
    // Retrieve specific patient type and load into the form.
    if (this.$route.query.patientTypeId) {
      PatienttypeService.getPatientType(this.$route.query.patientTypeId)
        .then(function (res, err) {
          this.patientTypeId = this.$route.query.patientTypeId
          this.patientType = res.data.patientType
        }.bind(this))
    }
  },
  methods: {
    async submit () {
      this.errorMessage = ''
      this.message = ''
      var type = this.patientType
      var patientTypeId = this.$route.query.patientTypeId
      console.log('inside methods submit patient type. ID: ' + this.$route.query.patientTypeId)
      console.log('inside methods submit patient type. ID: ' + this.patientType)
      var values = {
        patientType: this.patientType
      }
      var currentType = await PatienttypeService.isPatientTypeValid(type)
      if (this.validForm() && currentType.data) {
        console.log('inside update patient type. currentType: ' + currentType.data)
        try {
          this.clear()
          this.errorMessage = 'Error type - ' + type + ' - already exists!'
        } catch (error) {
          this.errorMessage = error.response.data.errorType
        }
      } else if (this.validForm() && patientTypeId !== undefined) {
        console.log('inside update patient type. ID: ' + patientTypeId + ' type: ' + values)
        try {
          await PatienttypeService.updatePatientType(patientTypeId, values)
          this.clear()
          this.message = 'Record updated successfully!'
        } catch (error) {
          this.errorMessage = error.response.data.patientType
        }
      } else if (this.validForm()) {
        console.log('inside add patient type. Values: ' + this.patientType)
        try {
          await PatienttypeService.addPatientType(values)
          this.clear()
          this.message = 'Record added successfully!'
        } catch (error) {
          this.errorMessage = error.response.data.patientType
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
