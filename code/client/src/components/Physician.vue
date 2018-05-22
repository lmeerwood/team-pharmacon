
<template>
  <v-layout row class="pt-5 top-margin">
    <v-flex xs6 offset-xs3>
      <section class="page-head">
        <h1 id="introduction" class="display-1 primary--text">
          Physician Details
        </h1>
        <fieldset class="white">
          <v-form v-model="valid" ref="form" lazy-validation>
          <v-container fluid>

            <v-layout row>
              <v-flex xs8 offset-xs2>
              <v-text-field
                label="Physician Name"
                :rules="[(v) => v.length <= 45 || 'Max 45 characters']"
                :counter="45"
                v-model="physicianName"
              ></v-text-field>
              </v-flex>
              </v-layout>

            <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Provider Number"
                    :rules="[(v) => v.length <= 15 || 'Max 15 characters']"
                    :counter="15"
                    v-model="providerNo"
                  ></v-text-field>
                </v-flex>
              </v-layout>

            <v-layout row>
              <v-flex xs8 offset-xs2>
                <v-text-field
                  label="Physician Comments"
                  :rules="[(v) => v.length <= 150 || 'Max 150 characters']"
                  :counter="150"
                  v-model="physicianComments"
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
              <v-flex xs4>
                <v-btn
                  :to="{name:'viewPhysician'}"
                  round
                  color="primary"
                  dark
                >View All
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
    physicianName: '',
    providerNo: '',
    physicianComments: '',
    valid: true,
    message: ''
  }),

  methods: {
    submit: function () {
      // Axios is the library used to send data to the API. First, make sure you have your server AND your Vue running.
      // First, verify the form input is valid:
      if (this.validForm()) {
        this.message = ''
        // Next, we'll do a POST call to the API using Axios
        // Axios takes a URL and an object.

        var url = 'http://localhost:3000/api/v1/query/physician'
        axios.post(url,
          {
            // Below are the name: value pairs we are sending. In my case, I have name, number and comment.
            // These are whatever you called them when you made the API.
            name: this.physicianName,
            number: this.providerNo,
            comment: this.physicianComments
          })
        // This is what we want to do AFTER the POST request is finished. In my case, I want to make sure the response
        // was valid and then display a confirmation message at the bottom of the screen.
          .then(function (response) {
            if (response.data['status'] === 200) {
              this.message = 'Physician added successfully.'
              this.clear()
            }
          }.bind(this)) // This bind() function allows you to use the 'this' keyword inside the then() function.
          // Then finally a catch function in case the server can't add the new value for whatever reason.
          .catch(function (error) {
            this.message = 'There was an error adding the Physician: ' +
              error.stack
          }.bind(this))
      } else {
        this.message = 'There was an error with your form.'
      }
    },
    clear: function () {
      this.$refs.form.reset()
    },
    validForm: function () {
      return true
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
