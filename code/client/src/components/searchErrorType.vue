<template>
<v-card>
  <v-card-title>
    Search Error
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
      :items="errorTypes"
      :search="search"
      >
    <template slot="items" slot-scope="props">
      <td>{{ props.item.id }}</td>
      <td class="text-xs-center">{{ props.item.errorType }}</td>
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
import ErrorType from '@/services/ErrortypeService'
export default {
  data: () => ({
    search: '',
    errorTypes: [],
    id: '',
    generalComment: '',
    carbs: '',
    protein: '',
    headers: [
      {
        text: 'Error Type ID',
        align: 'left',
        sortable: true,
        value: 'id'
      },
      { text: 'Error Type', align: 'center', value: 'errorType' }
    ]
  }),
  created () {
    ErrorType.getAll()
      .then(function (res, err) {
        var i
        for (i = 0; i < res.data.length; i++) {
          console.log('Error Type search: ' + res.data[i].id)
          this.errorTypes.push({
            id: res.data[i].id,
            errorType: res.data[i].errorType
          })
        }
      }.bind(this))
  },
  methods: {
    editItem (id) {
      console.log('id in editItem' + id)
      this.$router.push('errortype?errorTypeId=' + id)
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
