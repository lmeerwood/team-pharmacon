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
                label="Worker's ID number"
                :rules="[() => !!id || 'This field is required']"
                required
                v-model="id"
              ></v-text-field>
              </v-flex>
              </v-layout>

            <v-layout row>
              <v-flex xs8 offset-xs2>
              <v-text-field
                label="Worker's First Name"
                :rules="[() => !!workerFirstName || 'This field is required']"
                required
                v-model="workerFirstName"
              ></v-text-field>
              </v-flex>
              </v-layout>

            <v-layout row>
              <v-flex xs8 offset-xs2>
              <v-text-field
                label="Worker's Surname"
                ::rules="[() => !!workerSurname || 'This field is required']"
                required
                v-model="workerSurname"
              ></v-text-field>
              </v-flex>
            </v-layout>

            <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Worker's Position"
                    :rules="[() => !!workerRole || 'This field is required']"
                    v-model="workerRole"
                  ></v-text-field>
                </v-flex>
              </v-layout>

            <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Is this worker active?</h4>
                </v-flex>
              </v-layout>
            <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-radio-group v-model="workerActive" :mandatory="true" row="row">
                    <v-radio label="Yes" value=true></v-radio>
                    <v-radio label="No" value=false></v-radio>
                  </v-radio-group>
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
import WorkerService from '@/services/WorkerService'

export default {
  data: () => ({
    menu: false,
    msg: 'Worker Details',
    loading: false,
    errorMessage: '',
    message: '',

    // Variables to store input values
    valid: true,
    id: null,
    workerFirstName: '',
    workerSurname: '',
    workerRole: '',
    workerActive: false
  }),
  created () {
    // Retrieve specific worker and load into the form.
    if (this.$route.query.id) {
      WorkerService.getWorker(this.$route.query.id)
        .then(function (res, err) {
          var workerActive = (res.data.workerActive.valueOf() === 1) ? 'true' : 'false'

          this.id = res.data.id
          this.workerFirstName = res.data.workerFirstName
          this.workerSurname = res.data.patient.workerSurname
          this.workerRole = res.data.patient.workerRole
          this.workerActive = workerActive
        }.bind(this))
    }

    // These go through and retrieve the values from the server to load into the
    // textfields in the form

    // Worker
    WorkerService.getAll()
      .then(function (res, err) {
        this.workers = []
        var i
        for (i = 0; i < res.data.length; i++) {
          if (res.data[i].workerActive) {
            // Combine the worker details into 'Surname, FirstName'
            var name = res.data[i].workerSurname + ', ' + res.data[i].workerFirstName
            this.workers.push({
              value: res.data[i].id,
              text: name
            })
          }
        }
        // Sort the array by the text field rather than the value
        this.workers.sort(function (a, b) {
          return a['text'].localeCompare(b['text'])
        })
      }.bind(this))
  },
  methods: {
    async submit () {
      this.errorMessage = ''
      this.message = ''
      if (this.validForm()) {
        try {
          var workerActive = (res.data.workerActive.valueOf() === 1) ? 'true' : 'false'

          await WorkerService.logError({
            id: this.id,
            workerFirstName: this.workerFirstName,
            workerSurname: this.workerSurname,
            patientFirstName: this.patientFirstName,
            patientSurname: this.patientSurname,
            workerRole: this.workerRole,
            workerActive: workerActive
          })
          this.clear()
          this.message = 'Form submitted successfully!'
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
.top-margin {
    margin-top: 58px;
  }
</style>
