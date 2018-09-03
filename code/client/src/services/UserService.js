import Api from '@/services/Api'

export default {
  getAll () {
    return Api().get('auth/user')
  },
  getUser (userId) {
    var url = '/auth/user/' + userId
    return Api().get(url)
  },
  deleteUser (userId) {
    var url = '/auth/user/delete' + userId
    return Api().post(url)
  },
  create (user) {
    return Api().post('/auth/login/create', user)
  }
}
