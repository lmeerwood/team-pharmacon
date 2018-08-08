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
                  <h4>Show Date field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFieldArray[0]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Time field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFieldArray[1]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Patient MRN field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFieldArray[2]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Patient First Name field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFieldArray[3]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Patient Surname field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFieldArray[4]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Patient Type field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFieldArray[5]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Error Type field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFieldArray[6]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Medication Given field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFieldArray[7]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Medication Type field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFieldArray[8]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Error Description/General Comment field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFieldArray[9]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Person At Fault field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFieldArray[10]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Was that person notified field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFieldArray[11]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Error Location field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFieldArray[12]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show IIMS Completed field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFieldArray[13]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Was Severity Level field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFieldArray[14]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Physician Notified field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFieldArray[15]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Physician Provider Number field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFieldArray[16]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Physician First Name field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFieldArray[17]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Physician Surname field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFieldArray[18]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Physician Comments field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFieldArray[19]"></v-checkbox>
                </v-flex>
              </v-layout>
              <v-layout row>

                <v-flex xs8 offset-xs2>
                  <h4>Show Diagnosis field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFieldArray[20]"></v-checkbox>
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
                    :disabled = arraysAreEqual()
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
import { mapGetters, mapActions } from 'vuex'

export default {
  // Imports the existing hidden/shown state of all fields from the store.
  computed: mapGetters([
    'showFields'
  ]),

  data: () => ({
    menu: false,
    msg: 'Edit Error Form',
    loading: false,
    errorMessage: '',
    message: '',
    showFieldArray: []
  }),

  methods: {
    // Maps the store mutations.
    ...mapActions([
      'setFields',
      'resetFields']),

    // Mutates the store with the updated field hidden/shown values.
    submit: function () {
      this.$store.commit('setFields', this.showFieldArray)
      this.showFieldArray = this.showFields.slice()
      this.message = 'Form updated!'
    },

    // Reverts all unsubmitted changes.
    undo: function () {
      this.showFieldArray = this.showFields.slice()
      this.message = 'Undo success!'
    },

    // Reverts store to default state - all fields enabled.
    reset: function () {
      this.$store.commit('resetFields')
      this.showFieldArray = this.showFields.slice()
      this.message = 'Form reset to default!'
    },

    // Checks whether changes have been made to the fields - used to show/hide Undo button.
    arraysAreEqual: function () {
      for (var i in this.showFieldArray) {
        if (this.showFieldArray[i] !== this.showFields[i]) {
          return false
        }
      }
      return true
    }
  },
  // On page creation, sets the checkboxes to a copy of the status from the store.
  created () {
    this.showFieldArray = this.showFields.slice()
  }
}

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .top-margin {
    margin-top: 58px;
  }
</style>
