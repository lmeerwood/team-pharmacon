<template>
  <v-layout row class="pt-5 top-margin">
    <v-flex xs6 offset-xs3>
      <section class="page-head">
        <h1 id="introduction" class="display-1 primary--text">
          Holding Page For Search Function!!!
        </h1>
        <div>
          <p>This page provides direct links to different sections of the app. It will be removed for production.
          <br/><br/>Also, none of this layout is permanent. All of it can be changed and modified to suit the end goal. This
            was simply made to provide a starting ground.</p>
        </div>
      </section>
    </v-flex>
  </v-layout>
</template>

<script>
export default {
  name: 'HelloWorld',
  data () {
    return {
      msg: 'Pharmacy Error Tracker Debug Page'
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
