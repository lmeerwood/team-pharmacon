import Api from '@/services/Api'

export default {
  getHiddenFields (index) {
    var url = '/api/v1/query/hiddenFields/' + index
    return Api().get(url)
  },
  updateHiddenFields (index, hiddenFields) {
    var url = '/api/v1/query/hiddenFields/' + index
    return Api().post(url, hiddenFields)
  }
}
