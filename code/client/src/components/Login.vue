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
              <v-flex xs4>
                <v-subheader><b>Enter Username</b></v-subheader>
                </v-flex>
                <v-flex xs8>
                  <v-text-field
                  name="input-3-5"
                  label="Username"
                  single-line
                  ></v-text-field>
                </v-flex>
              </v-layout>
            <v-layout row>
              <v-flex xs4>
                <v-subheader><b>Enter Password</b></v-subheader>
                </v-flex>
                <v-flex xs8>
                  <v-text-field
                  name="input-3-5"
                  label="Password"
                  single-line
                  ></v-text-field>
                </v-flex>
              </v-layout>
          </v-container>
          <div class="text-xs-center">
            <v-btn round color="primary" dark>Login</v-btn>
          </div>
        </fieldset>
      </section>
    </v-flex>
  </v-layout>
</template>

<script>
export default {
  name: 'Login',
  data () {
    return {
      msg: 'Please Login'
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
