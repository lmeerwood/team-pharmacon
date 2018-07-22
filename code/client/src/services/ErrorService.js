import Api from '@/services/Api'

export default {
  logError (error) {
    return Api().post('/api/v1/query/error', error)
  },
  getAll () {
    return Api().get('/api/v1/query/error')
  },
  getError (errorId) {
    var url = '/api/v1/query/error/' + errorId
    return Api().get(url)
  }
}
