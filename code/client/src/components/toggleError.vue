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
                  <h4>{{showFieldArray}}</h4>
                </v-flex>
              </v-layout>
              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>{{showFields}}</h4>
                </v-flex>
              </v-layout>

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
                  <h4>Show DPatient Surname field?</h4>
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
    ...mapActions([
      'setFields',
      'resetFields']),

    submit: function () {
      this.$store.commit('setFields', this.showFieldArray)
      this.showFieldArray = this.showFields.slice()
      console.log('showFields is: ' + this.showFields)
      console.log('showFieldArray is: ' + this.showFieldArray)
      this.message = 'Form updated!'
    },

    undo: function () {
      console.log('showFields is: ' + this.showFields)
      console.log('showFieldArray is: ' + this.showFieldArray)
      this.showFieldArray = this.showFields.slice()
      console.log('showFields is: ' + this.showFields)
      console.log('showFieldArray is: ' + this.showFieldArray)

      this.message = 'Undo success!'
    },

    reset: function () {
      this.$store.commit('resetFields')
      console.log('showFields is: ' + this.showFields)
      this.showFieldArray = this.showFields.slice()
      console.log('showFieldArray is: ' + this.showFieldArray)
    },

    arraysAreEqual: function () {
      console.log('Checking arrays are equal')
      console.log('showFields is: ' + this.showFields)
      console.log('showFieldArray is: ' + this.showFieldArray)

      for (var i in this.showFieldArray) {
        console.log('Comparing Field ' + i + 'is not equal: ' + this.showFieldArray[i] + 'vs' + this.showFields[i])
        if (this.showFieldArray[i] !== this.showFields[i]) {
          console.log('Field ' + i + 'is not equal: ' + this.showFieldArray[i] + 'vs' + this.showFields[i])
          return false
        }
      }
      console.log('Arrays are equal')
      return true
    }
  },

  created () {
    console.log('showFields is: ' + this.showFields)
    this.showFieldArray = this.showFields.slice()
    console.log('showFieldArray is: ' + this.showFieldArray)
  }
}

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .top-margin {
    margin-top: 58px;
  }
</style>
