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
                  name="input-3-5"
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
                  name="input-10-1"
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

          <v-layout row>
            <v-flex xs8 offset-xs2>
              <p>{{ message }} </p>
            </v-flex>
          </v-layout>

          </v-form>
        </fieldset>
      </section>
    </v-flex>
  </v-layout>
</template>

<script>
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
      required: (value) => !!value || 'Required.',
    }
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
    login () {
      // Native form submission is not yet supported
      this.message = 'Login submission not yet supported. Username: ' + this.username + ' Password ' + this.password
      this.formHasErrors = false

      Object.keys(this.form).forEach(f => {
        if (!this.form[f]) this.formHasErrors = true

        this.$refs[f].validate(true)
      })
    },
    clear () {
      this.$refs.form.reset()
    },
    resetForm () {
      this.errorMessages = []
      this.formHasErrors = false

      Object.keys(this.form).forEach(f => {
        this.$refs[f].reset()
      })
    },
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .top-margin {
    margin-top: 40px;
  }
</style>
