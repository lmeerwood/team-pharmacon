<template>
  <v-toolbar fixed>
    <v-toolbar-title class="mr-4">
      Pharmacy Error Tracker
    </v-toolbar-title>
    <v-spacer></v-spacer>
    <v-toolbar-items v-if="authlevel !== 0" >
      <v-btn :to="{name:'adminWelcome'}" v-if="authlevel === 2" flat>Admin Home</v-btn>
      <v-btn :to="{name:'Error'}" flat v-if="authlevel === 2">Log Error</v-btn>

      <v-menu open-on-hover open-delay=50 offset-y bottom v-if="authlevel === 2">
        <v-btn flat slot="activator">
          Search...
          <v-icon>arrow_drop_down</v-icon>
        </v-btn>
        <v-list>

          <v-list-tile>
            <v-list-tile-action>
              <v-btn :to="{name:'searchError'}" v-if="authlevel === 2" flat>Search Errors</v-btn>
            </v-list-tile-action>
          </v-list-tile>

          <v-list-tile>
            <v-list-tile-action>
              <v-btn :to="{name:'searchErrorType'}" v-if="authlevel === 2" flat>Search Error Types</v-btn>
            </v-list-tile-action>
          </v-list-tile>

          <v-list-tile>
            <v-list-tile-action>
              <v-btn :to="{name:'searchMedicationType'}" v-if="authlevel === 2" flat>Search Medication Types</v-btn>
            </v-list-tile-action>
          </v-list-tile>

          <v-list-tile>
            <v-list-tile-action>
              <v-btn :to="{name:'searchPatientType'}" v-if="authlevel === 2" flat>Search Patient Types</v-btn>
            </v-list-tile-action>
          </v-list-tile>

          <v-list-tile>
            <v-list-tile-action>
              <v-btn :to="{name:'searchPhysician'}" v-if="authlevel === 2" flat>Search Physician</v-btn>
            </v-list-tile-action>
          </v-list-tile>

          <v-list-tile>
            <v-list-tile-action>
              <v-btn :to="{name:'searchWorker'}" v-if="authlevel === 2" flat>Search Workers</v-btn>
            </v-list-tile-action>
          </v-list-tile>
          <v-list-tile>
            <v-list-tile-action>
              <v-btn :to="{name:'searchUser'}" v-if="authlevel === 2" flat>Search Users</v-btn>
            </v-list-tile-action>
          </v-list-tile>
        </v-list>
      </v-menu>

      <v-menu open-on-hover open-delay=50 offset-y bottom v-if="authlevel === 2" >
        <v-btn flat slot="activator">
          Manage...
          <v-icon>arrow_drop_down</v-icon>
        </v-btn>

        <v-list>
          <v-list-tile>
            <v-list-tile-action>
              <v-btn :to="{name:'toggleError'}" v-if="authlevel === 2" flat>Manage Error Form</v-btn>
            </v-list-tile-action>
          </v-list-tile>

          <v-list-tile>
            <v-list-tile-action>
              <v-btn :to="{name:'ErrorType'}" v-if="authlevel === 2" flat>Manage Error Type</v-btn>
            </v-list-tile-action>
          </v-list-tile>

          <v-list-tile>
            <v-list-tile-action>
              <v-btn :to="{name:'MedicationType'}" v-if="authlevel === 2" flat>Manage Medication Type</v-btn>
            </v-list-tile-action>
          </v-list-tile>

          <v-list-tile>
            <v-list-tile-action>
              <v-btn :to="{name:'PatientType'}" v-if="authlevel === 2" flat>Manage Patient Type</v-btn>
            </v-list-tile-action>
          </v-list-tile>

          <v-list-tile>
            <v-list-tile-action>
              <v-btn :to="{name:'User'}" v-if="authlevel === 2" flat>Manage Users</v-btn>
            </v-list-tile-action>
          </v-list-tile>

          <v-list-tile>
            <v-list-tile-action>
              <v-btn :to="{name:'Worker'}" v-if="authlevel === 2" flat>Manage Workers</v-btn>
            </v-list-tile-action>
          </v-list-tile>
        </v-list>
      </v-menu>

      <v-menu open-on-hover open-delay=50 offset-y bottom v-if="authlevel === 2" >
        <v-btn flat slot="activator">
          Reports...
          <v-icon>arrow_drop_down</v-icon>
        </v-btn>
        <v-list>
          <v-list-tile>
            <v-list-tile-action>
              <v-btn href="http://18.188.218.170:17050" v-if="authlevel === 2" flat>Reporting</v-btn>
            </v-list-tile-action>
          </v-list-tile>
        </v-list>
      </v-menu>
      <v-btn href="/resources/UserGuide.pdf" flat>Help</v-btn>
      <v-btn @click="logout" flat>Logout</v-btn>
    </v-toolbar-items>
  </v-toolbar>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  computed: {
    ...mapGetters({
      authlevel: 'auth'
    })
  },
  methods: {
    logout: function () {
      this.$store.dispatch('logout')
      this.$router.push('/login')
    }
  }
}

</script>

<style scoped>

</style>
