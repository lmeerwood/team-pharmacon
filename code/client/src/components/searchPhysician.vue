<template>
  <v-card>
    <v-card-title>
      Search Physicians
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
      :items="physician"
      :search="search"
    >
      <template slot="items" slot-scope="props">
        <td>{{ props.item.id }}</td>
        <td class="text-xs-center">{{ props.item.physicianSurname }}</td>
        <td class="text-xs-center">{{ props.item.physicianFirstName }}</td>
        <td class="text-xs-center">{{ props.item.providerNumber }}</td>
        <td class="text-xs-center">{{ props.item.physicianComment }}</td>
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
import Physician from '@/services/PhysicianService'
export default {
  data: () => ({
    search: '',
    physician: [],
    id: '',
    generalComment: '',
    carbs: '',
    protein: '',
    headers: [
      {
        text: 'Physician ID',
        align: 'left',
        sortable: true,
        value: 'id'
      },
      { text: 'Surname', align: 'center', value: 'physicianSurname' },
      { text: 'First Name', align: 'center', value: 'physicianFirstName' },
      { text: 'Provider No.', align: 'center', value: 'providerNumber' },
      { text: 'Comment', align: 'center', value: 'physicianComment' }
    ]
  }),
  created () {
    Physician.getAll()
      .then(function (res, err) {
        var i
        for (i = 0; i < res.data.length; i++) {
          console.log(res.data)
          this.physician.push({
            id: res.data[i].id,
            physicianSurname: res.data[i].physicianSurname,
            physicianFirstName: res.data[i].physicianFirstName,
            providerNumber: res.data[i].providerNumber,
            physicianComment: res.data[i].physicianComment
          })
        }
      }.bind(this))
  },
  methods: {
    editItem (id) {
      this.$router.push('/physician?physicianId=' + id)
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
