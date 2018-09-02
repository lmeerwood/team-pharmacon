import Api from '@/services/Api'

export default {
  getAll () {
    return Api().get('/api/v1/query/errortype')
  },
  addErrorType (errorType) {
    return Api().post('/api/v1/query/errortype', errorType)
  },
  getErrorType (errorTypeId) {
    var url = '/api/v1/query/errortype/' + errorTypeId
    return Api().get(url)
  },
  updateErrorType (errorTypeId, errorType) {
    var url = '/api/v1/query/errortype/' + errorTypeId
    return Api().post(url, errorType)
  },
  isErrorTypeValid (errorType) {
    var url = '/api/v1/query/errortype/isvalid/' + errorType
    return Api().get(url)
  }
}
