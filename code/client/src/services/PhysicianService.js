import Api from '@/services/Api'

export default {
  logPhysician (physician) {
    return Api().post('/api/v1/query/physician', physician)
  },
  getAll () {
    return Api().get('/api/v1/query/physician')
  },
  getPhysician (physicianId) {
    var url = '/api/v1/query/physician/' + physicianId
    return Api().get(url)
  },
  updatePhysician (physicianId, physician) {
    var url = '/api/v1/query/physician/' + physicianId
    return Api().post(url, physician)
  }
}
