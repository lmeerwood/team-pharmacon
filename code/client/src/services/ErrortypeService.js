import Api from '@/services/Api'

export default {
  getAll () {
    return Api().post('/api/v1/query/errortype')
  }
}
