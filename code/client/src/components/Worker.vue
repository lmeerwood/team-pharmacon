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
                :rules="[rules.required, rules.idNumber]"
                :disabled="this.$route.query.workerId !== undefined"
                v-model="workerId"
              ></v-text-field>
              </v-flex>
              </v-layout>

            <v-layout row>
              <v-flex xs8 offset-xs2>
              <v-text-field
                label="Worker's First Name"
                :rules="[rules.required, rules.workerFN]"
                v-model="workerFirstName"
              ></v-text-field>
              </v-flex>
              </v-layout>

            <v-layout row>
              <v-flex xs8 offset-xs2>
              <v-text-field
                label="Worker's Surname"
                :rules="[rules.required, rules.workerSN]"
                v-model="workerSurname"
              ></v-text-field>
              </v-flex>
            </v-layout>

            <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Worker's Position"
                    :rules="[rules.required, rules.role]"
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
    workerActive: false,
    currentWorker: '',
    rules: {
      required: value => !!value || 'This field is required',
      idNumber: value => {
        const pattern = /^([0-9]+)$/
        return pattern.test(value) || 'Invalid Worker Id entered. Must be numeric only'
      },
      workerFN: value => {
        const pattern = /^([a-zA-Z-]+)$/
        return pattern.test(value) || 'First Name must contain letters and/or dash only'
      },
      workerSN: value => {
        const pattern = /^([a-zA-Z-']+)$/
        return pattern.test(value) || 'Surname must contain letters and/or dash/apostrophe only'
      },
      role: value => {
        const pattern = /^([a-zA-Z]+)$/
        return pattern.test(value) || 'Worker role contain letters only'
      }
    }
  }),
  created () {
    // Retrieve specific worker and load into the form.
    if (this.$route.query.workerId) {
      WorkerService.getWorker(this.$route.query.workerId)
        .then(function (res, err) {
          this.workerId = this.$route.query.workerId
          this.workerFirstName = res.data.workerFirstName
          this.workerSurname = res.data.workerSurname
          this.WorkerRole = res.data.WorkerRole
          this.workerActive = res.data.workerActive ? 'true' : 'false'
        }.bind(this))
    }
  },
  methods: {
    async submit () {
      this.errorMessage = ''
      this.message = ''
      this.currentWorker = ''
      var workerId = this.workerId
      var worker = this.$route.query.workerId
      var workerActive = (this.workerActive.valueOf() === 'true') ? 1 : 0
      var values = {
        id: workerId,
        workerFirstName: this.workerFirstName,
        workerSurname: this.workerSurname,
        WorkerRole: this.WorkerRole,
        workerActive: workerActive
      }
      var currentWorker = await WorkerService.isWorkerValid(workerId)
      if (this.validForm() && currentWorker.data && worker === undefined) {
        try {
          this.errorMessage = 'Worker ID already exists, please check your input'
        } catch (error) {
          this.errorMessage = error.response.data.worker
        }
      } else if (this.validForm() && worker !== undefined) {
        try {
          await WorkerService.updateWorker(workerId, values)
          this.clear()
          this.message = 'Record updated successfully!'
        } catch (error) {
          this.errorMessage = error.response.data.worker
        }
      } else if (this.validForm()) {
        try {
          await WorkerService.logWorker(values)
          this.clear()
          this.message = 'Record added successfully!'
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
