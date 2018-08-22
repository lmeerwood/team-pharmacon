<template>
  <v-layout  row class="pt-5 top-margin">
    <v-flex xs6 offset-xs3>
      <section class="page-head">
        <h1 id="introduction" class="display-1 primary--text">
          {{msg}}
        </h1>

        <fieldset class="white">
          <v-form v-model="valid" ref="form" lazy-validation>
          <v-container fluid>

            <v-layout row>
              <v-flex xs4>
                <v-subheader><b>Enter Username</b></v-subheader>
                </v-flex>
                <v-flex xs8>
                  <v-text-field
                  name="username"
                  label="Username"
                  v-model="username"
                  :rules="[() => !!username || 'This field is required']"
                  :error-messages="errorMessages"
                  required
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
                  name="password"
                  label="Enter your password"
                  hint="At least 8 characters"
                  v-model="password"
                  min="8"
                  :append-icon="e1 ? 'visibility' : 'visibility_off'"
                  :append-icon-cb="() => (e1 = !e1)"
                  :type="e1 ? 'password' : 'text'"
                  :rules="[() => !!password || 'This field is required']"
                  :error-messages="errorMessages"
                  required
                  counter
                  ></v-text-field>
                </v-flex>
              </v-layout>
          </v-container>

          <div class="text-xs-center">
            <v-btn
              round color="primary"
              dark
              @click="login"
              :disabled="!valid"
            >Login
            </v-btn>
            <v-btn
              round color="secondary"
              dark @click="clear"
            >Clear
            </v-btn>
            <v-slide-x-reverse-transition>
              <v-tooltip
              v-if="formHasErrors"
              left
            >
              <v-btn
                slot="activator"
                icon
                class="my-0"
                @click="resetForm"
              >
                <v-icon>refresh</v-icon>
              </v-btn>
              <span>Refresh form</span>
              </v-tooltip>
            </v-slide-x-reverse-transition>
          </div>

          <br/>
          <v-alert :value="error" type="error" v-html='error'>
            This is a error alert.
          </v-alert>
          <br/>

          </v-form>
        </fieldset>
      </section>
    </v-flex>
  </v-layout>
</template>

<script>
import AuthenticationService from '@/services/AuthenticationService'

export default {
  data: () => ({
    msg: 'Please Login',
    e1: true,
    username: '',
    password: '',
    valid: true,
    message: '',
    errorMessages: [],
    rules: {
      required: (value) => !!value || 'Required.'
    },
    error: null,
    formHasErrors: false
  }),
  computed: {
    form () {
      return {
        username: this.username,
        password: this.password
      }
    }
  },
  watch: {
    username () {
      this.errorMessages = []
    },
    password () {
      this.errorMessages = []
    }
  },
  methods: {
    async login () {
      this.error = null
      /* Object.keys(this.form).forEach(f => {
        if (!this.form[f]) this.formHasErrors = true
        this.$refs[f].validate(true)
      })
      */
      if (!this.formHasErrors) {
        try {
          const response = await AuthenticationService.login({
            username: this.username,
            password: this.password
          })
          this.$store.dispatch('setToken', response.data.token)
          this.$store.dispatch('setUser', response.data.user)
          var authlevel = this.$store.state.user.authlevel
          // checks if user is admin or standard user
          if (authlevel === 2) {
            this.$router.push({
              name: 'adminWelcome'
            })
          } else {
            this.$router.push({
              name: 'Error'
            })
          }
        } catch (error) {
          this.error = error.response.data.error
        }
      }
    },
    clear () {
      this.$refs.form.reset()
      this.error = ''
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
