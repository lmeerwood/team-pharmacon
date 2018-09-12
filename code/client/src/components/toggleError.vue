<template>
  <v-layout row class="pt-5 top-margin">
    <v-flex xs6 offset-xs3>
      <section class="page-head">
        <h1 id="introduction" class="display-1 primary--text">
          {{msg}}
        </h1>
        <fieldset class="white">
            <v-container fluid>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Date field? If hidden, the date the form was submitted will be used.</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="fields.showDate" @change="noChanges=false"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Time field? If hidden, the time the form was submitted will be used.</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="fields.showTime" @change="noChanges=false"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Patient information fields?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="fields.showPatientFields" @change="noChanges=false"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Error Type field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="fields.showErrorType" @change="noChanges=false"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Medication fields?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="fields.showMedicationFields" @change="noChanges=false"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Person At Fault fields?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="fields.showWorker" @change="noChanges=false"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Was that person notified field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="fields.showWorkerNotified" @change="noChanges=false"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Error Location field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="fields.showLocation" @change="noChanges=false"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show IIMS Completed field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="fields.showIIMScompleted" @change="noChanges=false"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Was Severity Level field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="fields.showSeverity" @change="noChanges=false"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Physician information fields?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="fields.showPhysicianFields" @change="noChanges=false"></v-checkbox>
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
                    @click="submit()"
                  >Submit
                  </v-btn>
                  <v-btn
                    round color="secondary"
                    dark
                    @click="reset()"
                    >
                    Reset to Default
                  </v-btn>
                  <v-btn
                    round color="secondary"
                    dark
                    @click="undo()"
                    :disabled = "noChanges"
                    >
                    Undo Changes
                  </v-btn>

                </v-flex>
              </v-layout>
            </v-container>
        </fieldset>
      </section>
    </v-flex>
  </v-layout>
</template>

<script>
import HiddenFieldsService from '@/services/HiddenFieldsService'

export default {
  data: () => ({
    menu: false,
    msg: 'Edit Error Form',
    loading: false,
    errorMessage: '',
    message: '',
    fields: {
      showDate: true,
      showTime: true,
      showPatientFields: true,
      showErrorType: true,
      showMedicationFields: true,
      showWorker: true,
      showWorkerNotified: true,
      showLocation: true,
      showIIMScompleted: true,
      showSeverity: true,
      showPhysicianFields: true
    },
    noChanges: false
  }),

  methods: {
    // Mutates the store with the updated field hidden/shown values.
    async submit () {
      this.message = ''
      var selector = 1

      try {
        await HiddenFieldsService.updateHiddenFields(selector, this.fields)
        this.message = 'Form updated!'
      } catch (error) {
        this.errorMessage = error.response.data.error
      }
      this.noChanges = true
    },

    // Reverts all unsubmitted changes.
    undo: function () {
      var selector = 1
      HiddenFieldsService.getHiddenFields(selector)
        .then(function (res, err) {
          if (!res.data[1]) {
            this.fields = res.data[0]
          }
        }.bind(this))
      this.noChanges = true
      this.message = 'Undo success!'
    },

    // Reverts store to default state - all fields enabled.
    async reset () {
      Object.keys(this.fields).forEach(key => { this.fields[key] = true })
      this.message = ''
      try {
        await HiddenFieldsService.updateHiddenFields(1, this.fields)
        this.message = 'Form reset to default!'
      } catch (error) {
        this.errorMessage = error.response.data.error
      }
      this.noChanges = true
    }

  },
  // On page creation, sets the checkboxes to a copy of the status from the store.
  created () {
    HiddenFieldsService.getHiddenFields(1)
      .then(function (res, err) {
        if (!res.data[1]) {
          this.fields = res.data[0]
        }
      }.bind(this))
    this.noChanges = true
  }
}

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .top-margin {
    margin-top: 58px;
  }
</style>
