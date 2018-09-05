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
              <v-flex xs8 offset-xs1>
              <v-menu
                  ref="datePickerFrom"
                  :close-on-content-click="false"
                  v-model="datePickerFrom"
                  :nudge-right="40"
                  :return-value.sync="dateFrom"
                  lazy
                  transition="scale-transition"
                  offset-y
                  full-width
                  min-width="290px"
                >
                  <v-text-field
                    slot="activator"
                    v-model="dateFrom"
                    label="Date from..."
                    prepend-icon="event"
                    :rules="[() => !!dateFrom || 'This field is required']"
                    required
                    readonly
                  ></v-text-field>
                  <v-date-picker v-model="dateFrom" @input="$refs.datePickerFrom.save(dateFrom)"></v-date-picker>
                </v-menu>
              </v-flex>
              </v-layout>

            <v-layout row>
                <v-flex xs8 offset-xs1>
                <v-menu
                  ref="datePickerTo"
                  :close-on-content-click="false"
                  v-model="datePickerTo"
                  :nudge-right="40"
                  :return-value.sync="dateTo"
                  lazy
                  transition="scale-transition"
                  offset-y
                  full-width
                  min-width="290px"
                >
                  <v-text-field
                    slot="activator"
                    v-model="dateTo"
                    label="Date to..."
                    prepend-icon="event"
                    :rules="[() => !!dateTo || 'This field is required']"
                    required
                    readonly
                  ></v-text-field>
                  <v-date-picker v-model="dateTo" @input="$refs.datePickerTo.save(dateTo)"></v-date-picker>
                </v-menu>
                </v-flex>
              </v-layout>

            <v-layout row>
              <v-flex xs8 offset-xs2>
                <download-excel
                  class = "btn btn-default"
                  :data = "json_data"
                  :fields = "json_fields"
                  type = "csv"
                  name = "filename.xls">
                  Export
                </download-excel>
                <v-btn
                  color="secondary"
                  dark
                  @click="clear">
                  Cancel
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
import downloadDataService from '@/services/downloadDataService'

export default {
  data: () => ({
    menu: false,
    msg: 'Download Errors Within Date Range of...',
    loading: false,
    errorMessage: '',
    message: '',

    // Variables to hold menu helpers
    datePickerFrom: false,
    datePickerTo: false,

    // Variables to store input values
    valid: true,
    dateFrom: '',
    dateTo: '',
    json_fields: {
      // fields to be entered here
    },
    json_data: [{
      // data goes here
    }],
    json_meta: [{
      key: 'charset',
      value: 'utf-8'
    }]
  }),
  methods: {
    async submit () {
      this.errorMessage = ''
      this.message = ''
      var fromDate = this.dateFrom.valueOf()
      var toDate = this.dateTo.valueOf()

      if (this.validForm()) {
        console.log('inside download. dateFrom: ' + fromDate + ' dateTo: ' + toDate)
        try {
          await downloadDataService.getAll(fromDate, toDate)
          this.clear()
          this.message = 'Records successfully downloaded!'
        } catch (error) {
          this.errorMessage = error.response.data.downloadData
        }
      } else {
        this.errorMessage = 'There was an error with your form.'
      }
    },
    clear: function () {
      this.$router.push({
        name: 'adminWelcome'
      })
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
