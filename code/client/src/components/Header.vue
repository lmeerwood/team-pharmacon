<template>
  <v-toolbar fixed>
    <v-toolbar-title class="mr-4">
      Pharmacy Error Tracker
    </v-toolbar-title>
    <v-spacer></v-spacer>
    <v-toolbar-items v-if="authlevel !== 0" >
      <v-btn :to="{name:'Error'}" flat>Log Error</v-btn>
      <v-btn :to="{name:'searchError'}" v-if="authlevel === 2" flat>Search Errors</v-btn>
      <v-btn :to="{name:'Worker'}" v-if="authlevel === 2" flat>Manage Workers</v-btn>
      <v-btn :to="{name:'searchWorker'}" v-if="authlevel === 2" flat>Search Workers</v-btn>
      <v-btn :to="{name:'Physician'}" v-if="authlevel === 2" flat>Manage Physicians</v-btn>
      <v-btn :to="{name:'toggleError'}" v-if="authlevel === 2" flat>Edit Form</v-btn>
      <v-btn href="http://18.188.218.170:17050" v-if="authlevel === 2" flat>Reporting</v-btn>
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
