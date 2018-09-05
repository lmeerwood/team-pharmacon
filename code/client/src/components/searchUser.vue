<template>
<v-card>
  <v-card-title>
    Search Users
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
      :items="Users"
      :search="search"
      >
    <template slot="items" slot-scope="props">
      <td>{{ props.item.id }}</td>
      <td class="text-xs-center">{{ props.item.user }}</td>
      <td class="text-xs-center">{{ props.item.authlevel }}</td>
      <td class="justify-right layout px-0">
        <v-btn
          slot="activator"
          color="red lighten-2"
          dark
          @click="deleteItem(props.item.id)"
          >
          Delete User
          </v-btn>
        </td>
      </template>
      <v-alert slot="no-results" :value="true" color="error" icon="warning">
        Your search for "{{ search }}" found no results.
      </v-alert>
    </v-data-table>
  </v-card>
</template>

<script>
import UserService from '@/services/UserService'
export default {
  data: () => ({
    search: '',
    Users: [],
    id: '',
    generalComment: '',
    carbs: '',
    protein: '',
    headers: [
      {
        text: 'User ID',
        align: 'left',
        sortable: true,
        value: 'id'
      },
      { text: 'User Name', align: 'center', value: 'user' },
      { text: 'Authentication Level', align: 'center', value: 'authlevel' }
    ],
    dialog: false
  }),
  created () {
    UserService.getAll()
      .then(function (res, err) {
        var i
        for (i = 0; i < res.data.length; i++) {
          console.log('User search: ' + res.data[i].id)
          this.Users.push({
            id: res.data[i].id,
            user: res.data[i].username,
            authlevel: res.data[i].authlevel
          })
        }
      }.bind(this))
  },
  methods: {
    deleteItem (id) {
      UserService.deleteUser(id).then(function (res, err) {
        while (this.Users.length > 0) { this.Users.pop() }
        UserService.getAll()
          .then(function (res, err) {
            for (var j = 0; j < res.data.length; j++) {
              console.log('repopulating user: ' + res.data[j].id)
              this.Users.push({
                id: res.data[j].id,
                user: res.data[j].username,
                authlevel: res.data[j].authlevel
              })
            }
          }.bind(this))
      }.bind(this))
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
