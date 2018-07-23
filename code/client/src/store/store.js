import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate'

Vue.use(Vuex)

export default new Vuex.Store({
  strict: true,
  plugins: [
    createPersistedState()
  ],
  state: {
    token: null,
    user: {
      authlevel: 0,
      email: ''
    },
    isUserLoggedIn: false,
    showFields: [true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true]
  },
  mutations: {
    setToken (state, token) {
      state.token = token
      state.isUserLoggedIn = !!(token)
    },
    setUser (state, user) {
      state.user = user
    },
    clearUser (state) {
      state.user = {
        authlevel: 0,
        email: ''
      }
    },
    setFields (state, showFields) {
      state.showFields = showFields
    }
  },
  actions: {
    setToken ({commit}, token) {
      console.log('Setting token: ' + token)
      commit('setToken', token)
    },
    setUser ({commit}, user) {
      console.log('Setting user: ' + user)
      commit('setUser', user)
    },
    logout ({commit}) {
      console.log('logging out')
      commit('clearUser')
      commit('setToken', null)
    },
    setFields ({commit}, showFields) {
      console.log('Changing error form fields')
      commit('setFields', showFields)
    }
  },
  getters: {
    auth: state => {
      console.log('Someone wants the user ' + state.user.authlevel)
      return state.user.authlevel
    },
    showFields: state => state.showFields
  }
})
