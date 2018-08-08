<template>
  <v-card>
    <v-card-title>
      Search Workers
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
      :items="workers"
      :search="search"
    >
      <template slot="items" slot-scope="props">
        <td>{{ props.item.id }}</td>
        <td class="text-xs-center">{{ props.item.workerFirstName }}</td>
        <td class="text-xs-center">{{ props.item.workerSurname }}</td>
        <td class="text-xs-center">{{ props.item.WorkerRole }}</td>
        <td class="text-xs-center">{{ props.item.workerActive }}</td>
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
import Worker from '@/services/WorkerService'
export default {
  data: () => ({
    search: '',
    workers: [],
    id: '',
    generalComment: '',
    carbs: '',
    protein: '',
    headers: [
      {
        text: 'Worker ID',
        align: 'left',
        sortable: true,
        value: 'id'
      },
      { text: 'First Name', align: 'center', value: 'workerFirstName' },
      { text: 'Surname', align: 'center', value: 'workerSurname' },
      { text: 'Role', align: 'center', value: 'WorkerRole' },
      { text: 'Active', align: 'center', value: 'workerActive' }
    ]
  }),
  created () {
    Worker.getAll()
      .then(function (res, err) {
        var i
        for (i = 0; i < res.data.length; i++) {
          console.log(res.data)
          this.workers.push({
            id: res.data[i].id,
            workerFirstName: res.data[i].workerFirstName,
            workerSurname: res.data[i].workerSurname,
            WorkerRole: res.data[i].WorkerRole,
            workerActive: res.data[i].workerActive
          })
        }
      }.bind(this))
  },
  methods: {
    editItem (id) {
      this.$router.push('/worker?workerId=' + id)
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
