
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
                label="Physician Surname"
                :rules="[rules.required, rules.alphaDashApos]"
                v-model="physicianSurname"
              ></v-text-field>
              </v-flex>
              </v-layout>

            <v-layout row>
              <v-flex xs8 offset-xs2>
              <v-text-field
                label="Physician First Name"
                :rules="[rules.required, rules.alphaDash]"
                v-model="physicianFirstName"
              ></v-text-field>
              </v-flex>
              </v-layout>

            <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Provider Number"
                    :rules="[rules.required, rules.alphaDNum]"
                    v-model="providerNumber"
                  ></v-text-field>
                </v-flex>
              </v-layout>

            <v-layout row>
              <v-flex xs8 offset-xs2>
                <v-text-field
                  label="Physician Comment"
                  v-model="physicianComment"
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
import PhysicianService from '@/services/PhysicianService'

export default {
  data: () => ({
    menu: false,
    msg: 'Physician Details',
    loading: false,
    errorMessage: '',
    message: '',

    // Variables to store input values
    valid: true,
    physicianSurname: null,
    physicianFirstName: '',
    providerNumber: '',
    physicianComment: '',
    rules: {
      required: value => !!value || 'This field is required',
      alphaNum: value => {
        const pattern = /^([a-zA-Z0-9]+)$/
        return pattern.test(value) || 'Field must be numeric only'
      },
      alphaDash: value => {
        const pattern = /^([a-zA-Z-]+)$/
        return pattern.test(value) || 'Field must contain letters and/or dash only'
      },
      alphaDashApos: value => {
        const pattern = /^([a-zA-Z-']+)$/
        return pattern.test(value) || 'Field must contain letters and/or dash/apostrophe only'
      }
    }
  }),
  created () {
    // Retrieve specific physician and load into the form.
    if (this.$route.query.physicianId) {
      PhysicianService.getPhysician(this.$route.query.physicianId)
        .then(function (res, err) {
          this.physicianId = this.$route.query.physicianId
          this.physicianSurname = res.data.physicianSurname
          this.physicianFirstName = res.data.physicianFirstName
          this.providerNumber = res.data.providerNumber
          this.physicianComment = res.data.physicianComment
        }.bind(this))
    }
  },

  methods: {
    async submit () {
      this.errorMessage = ''
      this.message = ''
      var physicianId = this.$route.query.physicianId
      var values = {
        physicianSurname: this.physicianSurname,
        physicianFirstName: this.physicianFirstName,
        providerNumber: this.providerNumber,
        physicianComment: this.physicianComment
      }
      if (this.validForm() && physicianId != null) {
        try {
          await PhysicianService.updatePhysician(physicianId, values)
          this.clear()
          this.message = 'Record updated successfully!'
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

</style>
