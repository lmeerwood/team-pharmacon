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
      username: ''
    },
    isUserLoggedIn: false
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
        username: ''
      }
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
    }
  },
  getters: {
    auth: state => {
      console.log('Someone wants the user ' + state.user.authlevel)
      return state.user.authlevel
    },
    getUser: state => {
      return state.user.username
    }
  }
})
