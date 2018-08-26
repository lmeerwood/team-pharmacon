<template>
<v-card>
  <v-card-title>
    Search Medication Types
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
      :items="medicationTypes"
      :search="search"
      >
    <template slot="items" slot-scope="props">
      <td>{{ props.item.id }}</td>
      <td class="text-xs-center">{{ props.item.medicationType }}</td>
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
import MedicationType from '@/services/MedicationtypeService'
export default {
  data: () => ({
    search: '',
    medicationTypes: [],
    id: '',
    generalComment: '',
    carbs: '',
    protein: '',
    headers: [
      {
        text: 'Medication Type ID',
        align: 'left',
        sortable: true,
        value: 'id'
      },
      { text: 'Medication Type', align: 'center', value: 'medicationType' }
    ]
  }),
  created () {
    MedicationType.getAll()
      .then(function (res, err) {
        var i
        for (i = 0; i < res.data.length; i++) {
          console.log('Medication Type search: ' + res.data[i].id)
          this.medicationTypes.push({
            id: res.data[i].id,
            medicationType: res.data[i].medicationType
          })
        }
      }.bind(this))
  },
  methods: {
    editItem (id) {
      console.log('id in editItem' + id)
      this.$router.push('medicationType?medicationTypeId=' + id)
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
