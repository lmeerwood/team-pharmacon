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
                <v-subheader><b>{{currentuser}}</b></v-subheader>
                </v-flex>
                <v-flex xs8>
                  <v-text-field
                  name="email"
                  label="Email"
                  v-model="email"
                  :rules="[() => !!email || 'This field is required']"
                  :error-messages="errorMessages"
                  required
                  single-line
                  ></v-text-field>
                </v-flex>
              </v-layout>

            <v-layout row>
              <v-flex xs4>
                <v-subheader><b>Enter Old Password</b></v-subheader>
                </v-flex>
                <v-flex xs8>
                  <v-text-field
                  name="oldpassword"
                  label="Enter your old password"
                  hint="Password you currently use to login with"
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

              <v-layout row>
              <v-flex xs4>
                <v-subheader><b>Enter New Password</b></v-subheader>
                </v-flex>
                <v-flex xs8>
                  <v-text-field
                  name="newpassword"
                  label="Enter your new password"
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

              <v-layout row>
              <v-flex xs4>
                <v-subheader><b>Re-enter New Password</b></v-subheader>
                </v-flex>
                <v-flex xs8>
                  <v-text-field
                  name="comparepassword"
                  label="Please enter your new password again"
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
              @click="resetPassword"
              :disabled="!valid"
            >Save
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
import PasswordService from '@/services/PasswordService'

export default {
  data: () => ({
    msg: 'Change Password',
    e1: true,
    email: '',
    oldpassword: '',
    newpassword: '',
    comparepassword: '',
    valid: true,
    message: '',
    errorMessages: [],
    rules: {
      required: (value) => !!value || 'Required.'
    },
    error: null,
    formHasErrors: false
  }),
  created () {
    if (this.$route.query.userId) {
      PasswordService.getUser(this.$route.query.userId)
        .then(function (res, err) {
          this.email = res.data.email
        }.bind(this))
    }
  },
  methods: {
    async resetPassword () {
      if (this.validForm()) {
        try {
          await PasswordService.changePassword({
            email: this.email,
            password: this.oldpassword,
            newPassword: this.newpassword,
            comparePassword: this.comparepassword
          })

          // this.$store.dispatch('setToken', response.data.token)
          // this.$store.dispatch('setUser', response.data.user)
          // this.$router.push({
          //   name: 'Error'
        } catch (error) {
          console.log('YOU DUMB ASS THERE IS AN ERROR ' + error)
        }
      } else {
        console.log('There are errors with the change password form')
      }
    },
    validForm: function () {
      return this.$refs.form.validate()
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