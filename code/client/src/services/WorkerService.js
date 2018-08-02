import Api from '@/services/Api'

export default {
  getAll () {
    return Api().get('/api/v1/query/worker')
  },
  getWorker (workerId) {
    var url = '/api/v1/query/worker/' + workerId
    return Api().get(url)
  },
  updateWorker (workerId, worker) {
    var url = '/api/v1/query/worker/' + workerId
    return Api().post(url, worker)
  }
}
