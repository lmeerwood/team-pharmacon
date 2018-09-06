import Api from '@/services/Api'

export default {
  getAll (dates) {
    var url = '/api/v1/query/export'
    return Api().post(url, dates)
  }
}
