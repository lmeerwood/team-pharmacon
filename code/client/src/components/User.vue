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
                    :rules="[rules.required, rules.alpha]"
                    required
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-text-field
                    label="Password"
                    v-model="password"
                    :rules="[rules.required, rules.alphaNum, (password.length >= 8 && password.length <= 25 ) || 'Please enter a password between 8 and 25 characters']"
                    required
                  ></v-text-field>
                </v-flex>
              </v-layout>

              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <h4>Permission Level</h4>
                </v-flex>
              </v-layout>
              <v-layout row>
                <v-flex xs8 offset-xs2>
                  <v-radio-group v-model="authlevel" :mandatory="true" row="row">
                    <v-radio label="Normal" value="1"></v-radio>
                    <v-radio label="Administrator" value="2"></v-radio>
                  </v-radio-group>
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
    msg: 'Add New User',
    loading: false,
    errorMessage: '',
    message: '',

    // Variables to store inputted values
    valid: true,
    login: '',
    password: '',
    authlevel: '1',
    rules: {
      required: value => !!value || 'This field is required',
      alpha: value => {
        const pattern = /^([a-zA-Z]+)$/
        return pattern.test(value) || 'Alpha field only'
      },
      alphaNum: value => {
        const pattern = /^([a-zA-Z0-9]+)$/
        return pattern.test(value) || 'Alpha numeric field only'
      }
    }
  }),
  methods: {
    async submit () {
      this.errorMessage = ''
      this.message = ''
      if (this.validForm()) {
        try {
          await UserService.create({
            email: this.login,
            password: this.password,
            authlevel: this.authlevel
          })
          this.clear()
          this.authlevel = '1'
          this.message = 'Form submitted successfully!'
        } catch (error) {
          this.errorMessage = error.response.data.error
        }
      } else {
        this.errorMessage = 'There was an error with your form.'
      }
    },
    clear: function () {
      this.$refs.form.reset()
      this.message = ''
      this.errorMessage = ''
    },
    validForm: function () {
      return this.$refs.form.validate()
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
