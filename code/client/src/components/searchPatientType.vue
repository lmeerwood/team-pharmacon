<template>
<v-card>
  <v-card-title>
    Search Patient Types
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
      :items="patientTypes"
      :search="search"
      >
    <template slot="items" slot-scope="props">
      <td>{{ props.item.id }}</td>
      <td class="text-xs-center">{{ props.item.patientType }}</td>
      <td class="justify-left layout px-0">
        <v-icon
          small
          class="mr-4"
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
import PatientType from '@/services/PatienttypeService'
export default {
  data: () => ({
    search: '',
    patientTypes: [],
    id: '',
    generalComment: '',
    carbs: '',
    protein: '',
    headers: [
      {
        text: 'Patient Type ID',
        align: 'left',
        sortable: true,
        value: 'id'
      },
      { text: 'Patient Type', align: 'center', value: 'patientType' }
    ]
  }),
  created () {
    PatientType.getAll()
      .then(function (res, err) {
        var i
        for (i = 0; i < res.data.length; i++) {
          console.log('Patient Type search: ' + res.data[i].id + ' & ' + res.data[i].patientType)
          this.patientTypes.push({
            id: res.data[i].id,
            patientType: res.data[i].patientType
          })
        }
      }.bind(this))
  },
  methods: {
    editItem (id) {
      console.log('Search Patient Type - id in editItem ' + id)
      this.$router.push('patienttype?patientTypeId=' + id)
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
