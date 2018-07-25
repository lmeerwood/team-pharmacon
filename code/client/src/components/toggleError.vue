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
                  <h4>Show Date field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFields[0]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Time field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFields[1]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Patient MRN field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFields[2]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Patient First Name field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFields[3]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show DPatient Surname field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFields[4]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Patient Type field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFields[5]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Error Type field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFields[6]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Medication Given field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFields[7]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Medication Type field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFields[8]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Error Description/General Comment field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFields[9]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Person At Fault field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFields[10]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Was that person notified field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFields[11]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Error Location field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFields[12]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show IIMS Completed field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFields[13]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Was Severity Level field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFields[14]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Physician Notified field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFields[15]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Physician Provider Number field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFields[16]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Physician First Name field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFields[17]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Physician Surname field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFields[18]"></v-checkbox>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Show Physician Comments field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFields[19]"></v-checkbox>
                </v-flex>
              </v-layout>
              <v-layout row>

                <v-flex xs8 offset-xs2>
                  <h4>Show Diagnosis field?</h4>
                </v-flex>
                <v-flex xs8 offset-xs2>
                  <v-checkbox v-model="showFields[20]"></v-checkbox>
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
                    @click="setFields(showFields)"
                  >Submit
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
    message: ''

  }),

  methods: mapActions([
    'setFields'
  ])

}

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .top-margin {
    margin-top: 58px;
  }
</style>
