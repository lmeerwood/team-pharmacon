<template>
  <v-card>
    <v-card-title>
      Search Errors
      <v-spacer></v-spacer>
      <v-text-field
        v-model="search"
        append-icon="search"
        label="Search"
        single-line
        hide-details
      ></v-text-field>
    </v-card-title>
    <v-data-table
      :headers="headers"
      :items="errors"
      :search="search"
    >
      <template slot="items" slot-scope="props">
        <td>{{ props.item.id }}</td>
        <td class="text-xs-center">{{ props.item.generalComment }}</td>
        <td class="text-xs-center">{{ props.item.errorDate }}</td>
        <td class="text-xs-center">{{ props.item.errorTime }}</td>
        <td class="text-xs-center">{{ props.item.patientName }}</td>
        <td class="text-xs-center">{{ props.item.physicianName }}</td>
        <td class="justify-left layout px-0">
          <v-icon
            small
            class="mr-2"
            @click="editItem(props.item.id)"
          >
            edit
          </v-icon>
        </td>
      </template>
      <v-alert slot="no-results" :value="true" color="error" icon="warning">
        Your search for "{{ search }}" found no results.
      </v-alert>
    </v-data-table>
  </v-card>
</template>

<script>
import Error from '@/services/ErrorService'
  export default {
    data: () => ({
        search: '',
        errors: [],
        id: '',
        generalComment: '',
        carbs: '',
        protein: '',
        headers: [
          {
            text: 'Error ID',
            align: 'left',
            sortable: true,
            value: 'id'
          },
            { text: 'General Comment', align: 'center', value: 'generalComment' },
            { text: 'Error Date', align: 'center', value: 'errorDate' },
            { text: 'Error Time', align: 'center', value: 'errorTime' },
            { text: 'Patient', align: 'center', value: 'patientName' },
            { text: 'Physician', align: 'center', value: 'physicianName' }
        ],
      }),
        created () {
        Error.getAll()
        .then(function (res, err) {
          var i
          for (i = 0; i < res.data.length; i++) {
            console.log(res.data)
            if (res.data[i].physician){
              this.errors.push({
                id: res.data[i].id,
                generalComment: res.data[i].generalComment,
                errorDate: res.data[i].errorDate,
                errorTime: res.data[i].errorTime,
                patientName: res.data[i].patient.patientFirstName + " " + res.data[i].patient.patientSurname,
                physicianName: res.data[i].physician.physicianFirstName + " " + res.data[i].physician.physicianSurname
              })
            }
            else {
              this.errors.push({
                id: res.data[i].id,
                generalComment: res.data[i].generalComment,
                errorDate: res.data[i].errorDate,
                errorTime: res.data[i].errorTime,
                patientName: res.data[i].patient.patientFirstName + " " + res.data[i].patient.patientSurname,
                physicianName: " " 
              })
            }
          }
        }.bind(this))
      }
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.top-margin {
  margin-top: 40px;
}
</style>
