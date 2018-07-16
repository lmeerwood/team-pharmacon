<template>
  <div>
    <v-toolbar flat color="gray">
      <v-toolbar-patientId>Search Errors</v-toolbar-patientId>
      <v-divider
        class="mx-2"
        inset
        vertical
      ></v-divider>
      <v-spacer></v-spacer>
      <v-dialog v-model="dialog" max-width="500px">
        <v-btn slot="activator" color="primary" dark class="mb-2">New Error</v-btn>
        <v-card>
          <v-card-patientId>
            <span class="headline">{{ formpatientId }}</span>
          </v-card-patientId>

          <v-card-text>
            <v-container grid-list-md>
              <v-layout wrap>
                <v-flex xs12 sm6 md4>
                  <v-text-field v-model="errorItem.name" label="Dessert name"></v-text-field>
                </v-flex>
                <v-flex xs12 sm6 md4>
                  <v-text-field v-model="errorItem.calories" label="Calories"></v-text-field>
                </v-flex>
                <v-flex xs12 sm6 md4>
                  <v-text-field v-model="errorItem.fat" label="Fat (g)"></v-text-field>
                </v-flex>
                <v-flex xs12 sm6 md4>
                  <v-text-field v-model="errorItem.carbs" label="Carbs (g)"></v-text-field>
                </v-flex>
                <v-flex xs12 sm6 md4>
                  <v-text-field v-model="errorItem.protein" label="Protein (g)"></v-text-field>
                </v-flex>
              </v-layout>
            </v-container>
          </v-card-text>

          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="blue darken-1" flat @click.native="close">Cancel</v-btn>
            <v-btn color="blue darken-1" flat @click.native="save">Save</v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-toolbar>
    <v-data-table
      :headers="headers"
      :items="errors"
      hide-actions
      class="elevation-1"
    >
      <template slot="items" slot-scope="props">
        <td>{{ props.item.name }}</td>
        <td class="text-xs-right">{{ props.item.id }}</td>
        <td class="text-xs-right">{{ props.item.patientId }}</td>
        <td class="text-xs-right">{{ props.item.date }}</td>
        <td class="text-xs-right">{{ props.item.errorComment }}</td>
        <td class="text-xs-right">{{ props.item.errorType }}</td>
        <td class="justify-left layout px-0">
          <v-icon
            small
            class="mr-2"
            @click="editItem(props.item)"
          >
            edit
          </v-icon>
          <v-icon
            small
            @click="deleteItem(props.item)"
          >
            delete
          </v-icon>
        </td>
      </template>
      <template slot="no-data">
        <v-btn color="primary" @click="initialize">Reset</v-btn>
      </template>
    </v-data-table>
  </div>
</template>

<script>
import ErrorService from '@/services/ErrorService'
export default {
    data: () => ({
      dialog: false,
      headers: [
        {
          text: 'Errors',
          align: 'left',
          sortable: false,
          value: 'name'
        },
        { text: 'Error ID', value: 'id'},
        { text: 'patient ID', value: 'patientId' },
        { text: 'Date', value: 'errorDate' },
        { text: 'Error Comment', value: 'generalComment' },
        { text: 'Physician Notified', value: 'wasPhysicianNotified' }
      ],
      errors: [],
      errorIndex: -1,
      errorItem: {
        id: 0,
        patientId: '',
        date: 0,
        errorComment: 0,
        physicianNotified: 0
      },
      defaultItem: {
        id: 0,
        patientId: '',
        date: 0,
        errorComment: 0,
        physicianNotified: 0
      }
    }),

    computed: {
      formpatientId () {
        return this.errorIndex === -1 ? 'New Item' : 'Edit Item'
      }
    },

    watch: {
      dialog (val) {
        val || this.close()
      }
    },

    created () {
      this.initialize()
    },

    methods: {
      initialize () {
        ErrorService.getAll()
         .then(function (res, err) {
          this.errors = []
          var i
          for (i = 0; i < res.data.length; i++) {
          this.errors.push({
            id: res.data[i].id,
            patientId: res.data[i].patientId,
            date: res.data[i].errorDate,
            error: res.data[i].generalComment,
            physicianNotified: res.data[i].wasPhysicianNotified
            })
          }
          // Sort the array by the text field rather than the value
          this.errors.sort(function (a, b) {
          })
        }.bind(this))
      },

      editItem (item) {
        this.errorIndex = this.errors.indexOf(item)
        this.errorItem = Object.assign({}, item)
        this.dialog = true
      },

      deleteItem (item) {
        const index = this.errors.indexOf(item)
        confirm('Are you sure you want to delete this item?') && this.errors.splice(index, 1)
      },

      close () {
        this.dialog = false
        setTimeout(() => {
          this.errorItem = Object.assign({}, this.defaultItem)
          this.errorIndex = -1
        }, 300)
      },

      save () {
        if (this.errorIndex > -1) {
          Object.assign(this.errors[this.errorIndex], this.errorItem)
        } else {
          this.errors.push(this.errorItem)
        }
        this.close()
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
