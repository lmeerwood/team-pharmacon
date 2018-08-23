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
                label="Medication Type"
                :rules="[rules.required, rules.alphaDashApos]"
                v-model="medicationType"
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
import MedicationtypeService from '@/services/MedicationtypeService'

export default {
  data: () => ({
    menu: false,
    msg: 'Medication Type Details',
    loading: false,
    errorMessage: '',
    message: '',

    // Variables to store input values
    valid: true,
    medicationTypeId: '',
    medicationType: '',
    rules: {
      required: value => !!value || 'This field is required',
      alphaDashApos: value => {
        const pattern = /^([a-zA-Z-' ]+)$/
        return pattern.test(value) || 'Field must contain letters and/or dash/apostrophe only'
      }
    }
  }),
  created () {
    // Retrieve specific medication type and load into the form.
    if (this.$route.query.medicationTypeId) {
      MedicationtypeService.getMedicationType(this.$route.query.medicationTypeId)
        .then(function (res, err) {
          this.medicationTypeId = this.$route.query.medicationTypeId
          this.medicationType = res.data.medicationType
        }.bind(this))
    }
  },
  methods: {
    async submit () {
      this.errorMessage = ''
      this.message = ''
      var medicationTypeId = this.$route.query.medicationTypeId
      var values = {
        medicationType: this.medicationType
      }
      if (this.validForm() && medicationTypeId !== undefined) {
        console.log('inside update medication type. ID: ' + medicationTypeId)
        try {
          await MedicationtypeService.updateMedicationType(medicationTypeId, this.medicationType)
          this.clear()
          this.message = 'Record updated successfully!'
        } catch (error) {
          this.errorMessage = error.response.data.errorType
        }
      } else if (this.validForm()) {
        console.log('inside add medication type. Values: ' + this.medicationType)
        try {
          await MedicationtypeService.addMedicationType(this.medicationType)
          this.clear()
          this.message = 'Record added successfully!'
        } catch (error) {
          this.errorMessage = error.response.data.errorType
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
