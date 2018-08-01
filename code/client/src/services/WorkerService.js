import Api from '@/services/Api'

export default {
  getAll () {
    return Api().get('/api/v1/query/worker')
  }
  logWorker (worker) {
    return Api().post('/api/v1/query/worker', worker)
  },
  getWorker (workerId) {
    var url = '/api/v1/query/worker/' + workerId
    return Api().get(url)
  }
}
