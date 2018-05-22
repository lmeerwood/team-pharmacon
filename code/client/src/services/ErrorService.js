import Api from '@/services/Api'

export default {
  logError (error) {
    return Api().post('/api/v1/query/error', error)
  }
}
