<template>
  <v-layout row class="pt-5 top-margin">
    <v-flex xs6 offset-xs3>
      <fieldset class="white">
        <section class="page-head">
          <h1 id="introduction" class="display-1 text-lg-center">
            {{msg}}
          </h1>
          <div>
            <p></p>
            <h3 class="text-md-center">This page provides direct links to different sections of the app.</h3>
            <p></p>
            <h3 class="text-sm-center">To navigate to a section, select one of the buttons below.</h3>
            <br/><br/>
          </div>
        </section>
        <section>
          <v-layout align-center column>
            <v-flex xs12 sm4 text-xs-center>
              <div>
                <v-btn
                  round color="primary"
                  dark
                  :to="{name: 'Error'}">
                  Log Error
                </v-btn>
              </div>
              <div>
                <v-btn
                  round color="primary"
                  dark
                  :to="{name: 'searchError'}">
                  Search Errors
                </v-btn>
              </div>
              <div>
                <v-btn
                  round color="primary"
                  dark
                  :to="{name: 'searchErrorType'}">
                  Search Error Types
                </v-btn>
              </div>
              <div>
                <v-btn
                  round color="primary"
                  dark
                  :to="{name: 'searchMedicationType'}">
                  Search Medication Types
                </v-btn>
              </div>
              <div>
                <v-btn
                  round color="primary"
                  dark
                  :to="{name: 'searchPatientType'}">
                  Search Patient Types
                </v-btn>
              </div>
              <div>
                <v-btn
                  round color="primary"
                  dark
                  :to="{name: 'searchPhysician'}">
                  Search Physicians
                </v-btn>
              </div>
              <div>
                <v-btn
                  round color="primary"
                  dark
                  :to="{name: 'searchUser'}">
                  Search Users
                </v-btn>
              </div>
              <div>
                <v-btn
                  round color="primary"
                  dark
                  :to="{name: 'searchWorker'}">
                  Search Workers
                </v-btn>
              </div>
              <div>
                <v-btn
                  round color="primary"
                  dark
                  :to="{name: 'toggleError'}">
                  Manage Error Form
                </v-btn>
              </div>
              <div>
                <v-btn
                  round color="primary"
                  dark
                  :to="{name: 'ErrorType'}">
                  Manage Error Types
                </v-btn>
              </div>
              <div>
                <v-btn
                  round color="primary"
                  dark
                  :to="{name: 'MedicationType'}">
                  Manage Medication Types
                </v-btn>
              </div>
              <div>
                <v-btn
                  round color="primary"
                  dark
                  :to="{name: 'PatientType'}">
                  Manage Patient Types
                </v-btn>
              </div>
              <div>
                <v-btn
                  round color="primary"
                  dark
                  :to="{name: 'User'}">
                  Manage Users
                </v-btn>
              </div>
              <div>
                <v-btn
                  round color="primary"
                  dark
                  :to="{name: 'Worker'}">
                  Manage Workers
                </v-btn>
              </div>
              <div>
                <v-btn
                  round color="primary"
                  dark
                  :to="{name: 'downloadData'}">
                  Download Data
                </v-btn>
              </div>
              <div>
                <v-btn
                  href="http://18.188.218.170:17050"
                  round color="primary"
                  dark>
                  Reporting</v-btn>
              </div>
              </v-flex>
              </v-layout>
              <div>
            <br/><br/>
          </div>
        </section>
      </fieldset>
    </v-flex>
  </v-layout>
</template>

<script>
export default {
  name: 'HelloWorld',
  data () {
    return {
      msg: 'Welcome to Pharmacy Error Tracker'
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.top-margin {
  margin-top: 40px;
}
</style>
