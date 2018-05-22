import Api from '@/services/Api'

export default {
  login (credentials) {
    return Api().post('/auth/login', credentials)
  }
}
