
<template>
  <v-layout row class="pt-5 top-margin">
    <v-flex xs6 offset-xs3>
      <section class="page-head">
        <h1 id="introduction" class="display-1 primary--text">
          Physician Details
        </h1>
      </section>
        <v-card
          color="blue-grey darken-2"
          class="white--text top-buffer mb-2"
          v-for="physcian in physicians"
          :key="physcian.idPhysician">
          <v-card-title primary-title>
            <div class="headline">Physician Name: {{ physcian.physicianName }}</div>
          </v-card-title>
          <v-card-text>
            <div>Provider Number: {{ physcian.providerNumber }}<br/>
              Comment: {{ physcian.physicianComment }}<br/>
            </div>
          </v-card-text>
        </v-card>

        <v-layout row>
          <v-flex xs8 offset-xs2>
          <p>{{ message }}</p>
          </v-flex>
        </v-layout>
    </v-flex>
  </v-layout>
  </template>

<script>
var axios = require('axios')
export default {
  data: () => ({
    physicians: [],
    message: ''
  }),

  methods: {
    loadPhysicians: function () {
      // We want to do a GET function from our API using Axios.
      var url = 'http://localhost:3000/api/v1/query/physician'
      axios.get(url)
        .then(function (response) {
          this.physicians = response.data.response
          this.message = ''
        }.bind(this))
    }
  },
  beforeMount () {
    this.message = 'Loading all the Physicians now'
    this.loadPhysicians()
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.v-card {
  margin-bottom: 40px;
}
</style>
