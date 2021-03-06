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
                label="Error Type"
                :rules="[rules.required, rules.alphaDashApos]"
                v-model="errorType"
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
import ErrortypeService from '@/services/ErrortypeService'

export default {
  data: () => ({
    menu: false,
    msg: 'Error Type Details',
    loading: false,
    uploading: false,
    errorMessage: '',
    message: '',

    // Variables to store input values
    valid: true,
    errorTypeId: '',
    errorType: '',
    rules: {
      required: value => !!value || 'This field is required',
      alphaDashApos: value => {
        const pattern = /^([a-zA-Z-' ]+)$/
        return pattern.test(value) || 'Field must contain letters and/or dash/apostrophe only'
      }
    }
  }),
  created () {
    // Retrieve specific error type and load into the form.
    if (this.$route.query.errorTypeId) {
      ErrortypeService.getErrorType(this.$route.query.errorTypeId)
        .then(function (res, err) {
          this.errorTypeId = this.$route.query.errorTypeId
          this.errorType = res.data.errorType
        }.bind(this))
    }
  },
  methods: {
    async submit () {
      this.errorMessage = ''
      this.message = ''
      this.uploading = true
      var type = this.errorType
      var errorTypeId = this.$route.query.errorTypeId
      var values = {
        errorType: this.errorType
      }
      var currentType = await ErrortypeService.isErrorTypeValid(type)
      if (this.validForm() && currentType.data) {
        console.log('inside update error type. currentType: ' + currentType.data)
        try {
          this.clear()
          this.errorMessage = 'Error type - ' + type + ' - already exists!'
          this.uploading = false
        } catch (error) {
          this.errorMessage = error.response.data.errorType
          this.uploading = false
        }
      } else if (this.validForm() && errorTypeId !== undefined) {
        console.log('inside update error type. ID: ' + errorTypeId)
        try {
          await ErrortypeService.updateErrorType(errorTypeId, values)
          this.clear()
          this.uploading = false
          this.message = 'Record updated successfully!'
          setTimeout(function () {
            this.$router.push('/searchErrorType')
          }.bind(this), 1000)
        } catch (error) {
          this.errorMessage = error.response.data.errorType
          this.uploading = false
        }
      } else if (this.validForm()) {
        console.log('inside add error type. Values: ' + values)
        try {
          await ErrortypeService.addErrorType(values)
          this.clear()
          this.uploading = false
          this.message = 'Record added successfully!'
        } catch (error) {
          this.uploading = false
          this.errorMessage = error.response.data.errorType
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
