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
                :rules="[() => !!workerId || 'This field is required']"
                required
                v-model="workerId"
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
                    :rules="[() => !!WorkerRole || 'This field is required']"
                    v-model="WorkerRole"
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
    workerId: null,
    workerFirstName: '',
    workerSurname: '',
    WorkerRole: '',
    workerActive: false
  }),
  created () {
    // Retrieve specific worker and load into the form.
    if (this.$route.query.workerId) {
      debugger
      WorkerService.getWorker(this.$route.query.workerId)
        .then(function (res, err) {
          var workerActive = (res.data.workerActive.valueOf() === 1) ? 'true' : 'false'

          this.workerId = this.$route.query.workerId
          this.workerFirstName = res.data.workerFirstName
          this.workerSurname = res.data.patient.workerSurname
          this.WorkerRole = res.data.patient.WorkerRole
          this.workerActive = workerActive
        }.bind(this))
    }
  },
  methods: {
    async submit () {
      debugger
      this.errorMessage = ''
      this.message = ''
      var workerId = this.workerId
      var workerActive = (this.workerActive.valueOf() === 'true') ? 1 : 0
      var values = {
        id: workerId,
        workerFirstName: this.workerFirstName,
        workerSurname: this.workerSurname,
        WorkerRole: this.WorkerRole,
        workerActive: workerActive
      }
      if (this.validForm()) {
        try {
          await WorkerService.updateWorker(workerId, values)
          this.clear()
          this.message = 'Record updated successfully!'
        } catch (error) {
          this.errorMessage = error.response.data.worker
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
