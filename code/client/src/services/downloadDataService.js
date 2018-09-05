import Api from '@/services/Api'

export default {
  getAll (dateFrom, dateTo) {
    var url = '/api/v1/query/downloadData/'
    return Api().get(url, dateFrom, dateTo)
  }
}
