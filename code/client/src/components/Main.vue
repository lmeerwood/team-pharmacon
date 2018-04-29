<template>
  <v-layout row class="pt-5 top-margin">
    <v-flex xs6 offset-xs3>
      <section class="page-head">
        <h1 id="introduction" class="display-1 primary--text">
          {{msg}}
        </h1>
        <div>
          <p>This page provides direct links to different sections of the app. It will be removed for production.
          <br/><br/>Also, none of this layout is permanent. All of it can be changed and modified to suit the end goal. This
            was simply made to provide a starting ground.</p>
        </div>
      </section>
      <section>
        <v-btn :to="{name: 'Login'}" flat>
          Login Page
        </v-btn>
        <v-btn :to="{name: 'Error'}" flat>
          Error Page
        </v-btn>
      </section>
      <h2 class="headline primary--text pt-4">Useful Links</h2>
      <section>
        <v-card>
          <v-container
            fluid
            style="min-height: 0;"
            grid-list-lg
          >
            <v-layout row wrap>
              <v-flex xs12>
                <v-card color="blue-grey darken-2" class="white--text">
                  <v-card-title primary-title>
                    <div class="headline">Vuetify Documentation</div>
                    <div>Vuetify.js is what enables us to easily apply a Material Theme design. The documentation for it
                     is quite good. Go here to see all the different widgets they have for use.</div>
                  </v-card-title>
                  <v-card-actions>
                    <a href="https://vuetifyjs.com/en/getting-started/quick-start" target="_blank">
                      <v-btn flat dark>Show me teh Docs!</v-btn>
                    </a>
                  </v-card-actions>
                </v-card>
              </v-flex>
              <v-flex xs12>
                <v-card color="blue-grey darken-2" class="white--text">
                  <v-card-title primary-title>
                    <div class="headline">YouTube Tutorial</div>
                    <div>This is a very long but in-depth series on how the entire stack will work together. It's what
                     I'm using to learn all this.</div>
                  </v-card-title>
                  <v-card-actions>
                    <a href="https://www.youtube.com/watch?v=Fa4cRMaTDUI&list=PLWKjhJtqVAbnadueQ-C5keMQQiQau_i0D"
                       target="_blank">
                      <v-btn flat dark>Video Tutorial</v-btn>
                    </a>
                  </v-card-actions>
                </v-card>
              </v-flex>
            </v-layout>
          </v-container>
        </v-card>
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
  margin-top: 58px;
}
</style>
