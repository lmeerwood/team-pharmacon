<template>
  <v-toolbar fixed>
    <v-toolbar-title class="mr-4">
      Pharmacy Error Tracker
    </v-toolbar-title>
    <v-spacer></v-spacer>
    <v-toolbar-items v-if="authlevel !== 0" >
      <v-btn :to="{name:'Main'}" v-if="authlevel === 2" flat>Main</v-btn>
      <v-btn :to="{name:'Error'}" flat>Log Error</v-btn>
      <v-btn :to="{name:'Physician'}" v-if="authlevel === 2" flat>Manage Physicians</v-btn>
      <v-btn href="https://localhost:17050" v-if="authlevel === 2" flat>Reporting</v-btn>
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
      this.$router.push('/')
    }
  }
}
</script>

<style scoped>

</style>
