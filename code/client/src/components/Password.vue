<template>
  <v-layout row class="pt-5 top-margin">
    <v-flex xs6 offset-xs3>
      <section class="page-head">
        <h1 id="introduction" class="display-1 primary--text">
          {{msg}}
        </h1>
        <fieldset class="white">
          <v-form v-model="valid" ref="form" lazy-validation>
            <v-container fluid>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Login"
                    v-model="login"
                    readonly
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Password"
                    v-model="password"
                    :type="'password'"
                    :rules="[ (password.length >= 8 && password.length <= 25 ) || 'Please enter a password between 8 and 25 characters']"
                    required
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs12 >
                <v-alert :value="errorMessage" type="error">
                  {{ errorMessage }}
                </v-alert>
                <v-alert :value="message" type="success">
                  {{ message }}
                </v-alert>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-btn
                    round
                    color="primary"
                    dark
                    @click="submit"
                  >Submit
                  </v-btn>
                  <v-btn
                    round
                    color="red"
                    dark
                    @click="returnToUserSearch"
                  >Cancel
                  </v-btn>
                </v-flex>
              </v-layout>

            </v-container>
          </v-form>
        </fieldset>
      </section>
    </v-flex>
  </v-layout>
</template>

<script>
import UserService from '@/services/UserService'

export default {
  data: () => ({
    menu: false,
    msg: 'Change Password',
    loading: false,
    errorMessage: '',
    message: '',

    // Variables to store inputted values
    valid: true,
    login: '',
    password: ''
  }),
  created () {
    this.login = this.$route.query.login
  },
  methods: {
    async submit () {
      this.errorMessage = ''
      this.message = ''
      if (this.validForm()) {
        try {
          await UserService.changePassword({
            username: this.login,
            password: this.password
          })
          this.clear()
          this.message = 'Form submitted successfully!'
          setTimeout(function () {
            this.returnToUserSearch()
          }.bind(this), 500)
        } catch (error) {
          this.errorMessage = error.response.data.error
        }
      } else {
        this.errorMessage = 'There was an error with your form.'
      }
    },
    clear: function () {
      this.$refs.form.reset()
      this.password = ''
      this.login = ''
      this.message = ''
      this.errorMessage = ''
    },
    validForm: function () {
      return this.$refs.form.validate()
    },
    returnToUserSearch () {
      this.$router.push('/searchUser')
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
