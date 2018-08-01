import Api from '@/services/Api'

export default {
  create (user) {
    return Api().post('/auth/login/create', user)
  }
}
