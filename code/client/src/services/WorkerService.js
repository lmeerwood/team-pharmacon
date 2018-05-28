import Api from '@/services/Api'

export default {
  getAll () {
    return Api().get('/api/v1/query/worker')
  }
}
