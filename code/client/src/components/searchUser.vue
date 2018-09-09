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
        <v-dialog v-model="dialogDelete[props.item.id]" width="500" v-if="!loggedInUser(props.item.user)">
          <v-btn
            slot="activator"
            color="red lighten-2"
            dark
            @click="$set(dialogDelete, props.item.id, true)"
            >
              Delete User
            </v-btn>

            <v-card>
              <v-card-title class="headline red lighten-2" primary-title>
                Delete User: {{ props.item.user }}
              </v-card-title>

              <v-card-text>
                Are you sure you want to delete the user {{ props.item.user }}? This action cannot be undone!
              </v-card-text>

              <v-divider></v-divider>

              <v-card-actions>
                <v-btn
                  color="gray lighten-1"
                  dark
                  @click="$set(dialogDelete, props.item.id, false)"
                >
                  Cancel
                </v-btn>
                <v-spacer></v-spacer>
                <v-btn
                  color="red lighten-1"
                  dark
                  @click="deleteItem(props.item.id)"
                >
                  Delete User
                </v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>

          <v-snackbar
            v-model="snackbar"
            :bottom= true
            :timeout="3000"
          >
            User {{ props.item.user }} deleted.
          </v-snackbar>
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
import {mapGetters} from 'vuex'
export default {

  computed: mapGetters([
    'getUser'
  ]),

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
    dialogDelete: {},
    snackbar: false
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
      this.dialogDelete[id] = false
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
      this.snackbar = true
    },

    loggedInUser (user) {
      return this.getUser === user
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
