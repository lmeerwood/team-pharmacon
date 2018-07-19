import Api from '@/services/Api'

export default {
  logError (error) {
    return Api().post('/api/v1/query/error', error)
  },

  getError (errorId) {
    var url = '/api/v1/query/error' + errorId
    return Api().get(url)
  }
}
